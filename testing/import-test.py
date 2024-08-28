import yaml
import importlib
import importlib_metadata
import sys
import logging
from io import StringIO

# Set up a stream handler to capture log output
log_stream = StringIO()
console_handler = logging.StreamHandler(sys.stdout)
capture_handler = logging.StreamHandler(log_stream)
file_handler = logging.FileHandler("import_log.log")  # Log file

# Configure logging
formatter = logging.Formatter("%(levelname)s: import %(message)s")
console_handler.setFormatter(formatter)
capture_handler.setFormatter(formatter)
file_handler.setFormatter(formatter)

logging.basicConfig(
    level=logging.DEBUG, handlers=[console_handler, capture_handler, file_handler]
)
logger = logging.getLogger()

# Manual mapping of package names to their import names
package_to_import_map = {
    "scikit-learn": "sklearn",
    "scikit-image": "skimage",
    "dask-core": "dask",
    "pytorch": "torch",
    "cupy-core": "cupy",
    "faiss-gpu": "faiss",
    "python-igraph": "igraph",
    # Add more mappings as needed
    # Leave value blank to skip
    "python": "",
    "ipkernel": "",
    "jupyter-cache": "",
    "nbformat": "",
    "nbclient": "",
    "pytorch-cuda": "",
    "jupyter-cache": "",
    "black-jupyter": "",
}


def load_environment_yaml(file_path):
    with open(file_path, "r") as file:
        return yaml.safe_load(file)


def get_packages_from_dependencies(dependencies):
    packages = []
    for item in dependencies:
        if isinstance(item, str):
            # Handle cases like 'bioconda::pydeseq2', 'numpy>1.23'
            package = item.split("::")[-1]  # Remove channel prefix if present
            package = package.split("=")[0]  # Remove version constraint '='
            package = package.split(">")[0]  # Remove version constraint '>'
            package = package.split("<")[0]  # Remove version constraint '<'
            packages.append(package)
        elif isinstance(item, dict) and "pip" in item:
            # Handle pip dependencies
            for pip_package in item["pip"]:
                pip_package = pip_package.split("=")[0]
                packages.append(pip_package)
    return packages


def get_top_level_import(package_name):
    try:
        distribution = importlib_metadata.distribution(package_name)
        top_level_modules = distribution.read_text("top_level.txt").splitlines()
        if top_level_modules:
            return top_level_modules[0]  # Return the first top-level module
    except Exception as e:
        logger.debug(f"Could not determine top-level import for {package_name}: {e}")
    return None


def check_import(package):
    import_name = package

    try:
        # 1. First, try to import the package directly by its name
        importlib.import_module(import_name)
        logger.info(f"{import_name} ---> success")
        return
    except ImportError:
        logger.debug(f"Direct import failed for {import_name}")

    try:
        # 2. Next, try to import the top-level module listed in top_level.txt
        top_level_import = get_top_level_import(import_name)
        if top_level_import:
            importlib.import_module(top_level_import)
            logger.info(f"{top_level_import} from top-level metadata ---> success")
            return
    except ImportError:
        logger.debug(f"Top-level import failed for {import_name}")

    try:
        # 3. Finally, fall back to the manual mapping
        import_name = package_to_import_map.get(package)
        if import_name == "":
            logger.info(f"Skipping {package} based on manual mapping")
            return
        elif import_name:
            importlib.import_module(import_name)
            logger.info(f"{import_name} using manual mapping ---> success")
        else:
            logger.error(f"No manual mapping found for {package}")
    except ImportError as e:
        logger.error(f"{import_name} from manual mapping ---> failed: {e}")


def main(file_path):
    # Load the environment YAML
    env_data = load_environment_yaml(file_path)

    # Get the dependencies section
    dependencies = env_data.get("dependencies", [])

    # Extract package names
    packages = get_packages_from_dependencies(dependencies)

    # Check each package
    for package in packages:
        check_import(package)

    # Final check for any errors
    log_contents = log_stream.getvalue()
    if "ERROR" in log_contents:
        logger.error("ERROR: failures on importing")
    else:
        logger.info("INFO: Successfully imported all packages")


if __name__ == "__main__":
    # Get the environment file path from command line argument, default to 'environment.yml'
    file_path = sys.argv[1] if len(sys.argv) > 1 else "environment.yml"
    main(file_path)
