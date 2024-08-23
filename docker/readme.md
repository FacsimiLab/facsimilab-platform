


Delete images with a tag

````sh
cleanup_docker_images() {
  local search_filter="$1"
  local sleep_delay="${2:-10}"

  echo "-------------------------------------------------------------------------------------"
  echo "Searching for Docker images with '$search_filter' in their name"
  docker images --format "{{.Repository}}:{{.Tag}}" | grep "$search_filter"
  echo "Removing these images in $sleep_delay seconds..."
  echo "-------------------------------------------------------------------------------------"
  sleep $sleep_delay

  docker images --format "{{.Repository}}:{{.Tag}}" | grep "$search_filter" | xargs -r docker rmi
}
````