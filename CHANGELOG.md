# CHANGELOG


## v0.6.2 (2025-06-21)


## v0.6.1 (2025-06-21)

### Bug Fixes

- Cleanup release tags missing a closing quote
  ([`c944662`](https://github.com/FacsimiLab/facsimilab-platform/commit/c944662c792aad1a0b74be223a11b57cb7ff05e1))

- Default PSR release bump level
  ([`8f5c6f1`](https://github.com/FacsimiLab/facsimilab-platform/commit/8f5c6f102ac964dcd3dba5c0e8cf117ff932b234))


## v0.6.0 (2025-06-21)

### Build System

- Building all images for v0.6.0
  ([`a336172`](https://github.com/FacsimiLab/facsimilab-platform/commit/a336172716d12cbc3b8b11f4cfd25d49a54e4c9b))

- Bump quarto version to 1.7.32
  ([`5dec2f9`](https://github.com/FacsimiLab/facsimilab-platform/commit/5dec2f9c2409744b98a63ce175fb0a952f1f6fe8))

- Generated conda-lock files for v0.6
  ([`f68c99e`](https://github.com/FacsimiLab/facsimilab-platform/commit/f68c99e7d98d18734cf89493a2ecc326f7771820))

### Continuous Integration

- Fix changelog filename
  ([`a5697b0`](https://github.com/FacsimiLab/facsimilab-platform/commit/a5697b039dcac83cec9b1859c4ba39f4cde50fe0))

- Fix changelog filename and add scope to git commit
  ([`2d23405`](https://github.com/FacsimiLab/facsimilab-platform/commit/2d23405d1b3083a6fbbe21d02550c44c6263c0e3))

- Remove action on changelog branch
  ([`82b01d0`](https://github.com/FacsimiLab/facsimilab-platform/commit/82b01d0814adcad2e12c02b5c54cd8950a8fff1b))

- Remove problemmatic issue creation
  ([`72ba36f`](https://github.com/FacsimiLab/facsimilab-platform/commit/72ba36f850cedcb8c7f40e1825a411e4ea8dd065))

- V0.6.0 ([#62](https://github.com/FacsimiLab/facsimilab-platform/pull/62),
  [`498eabf`](https://github.com/FacsimiLab/facsimilab-platform/commit/498eabf93d7646ed8d2ffe87787e4bb64767812e))

Python Packages Added:

- nbstripout - fuzzywuzzy - levenshtein - jmespath

Fixes: https://github.com/FacsimiLab/facsimilab-platform/issues/40

### Features

- Add fuzzywuzzy, levenshtein, jmespath. bump squidpy to v1.6
  ([`455a420`](https://github.com/FacsimiLab/facsimilab-platform/commit/455a420007ca1f8a03286955a8ea265d148f82fe))


## v0.5.0 (2025-06-20)

### Build System

- Starting build of base image
  ([`7b8871c`](https://github.com/FacsimiLab/facsimilab-platform/commit/7b8871ccd06bf3a9dc806240311f240dff024814))

### Continuous Integration

- Improve deletion of pre-release tags
  ([`6523dd0`](https://github.com/FacsimiLab/facsimilab-platform/commit/6523dd074b4fc3e89e1235bc2c95552d09c71f1d))

- Increase default bump to 1
  ([`a2654c5`](https://github.com/FacsimiLab/facsimilab-platform/commit/a2654c53b73335dabfeb0c84a3ada7b2f04f98f8))

- Remove commitlint
  ([`912ea58`](https://github.com/FacsimiLab/facsimilab-platform/commit/912ea58a6b6a826c2dd999471dc4d6dd1d9b5f21))

- **semantic-release**: Tag and Release v0.4.0-rc.2
  ([`dd148f4`](https://github.com/FacsimiLab/facsimilab-platform/commit/dd148f4b6792266f88231ad330761fb9ca41d320))

- **semantic-release**: Tag and Release v0.5.0
  ([`6cad1d3`](https://github.com/FacsimiLab/facsimilab-platform/commit/6cad1d30900512ac80d1b324aeb9f2ec41c173b5))

### Features

- Add `nbstripout` package to provide cleaner commits of jupyter notebooks
  ([`44dcd92`](https://github.com/FacsimiLab/facsimilab-platform/commit/44dcd921af99c2ac353ddf8d1d1515e51f6fca85))

- Prepare building v0.5.0
  ([`f2821d0`](https://github.com/FacsimiLab/facsimilab-platform/commit/f2821d0dd6fcb3edf3ae5568b32a986f951e2350))


## v0.4.0 (2025-04-22)

### Bug Fixes

- Add `jq` to main #27
  ([`c152b67`](https://github.com/FacsimiLab/facsimilab-platform/commit/c152b670668d1e3981243b588919203c1b420eaf))

- Add error handling and simply checks for sematic versioning
  ([`0f36410`](https://github.com/FacsimiLab/facsimilab-platform/commit/0f36410935adab86fcdeb937a1b2ca60c6ca2b0b))

- Add error handling and simply checks for sematic versioning
  ([`7008683`](https://github.com/FacsimiLab/facsimilab-platform/commit/700868324b8ad7081a2706f0c90cdf4a8a760941))

- Adjust selfhosted runner labels
  ([`f959d44`](https://github.com/FacsimiLab/facsimilab-platform/commit/f959d44969ac5f29acb3ec9cd8b7f6c01ceaf6ac))

- Adjust selfhosted runner labels ([#39](https://github.com/FacsimiLab/facsimilab-platform/pull/39),
  [`afba930`](https://github.com/FacsimiLab/facsimilab-platform/commit/afba930e29ccce5bb1b163f90e9ab5685181dbce))

- Change filename from build-all.sh to build.sh
  ([`0663008`](https://github.com/FacsimiLab/facsimilab-platform/commit/0663008af13881718c4a09d908ce5de29e735791))

- Cleanup further outcomes references
  ([`f6ecf1f`](https://github.com/FacsimiLab/facsimilab-platform/commit/f6ecf1fb9e8f7cd2e8e296f67819db8c6e3f313e))

- Cleanup github actions and keep as manual action while testing
  ([#38](https://github.com/FacsimiLab/facsimilab-platform/pull/38),
  [`016ada7`](https://github.com/FacsimiLab/facsimilab-platform/commit/016ada72d91edcbe5abe9bad484abb0834922c2b))

- Cleanup of github actions while testing
  ([`ab3ef13`](https://github.com/FacsimiLab/facsimilab-platform/commit/ab3ef138dd0d5f68a80bbb484b3b0373612cc6ea))

- Github action for building (tested initial stages with gh act)
  ([`28881d7`](https://github.com/FacsimiLab/facsimilab-platform/commit/28881d72e6e3f9e71d7a3202b8a7a38a1680cfca))

- Ignore future metadata.json files
  ([`10dc1a7`](https://github.com/FacsimiLab/facsimilab-platform/commit/10dc1a7a44c9ba4867fd2818c866ff6c19c89d5d))

- Place new workflows in correct directory
  ([`ca46ec6`](https://github.com/FacsimiLab/facsimilab-platform/commit/ca46ec69c7970c8bf82c03b68866d71e6b87d9f4))

- Remove build outcomes
  ([`4eb0a9a`](https://github.com/FacsimiLab/facsimilab-platform/commit/4eb0a9aa16e0e3198b70762601e3b95cc099c144))

- Remove redundant cuda version pinning causing issues, remove unnecessary pinning for minor
  packages
  ([`8b2ad1f`](https://github.com/FacsimiLab/facsimilab-platform/commit/8b2ad1f5e623475fd62471f0da7db8de9e49fa74))

- Remove unnecessary build arguments
  ([`3d5c669`](https://github.com/FacsimiLab/facsimilab-platform/commit/3d5c6696b9e0afecdebe7e3430bd525b80a7eb1a))

- Specify full version
  ([`f0b8baf`](https://github.com/FacsimiLab/facsimilab-platform/commit/f0b8baf32dbdb1392598cb654da4792f020fcd11))

### Build System

- Bump python versions for main env
  ([`1784885`](https://github.com/FacsimiLab/facsimilab-platform/commit/1784885f84dd4359eb66af16eca3f095d787db1e))

- Fix more build arguments to 12.8.1
  ([`c17637a`](https://github.com/FacsimiLab/facsimilab-platform/commit/c17637a4e9c64712af512e6d4f3aac77bac858a0))

- Update base image to cuda 12.8.1
  ([`8f05646`](https://github.com/FacsimiLab/facsimilab-platform/commit/8f05646004562084f601cacb668cf17dd222d80c))

### Chores

- Building outcomes metadata
  ([`80d7d88`](https://github.com/FacsimiLab/facsimilab-platform/commit/80d7d88acc2a453a650f445caad32d1fea1f88ed))

- Cleanup
  ([`8c7224b`](https://github.com/FacsimiLab/facsimilab-platform/commit/8c7224b6ab71f914757c9a12c0f34e38d28ffa43))

- Dist conda lock files
  ([`2b677be`](https://github.com/FacsimiLab/facsimilab-platform/commit/2b677be5f2d78bcb977cf2624a4748f5338958de))

- Merge branch 'develop'
  ([`7177dee`](https://github.com/FacsimiLab/facsimilab-platform/commit/7177deea8c44717f54014503a736a495fce2baa5))

- Merge branch 'main' into develop
  ([`6ce58eb`](https://github.com/FacsimiLab/facsimilab-platform/commit/6ce58ebefc99bb4c76ebaf24327a0257dee69dd4))

- Merge branch 'main' into develop
  ([`3053264`](https://github.com/FacsimiLab/facsimilab-platform/commit/305326477518d62e321a792fa9540fba6e184519))

- Remove outcomes directory
  ([`11d00f9`](https://github.com/FacsimiLab/facsimilab-platform/commit/11d00f9f93c472e04830644397dd159b8f7efd06))

### Continuous Integration

- Add PR to main as condition
  ([`3fdbe4b`](https://github.com/FacsimiLab/facsimilab-platform/commit/3fdbe4b959cfa8778b324e0beac2d455fd15f72a))

- Commenting out matrix messages temporarily
  ([`774594c`](https://github.com/FacsimiLab/facsimilab-platform/commit/774594c6bd0cce22a2532d33ed0a4fbb56b365a1))

- Commenting out matrix messages temporarily
  ([`0423ee6`](https://github.com/FacsimiLab/facsimilab-platform/commit/0423ee6f9d8ea439baffcda3d6c84b966e8b813f))

- Commit changelog to a dedicated branch
  ([`c9e5a86`](https://github.com/FacsimiLab/facsimilab-platform/commit/c9e5a86d912268d00a05fc1035a5dc6547c2536f))

- Commit changelog to new branch ([#54](https://github.com/FacsimiLab/facsimilab-platform/pull/54),
  [`9f9e1ea`](https://github.com/FacsimiLab/facsimilab-platform/commit/9f9e1ea91984298af082a30dc2baeef4f1c16539))

- Fix don't change branches
  ([`e2c2a2c`](https://github.com/FacsimiLab/facsimilab-platform/commit/e2c2a2c6bf5a2688c43f287fd74e97fa78340a3d))

- Fixing git workspace
  ([`374c500`](https://github.com/FacsimiLab/facsimilab-platform/commit/374c500fb324870bae42e9dad4a8087d5db89127))

- Limit label further to just self-hosted
  ([`4593eb5`](https://github.com/FacsimiLab/facsimilab-platform/commit/4593eb5e807c325c750dfd6eb194a626a34b6437))

- Only add issues to project (not PR)
  ([`86e700d`](https://github.com/FacsimiLab/facsimilab-platform/commit/86e700ddece088aed1c444babab4e3c1e5973e4a))

- Skip build process with PSR
  ([`ba14c7c`](https://github.com/FacsimiLab/facsimilab-platform/commit/ba14c7cad6b177fafa68e619b7c44464371fa061))

- Skip build process with PSR ([#51](https://github.com/FacsimiLab/facsimilab-platform/pull/51),
  [`5281923`](https://github.com/FacsimiLab/facsimilab-platform/commit/52819232f9df097eb05c31c0bc5a124f7fdcfdac))

- Switch back to github hosted runner
  ([`c6e24f6`](https://github.com/FacsimiLab/facsimilab-platform/commit/c6e24f62d182dc3326b06b0baa78bee8b3ceaba6))

- Testing checkout parameters for github actions
  ([`caed769`](https://github.com/FacsimiLab/facsimilab-platform/commit/caed7693d6f21a7c5a501c5d9e31f83fc54d42d4))

- Testing self-hosted env
  ([`0066306`](https://github.com/FacsimiLab/facsimilab-platform/commit/00663063e5602c2c270b7105d20f581e891fe646))

- Testing semvar action independent
  ([`8be3b14`](https://github.com/FacsimiLab/facsimilab-platform/commit/8be3b1429458190bd70c301d78f5b943766f8b74))

- Testing the action directory
  ([`39db363`](https://github.com/FacsimiLab/facsimilab-platform/commit/39db363ef13faea4f57121f50dec32517c265a60))

- Update build parameters
  ([`bb85a00`](https://github.com/FacsimiLab/facsimilab-platform/commit/bb85a003cf6d224de592043486251b4b444277ae))

- Update for facsimilab-bot and rc on main, release on release branch
  ([`d9b4201`](https://github.com/FacsimiLab/facsimilab-platform/commit/d9b4201410943a73044fdce923e2dc57f4fda553))

- Update the changelog on a dedicated branch
  ([`a19bfee`](https://github.com/FacsimiLab/facsimilab-platform/commit/a19bfee5d480d63f92bb34f47fd428ed871554b8))

- Use ssh to checkout / fetch
  ([`5fac56c`](https://github.com/FacsimiLab/facsimilab-platform/commit/5fac56ccd1a064a6433460c11eae23603835fd4d))

- Workflow to see if conda packages have updates
  ([`14bd34f`](https://github.com/FacsimiLab/facsimilab-platform/commit/14bd34f7182cbd7fcfd858a45c491f008132f59f))

- **semantic-release**: Tag and Release v0.4.0
  ([`db6701b`](https://github.com/FacsimiLab/facsimilab-platform/commit/db6701be50776962a783ad93054bf5e16be4c703))

- **semantic-release**: Tag and Release v0.4.0-rc.1
  ([`3df642c`](https://github.com/FacsimiLab/facsimilab-platform/commit/3df642c0521c04a76d6110b76d4558f947a6ddad))

### Documentation

- Update year to 2025 in licenses
  ([`e765ccf`](https://github.com/FacsimiLab/facsimilab-platform/commit/e765ccf22d7e2e4dea3627591704bd88d7571858))

### Features

- Add outcomes to the docker compose file
  ([`a185566`](https://github.com/FacsimiLab/facsimilab-platform/commit/a185566f4ad19503d8653e6ff5568d763b4db29f))

- Add packages. use unified builder. bump rclone, cuda, micromamba
  ([#37](https://github.com/FacsimiLab/facsimilab-platform/pull/37),
  [`afd382b`](https://github.com/FacsimiLab/facsimilab-platform/commit/afd382b215849b721efee62f589de386fcf59911))

- Add rsync
  ([`18f0f04`](https://github.com/FacsimiLab/facsimilab-platform/commit/18f0f04d7fc9925b36089d3a715ccca9e376fee7))

- Check for python-semantic-release in the build.sh
  ([`ebda3b5`](https://github.com/FacsimiLab/facsimilab-platform/commit/ebda3b5ea237f6d9c45c2dbb436345d2ee7765ef))

- Completed build for v0.4.0
  ([`41a1420`](https://github.com/FacsimiLab/facsimilab-platform/commit/41a1420afa6f98587de3eb3e36fe815c30ea555b))

- Completed build for v0.4.0 ([#57](https://github.com/FacsimiLab/facsimilab-platform/pull/57),
  [`f7fa453`](https://github.com/FacsimiLab/facsimilab-platform/commit/f7fa453cff39385cd99558d251de2df72491c592))

- Create GH action to automatically link issues and PRs to the project
  ([`cc1e9c2`](https://github.com/FacsimiLab/facsimilab-platform/commit/cc1e9c2fda295e60778ae99bd942ac8658bb0d1f))

- Create GH action to automatically link issues and PRs to the project
  ([#41](https://github.com/FacsimiLab/facsimilab-platform/pull/41),
  [`04b7027`](https://github.com/FacsimiLab/facsimilab-platform/commit/04b7027934163d2e7a0d91d94eda4ed4f3b55454))

- Enable semvar build and update to using default_templates for changelog config
  ([`162b12e`](https://github.com/FacsimiLab/facsimilab-platform/commit/162b12e747ff4ad5de0162ce167e04e897836b70))

- Github ci/cd workflows from other facsimilab repositories
  ([#48](https://github.com/FacsimiLab/facsimilab-platform/pull/48),
  [`6088b5d`](https://github.com/FacsimiLab/facsimilab-platform/commit/6088b5d58168be81be612b50b3a5137769b30cd1))

- Github ci/cd workflows from other facsimilab repositories (#48)
  ([#50](https://github.com/FacsimiLab/facsimilab-platform/pull/50),
  [`419faad`](https://github.com/FacsimiLab/facsimilab-platform/commit/419faad837e0605f8983b8be035020543934526a))

- Initializing files for a clinical outcomes docker image
  ([`d8de9eb`](https://github.com/FacsimiLab/facsimilab-platform/commit/d8de9eb27508a9c8150a68dc57e8b7f2ccdd8a16))

- Upgrade CUDA to 12.8, install rsync
  ([#56](https://github.com/FacsimiLab/facsimilab-platform/pull/56),
  [`3caff96`](https://github.com/FacsimiLab/facsimilab-platform/commit/3caff962e8e1ff23c34d9756f04e762813c461d0))

- Use conda-lock yml
  ([`a4c232a`](https://github.com/FacsimiLab/facsimilab-platform/commit/a4c232a44c5b0960b35dbefc22b19e0d14fc6c7c))

### Refactoring

- Move jq to base
  ([`e116367`](https://github.com/FacsimiLab/facsimilab-platform/commit/e116367d7d1d0bc71f642add5eb22cbd2fd70aae))


## v0.3.1 (2024-12-18)

### Bug Fixes

- Local docker registry and build full container
  ([`c46c3a0`](https://github.com/FacsimiLab/facsimilab-platform/commit/c46c3a0f2b8f6a609949eb52b92666090868ff8a))

### Continuous Integration

- 0.3.1
  ([`68f0ec3`](https://github.com/FacsimiLab/facsimilab-platform/commit/68f0ec30bf9f03aa46862fb767c3a3c1b1bc31fd))

Automatically generated by python-semantic-release


## v0.3.0 (2024-12-18)

### Bug Fixes

- Adjust GH Runner labels ([#16](https://github.com/FacsimiLab/facsimilab-platform/pull/16),
  [`2075c2d`](https://github.com/FacsimiLab/facsimilab-platform/commit/2075c2d53d3bc1679ac0fb15070b82ec91c09e37))

- Build should always occur on the main branch
  ([#17](https://github.com/FacsimiLab/facsimilab-platform/pull/17),
  [`7a50800`](https://github.com/FacsimiLab/facsimilab-platform/commit/7a50800700f93692a495bbfd2375167f782f12fc))

- Change permissions on /opt and /tmp to give read-write user permissions #34
  ([`34092ef`](https://github.com/FacsimiLab/facsimilab-platform/commit/34092ef5f47e7a92049d31c3e2d6a25778826fb3))

- Changelog output filename
  ([`33ba8bb`](https://github.com/FacsimiLab/facsimilab-platform/commit/33ba8bb6a969393746812f3c994cb7101359bcb0))

- Default repository to localhost
  ([`1b1580f`](https://github.com/FacsimiLab/facsimilab-platform/commit/1b1580f96024565c2c68d92edb15deec25e3a207))

- Ensure build script runs relative to itself
  ([`458af39`](https://github.com/FacsimiLab/facsimilab-platform/commit/458af39938ae5355e08dbeb03baea831825f5c8c))

- Pass build argument for env container version
  ([`6364a77`](https://github.com/FacsimiLab/facsimilab-platform/commit/6364a774b3ab8e0c4e05bb113b13d271a56060f5))

- Permissions on /tmp and /opt to install
  ([`81f1fd7`](https://github.com/FacsimiLab/facsimilab-platform/commit/81f1fd7d0b493581062a4f8e63cac1ab07d0bd90))

Fixes #34

- Quarto should download amd64, not arm64
  ([`5435219`](https://github.com/FacsimiLab/facsimilab-platform/commit/543521950670470d4510027d06fe1ccd12e6d9d2))

- Revert back to docker.io for cache registry
  ([`31d4a08`](https://github.com/FacsimiLab/facsimilab-platform/commit/31d4a08bee328af12bd1a96514d46c2d32287234))

- Wip temporarily pausing automatic github actions with selfhosted runner offline
  ([`4dc2b24`](https://github.com/FacsimiLab/facsimilab-platform/commit/4dc2b240d1cd51fbe54d3b76297dbbec681d3476))

- **docker**: Permissions on /tmp and /opt in base dir
  ([#34](https://github.com/FacsimiLab/facsimilab-platform/pull/34),
  [`197b233`](https://github.com/FacsimiLab/facsimilab-platform/commit/197b233f198dccffc27bbb51e98602c13222743b))

### Build System

- Create a main image (base env) conda lock file
  ([`e4ce16f`](https://github.com/FacsimiLab/facsimilab-platform/commit/e4ce16fb88d62ab62508f9956afda415a1b9e701))

- Full image uses main image as base and copies python from full-env image. Improves build time with
  simultaneous multistage builds
  ([`238e6fb`](https://github.com/FacsimiLab/facsimilab-platform/commit/238e6fbf53b11b42eaa14a745d87028539f955cb))

- Move copy steps to the end to improve caching
  ([`31958ab`](https://github.com/FacsimiLab/facsimilab-platform/commit/31958abcc052817cb6ae144df480e96795c4a0b2))

- Remove the separate cache build. simplify export of layers
  ([`a0beb4b`](https://github.com/FacsimiLab/facsimilab-platform/commit/a0beb4bbddb822e8456c0239c7666e2cd66b1799))

- Update conda-lock file for v0.4.0
  ([`82aebef`](https://github.com/FacsimiLab/facsimilab-platform/commit/82aebef9fbcf89afe5309098c602c71d1a222d27))

- Use the buildkit for base image
  ([`708ff6e`](https://github.com/FacsimiLab/facsimilab-platform/commit/708ff6e9b387638e2abf2e8aeaabccc3b2c24bf7))

- Wip docker compose build process
  ([`ac512e2`](https://github.com/FacsimiLab/facsimilab-platform/commit/ac512e24d2bd8e2097f7879da0c43a34ca38f47b))

### Chores

- Merge branch 'main' into develop
  ([`c6d433b`](https://github.com/FacsimiLab/facsimilab-platform/commit/c6d433b0fd3ff098353f6de0088cc3c58892bdce))

- Rename
  ([`accef9e`](https://github.com/FacsimiLab/facsimilab-platform/commit/accef9e259db827acbec256dfd9a2f2e94fe34dc))

- Save the current state
  ([`cfc682a`](https://github.com/FacsimiLab/facsimilab-platform/commit/cfc682a4b4cd05d5b7d4e856ef08e34d84cf04b5))

- Temp before pull
  ([`35eb2d2`](https://github.com/FacsimiLab/facsimilab-platform/commit/35eb2d2f03d39ff4a6bfe279b64776d3de1e0f7c))

- Temp disable workflows
  ([`431ae53`](https://github.com/FacsimiLab/facsimilab-platform/commit/431ae53d9945d4a021cb11e65b219e246970e1c5))

### Continuous Integration

- 0.3.0
  ([`9944bcd`](https://github.com/FacsimiLab/facsimilab-platform/commit/9944bcd54fcc1e2a806950aa90851cc89bdbbcde))

Automatically generated by python-semantic-release

- 0.4.0-beta.1
  ([`9d74ab2`](https://github.com/FacsimiLab/facsimilab-platform/commit/9d74ab2926ee971763a278923ff5c8fcc41394a8))

Automatically generated by python-semantic-release

- **release**: Tag and Release v0.4.0-beta.2
  ([`e3b6add`](https://github.com/FacsimiLab/facsimilab-platform/commit/e3b6add9f54509e50b530ad42028b4c4aed0e8c9))

### Features

- Add `argcomplete`
  ([`803af02`](https://github.com/FacsimiLab/facsimilab-platform/commit/803af02ebfe63d1cbe5fbd1e8b0e5c91cea40577))

Fixes #31

- Add `jq` to main
  ([`4379d56`](https://github.com/FacsimiLab/facsimilab-platform/commit/4379d56ea3a166e90bf8a79f499cd77ee92b14ca))

Fixes: #27

- Add `tmux`, `argcomplete`, and bump `quarto` to v1.6
  ([#36](https://github.com/FacsimiLab/facsimilab-platform/pull/36),
  [`3095cb7`](https://github.com/FacsimiLab/facsimilab-platform/commit/3095cb79d6f6ba01822a171047199e1f6c605f37))

Resolves FacsimiLab/facsimilab-platform#35, FacsimiLab/facsimilab-platform#31,
  FacsimiLab/facsimilab-platform#26

- Add changelog templates
  ([`ec36a60`](https://github.com/FacsimiLab/facsimilab-platform/commit/ec36a60dcbf5dad5d1c5264abef5b73554d13074))

- Add github action to update the develop branch when a new commit to main is made
  ([`cd2fa23`](https://github.com/FacsimiLab/facsimilab-platform/commit/cd2fa230f7cfebca77bd928338adfca8ad582710))

- Add github action to update the develop branch when a new commit to main is made
  ([#30](https://github.com/FacsimiLab/facsimilab-platform/pull/30),
  [`01d4b8c`](https://github.com/FacsimiLab/facsimilab-platform/commit/01d4b8c15f996b757fb306e5d2ed2d4c56cc4cc1))

Also pausing all other github actions until our self-hosted runner is working again

- Add spatialdata
  ([`24160fc`](https://github.com/FacsimiLab/facsimilab-platform/commit/24160fce462be9c415c292155eb1a1cb0ab29aa4))

- Add tmux to base
  ([`d0022a5`](https://github.com/FacsimiLab/facsimilab-platform/commit/d0022a5084ba0e803409e80f4efa32f83d3d04bc))

Fixes #26

- Bump micromamba to 2.0.5; bump cuda to 12.6.3
  ([`85bcd10`](https://github.com/FacsimiLab/facsimilab-platform/commit/85bcd10e3f3a1e71d03d7ca9d797bd26c253c68f))

- Bump quarto v1.5 --> 1.6
  ([`64d75c8`](https://github.com/FacsimiLab/facsimilab-platform/commit/64d75c8f01dba5f627eb2a5969ea364c88125b68))

- Bump versions for scvi-tools, scvelo, cupy-core
  ([`3d59228`](https://github.com/FacsimiLab/facsimilab-platform/commit/3d59228059660a2b93e997df199e8192ed2ffac4))

- Commit the metadata and image version on build.sh
  ([`7a6b95d`](https://github.com/FacsimiLab/facsimilab-platform/commit/7a6b95d4e96918e1d42fea4ceb87fa9743096cb8))

- Create a unified build script which sources `./parameters`
  ([`396e094`](https://github.com/FacsimiLab/facsimilab-platform/commit/396e0945d906be5430544b1670d89adfd0be70f2))

will replace directory specific build scripts. WIP docker-compose build support

- Discrete python build stages; semantic versioning; packages: gitpython, yadm, pptx, bump quarto to
  1.5.56; cleanup old images ([#15](https://github.com/FacsimiLab/facsimilab-platform/pull/15),
  [`7a4cdae`](https://github.com/FacsimiLab/facsimilab-platform/commit/7a4cdaecc462fc6b923c891c1e4336f51592e64b))

## Docker build

The main and full images now have a separate state just for building the python environment. This is
  done using the standard docker builder, not the `docker buildx build` due to an issue with
  hardlinks. The buildx builder has issues when moving conda packages across the hardlink from their
  downloaded directory to the environment directory. Could not resolve this using different `conda`
  commands or `conda-lock`. As a benefit, now this separate image improves caching, which improves
  build times.

## Dependencies - `yadm`: efficient pulldown of configuration templates - helpful in ephemeral
  environments like docker - `gitpython`: automate `git`, specifically branch creation, in
  conjunction with `datalad`. `datalad` does not natively support actions on branches - semantic
  versioning with
  [python-semantic-release](https://github.com/python-semantic-release/python-semantic-release) -
  `python-pptx`: generate PowerPoint presentations with python - useful when we need to quickly
  combine figures and send to colleagues in PowerPoint format for review. - Upgrade quarto version
  to 1.5.56

- Generate conda-lock files in parallel
  ([`80fb3cf`](https://github.com/FacsimiLab/facsimilab-platform/commit/80fb3cfe5f520509b6b4e0a43c50a8ce978fad0a))

- Pass in discrete conda file names as arguments from parameters
  ([`045c588`](https://github.com/FacsimiLab/facsimilab-platform/commit/045c58882ab69d0eb3ddf69073e3654861da6361))

- Pass in rclone version parameter. simplify base image parameters
  ([`a875752`](https://github.com/FacsimiLab/facsimilab-platform/commit/a87575219c025077c02b0bc91701ebd1bba52d2f))

- Pushing to a local registry
  ([`ff071a6`](https://github.com/FacsimiLab/facsimilab-platform/commit/ff071a6e196f82af65684914bca4409cd5b86a6d))

- Update for cuda 12.6 and new directory structure
  ([`01a6579`](https://github.com/FacsimiLab/facsimilab-platform/commit/01a6579d3030eb75685def6f868cdb586760c2c4))

- Updated conda-lock
  ([`93f8ef7`](https://github.com/FacsimiLab/facsimilab-platform/commit/93f8ef70da703883193b437b928a8ea59036c590))

- Use a pre-build conda-lock file for the main image too
  ([`eb017c3`](https://github.com/FacsimiLab/facsimilab-platform/commit/eb017c3bafa2866924207977f5b3f062a49abc39))

- Using CUDA 12.6.1 as base; add nvidia-container-images repo as subdataset
  ([#29](https://github.com/FacsimiLab/facsimilab-platform/pull/29),
  [`5ad67bf`](https://github.com/FacsimiLab/facsimilab-platform/commit/5ad67bf4d7eef52241f11a28e19793afe6b5ad79))

### Performance Improvements

- Move labels to the end for better caching
  ([`1ded2cc`](https://github.com/FacsimiLab/facsimilab-platform/commit/1ded2cc3fd0048266e6c1ea2e2034e37dcad71fc))

### Refactoring

- Full image naming
  ([`d536ff5`](https://github.com/FacsimiLab/facsimilab-platform/commit/d536ff569ed3efbfb452c1bcff651f831ab6eb63))

- Move labels to the end of the dockerfile to improve caching
  ([`8184549`](https://github.com/FacsimiLab/facsimilab-platform/commit/818454906b91c13c7aaa449387b3d8e79acb49b0))

- Rename base image dockerfile name
  ([`a32283c`](https://github.com/FacsimiLab/facsimilab-platform/commit/a32283c975fad8a761228eb91eb5061bc3d64a1b))

- Rename files for the new build system
  ([`64ad553`](https://github.com/FacsimiLab/facsimilab-platform/commit/64ad55309f65a54e5652fe5f1108a51c9d13d237))

- Rename python environment directory
  ([#28](https://github.com/FacsimiLab/facsimilab-platform/pull/28),
  [`c02d757`](https://github.com/FacsimiLab/facsimilab-platform/commit/c02d757e40c8df8033e90f0a83a0b3f2473b821c))


## v0.2.5 (2024-08-27)

### Bug Fixes

- Add condition for action
  ([`6f73e25`](https://github.com/FacsimiLab/facsimilab-platform/commit/6f73e2548a8be37bab9f742c6f861faec692d538))

- Add condition for action
  ([`c4072e5`](https://github.com/FacsimiLab/facsimilab-platform/commit/c4072e58d38ce85d5d2ac9060b1252cfbf730e72))

- Add docker pull
  ([`4cedb0a`](https://github.com/FacsimiLab/facsimilab-platform/commit/4cedb0a7852c74b41ee909830b54cba66e20b508))

- Adding a git
  ([`56e7eb7`](https://github.com/FacsimiLab/facsimilab-platform/commit/56e7eb7071785dde324146615a67b84327f132da))

- Adding additional gh runner tags
  ([`1e04e4c`](https://github.com/FacsimiLab/facsimilab-platform/commit/1e04e4cfe07233aeb5e27b5a5f49087595a9a28e))

- Adjust name of action
  ([`6f151a7`](https://github.com/FacsimiLab/facsimilab-platform/commit/6f151a79e093ea171c1a514d536b7b676653a534))

- Append to overwrite and add gitconfig
  ([`25e9862`](https://github.com/FacsimiLab/facsimilab-platform/commit/25e9862f972b1dbcd33e202df7dd128d471ffde6))

- Append to overwrite and add gitconfig
  ([`9abbf06`](https://github.com/FacsimiLab/facsimilab-platform/commit/9abbf06d8a7354d100185dc72e4d42903d585967))

- Appending directly to the github step summary || removed building on every commit
  ([`4e2ce0d`](https://github.com/FacsimiLab/facsimilab-platform/commit/4e2ce0d2e6f17719cc3cea0440636ef5738d2597))

- Branch specification
  ([`09ee265`](https://github.com/FacsimiLab/facsimilab-platform/commit/09ee265d645b9668e1519a2947bb287ed9fcf76e))

- Branch specification
  ([`b458f8f`](https://github.com/FacsimiLab/facsimilab-platform/commit/b458f8fe0f24539219f6de70855c907723ae8999))

- Build all was not building all
  ([`f4e8334`](https://github.com/FacsimiLab/facsimilab-platform/commit/f4e83343a080e448e3eb1070ede790eaf7e331a2))

- Build arguments for base
  ([`054c9f7`](https://github.com/FacsimiLab/facsimilab-platform/commit/054c9f7c04c5882d0f5777d2c01ff8a5195a33dd))

- Build should always occur on the main branch
  ([`faeec95`](https://github.com/FacsimiLab/facsimilab-platform/commit/faeec95544befe5d9f3ac50b5e522577eff3c20e))

- Buildall was not building all
  ([`78a94bd`](https://github.com/FacsimiLab/facsimilab-platform/commit/78a94bd968b427f16253672e5232cab34d916211))

- Cat to echo
  ([`782b6cf`](https://github.com/FacsimiLab/facsimilab-platform/commit/782b6cf52b6a48b415aeb4dd7142afe3ecd08eab))

- Change back to selfhosted due to docker container size limitation
  ([`cdec609`](https://github.com/FacsimiLab/facsimilab-platform/commit/cdec6098d36a4af6c73604dbeb208cd45c88cf08))

- Change permissions to 755
  ([`7b4df80`](https://github.com/FacsimiLab/facsimilab-platform/commit/7b4df80196e6270b5507d400a5736dd9fbb13ebc))

- Cleanup
  ([`0bc4248`](https://github.com/FacsimiLab/facsimilab-platform/commit/0bc424856a0266178bc8c00d87ffd706a2579302))

- Cleanup python package check
  ([`fb65d99`](https://github.com/FacsimiLab/facsimilab-platform/commit/fb65d99489a7eca5033ab342baa57fc9ce4e71e7))

- Corrected spelling of environment and set push-all repository
  ([`8f18f06`](https://github.com/FacsimiLab/facsimilab-platform/commit/8f18f063bf93342acc80913f272e5242dfa9090e))

- Gh action
  ([`054592b`](https://github.com/FacsimiLab/facsimilab-platform/commit/054592b51b48d5b0291f492c07421fa55f817001))

- Gpu --> gpus
  ([`7998d2f`](https://github.com/FacsimiLab/facsimilab-platform/commit/7998d2f81ebc0850e7496c59c7991424229833fd))

- Matrix server
  ([`42ff5f1`](https://github.com/FacsimiLab/facsimilab-platform/commit/42ff5f1930044f0f00139a7a5814d47cda6da507))

- Missing -e flag for environment
  ([`391e888`](https://github.com/FacsimiLab/facsimilab-platform/commit/391e8885367a27468bbfd9ecb3ef49b18039f972))

- Multiple jobs
  ([`08f5f48`](https://github.com/FacsimiLab/facsimilab-platform/commit/08f5f483283d0afe803eb05815d7a9e9a7efd8cb))

- Order of action
  ([`c59e099`](https://github.com/FacsimiLab/facsimilab-platform/commit/c59e0999aecdd81b04758935039a3ee4e22f5d53))

- Pass in conda env name
  ([`29f53c2`](https://github.com/FacsimiLab/facsimilab-platform/commit/29f53c2a3d7f64e3c9eb2290a8fbe4a133cba5d6))

- Path to image_version
  ([`4a54073`](https://github.com/FacsimiLab/facsimilab-platform/commit/4a5407366a3460710814e3424fd5322e16284380))

- Pull images by tags
  ([`67b054b`](https://github.com/FacsimiLab/facsimilab-platform/commit/67b054bcf015c703896534aa9e6c3b9431a64a42))

- Push full images
  ([`9bccc7b`](https://github.com/FacsimiLab/facsimilab-platform/commit/9bccc7b9b10b61f7b15c65c6c5270296f74162cb))

- Pushing the main-env in two stages also
  ([`13dd422`](https://github.com/FacsimiLab/facsimilab-platform/commit/13dd422d647efbb54734434777c64efd4b5fbcbc))

- Remove git commit from action due to failure
  ([`5e2f5f3`](https://github.com/FacsimiLab/facsimilab-platform/commit/5e2f5f3106ea842364e1bebf7033c46cec774a7d))

- Runs on label having error picking up
  ([`29cb883`](https://github.com/FacsimiLab/facsimilab-platform/commit/29cb8837be3d2ac9ff98831b064b6254e782a876))

- Runs on statement
  ([`b704129`](https://github.com/FacsimiLab/facsimilab-platform/commit/b7041290ac250e83cbe043aa882941a07f722063))

- Use current facsimilab label to test image
  ([`3f052b3`](https://github.com/FacsimiLab/facsimilab-platform/commit/3f052b39365d8d1f0ffe3ec0256fa6be0828724b))

- Was not passing in image_version.txt
  ([`d2a781b`](https://github.com/FacsimiLab/facsimilab-platform/commit/d2a781b323645bbc9173a02082ada0366b742af0))

- Workflow permissions
  ([`fddfb21`](https://github.com/FacsimiLab/facsimilab-platform/commit/fddfb213856ed535f8a935ef97b015c4628693d6))

- **code**: Change the changelog output filename
  ([`454d50b`](https://github.com/FacsimiLab/facsimilab-platform/commit/454d50bcb77575175bc077cc742aff64eb42e18f))

### Build System

- Update conda lock file
  ([`b58aad5`](https://github.com/FacsimiLab/facsimilab-platform/commit/b58aad51a33ff0840c7376b863a663b461998f92))

- V0.2.5-delta on gitea
  ([`161dd67`](https://github.com/FacsimiLab/facsimilab-platform/commit/161dd675c70e2c044ba89f37abbfdf111a067fc4))

- **dependencies**: Update / pin depedencies based on CVE reports
  ([`153d604`](https://github.com/FacsimiLab/facsimilab-platform/commit/153d604b2dc7463b7b49ee84f1c135c99e2041e6))

### Chores

- Chmod after backup restoration
  ([`09de4ef`](https://github.com/FacsimiLab/facsimilab-platform/commit/09de4efbb5845d713b93c275332f60263cbfe709))

- Cleanup extraneous dev_test_full and related workflows
  ([`58c5d52`](https://github.com/FacsimiLab/facsimilab-platform/commit/58c5d520ff065be4270f554d8f0daeef09c3dfc4))

- Removing extraneous workflows
  ([`ce36ac8`](https://github.com/FacsimiLab/facsimilab-platform/commit/ce36ac82ed58901ee15c0edbfa3c4082701d875e))

- Rename main-env and full-env to main and full
  ([`c0baff2`](https://github.com/FacsimiLab/facsimilab-platform/commit/c0baff235fabb3986c0d3828ed98fb70c35f3f4b))

In a previous commit, we deleted the single stage image builds. now we are renaming the multi-stage
  ones to the original directory names. This will clean up the repository.

### Continuous Integration

- 0.3.0-beta.1
  ([`e6d3715`](https://github.com/FacsimiLab/facsimilab-platform/commit/e6d3715615731df91f83d518422cb05b133fbfb6))

Automatically generated by python-semantic-release

- Set git safe directory to allow write permissions
  ([`06c56bb`](https://github.com/FacsimiLab/facsimilab-platform/commit/06c56bb24b1eb451e772c184356f5fc4dcbcffcd))

- Starting build on selfhosted ubuntu22 runners
  ([`a89fc61`](https://github.com/FacsimiLab/facsimilab-platform/commit/a89fc61ce1a685b76cef1f008b66179b7d71e0ab))

- Starting build on selfhosted ubuntu22 runners not the custom images
  ([`758478c`](https://github.com/FacsimiLab/facsimilab-platform/commit/758478c026ab4e5d2f9bbbfa6d1edfdf70e0e5fa))

- **build**: Testing containers version wise
  ([`a501a09`](https://github.com/FacsimiLab/facsimilab-platform/commit/a501a09d161ceffbe1eb6889824eab2a6c9abf4c))

- **code**: Apply docker labels and push
  ([`c403d44`](https://github.com/FacsimiLab/facsimilab-platform/commit/c403d44435ed58816bae237d25560d367eb27e7e))

### Features

- Add additional notifications
  ([`09f4ad2`](https://github.com/FacsimiLab/facsimilab-platform/commit/09f4ad2ee24569c5b29c89e7805d074e86570011))

- Add bash prompt coloring
  ([`0cd3e57`](https://github.com/FacsimiLab/facsimilab-platform/commit/0cd3e57047343dd9083f711e31d67098f969e76c))

- Add build conditions
  ([`cff9f85`](https://github.com/FacsimiLab/facsimilab-platform/commit/cff9f856dc1e0230f0308f051550ad13c5072bb6))

- Add build-and-push to main for workflow-dispatch
  ([`988bdd6`](https://github.com/FacsimiLab/facsimilab-platform/commit/988bdd604673c32e84f92455e20e067116b205b1))

- Add docker login, push main image directly
  ([`635a89c`](https://github.com/FacsimiLab/facsimilab-platform/commit/635a89c927f2f46907a56b8a1b42f1dae07f9d5d))

- Add exact commit SHA for the cuda base
  ([`e3b6a0d`](https://github.com/FacsimiLab/facsimilab-platform/commit/e3b6a0d656bbdcd73ba97e8de67f6e084ba6ed38))

- Add gitea actions
  ([`619ee26`](https://github.com/FacsimiLab/facsimilab-platform/commit/619ee26e6a7995a62724ed1592bed4f73e563edb))

- Add in apt caches
  ([`bd72fb0`](https://github.com/FacsimiLab/facsimilab-platform/commit/bd72fb0b75c416f31382612914e0e752939f24c6))

- Add matrix notification
  ([`d5cec47`](https://github.com/FacsimiLab/facsimilab-platform/commit/d5cec47c0327c689aa6604f26b245ee1302467dc))

- Add more labels and cleanup
  ([`a9be95c`](https://github.com/FacsimiLab/facsimilab-platform/commit/a9be95ce027faa092a15bbd7e005898ad7b084d3))

- Add more OCI labels
  ([`1e54867`](https://github.com/FacsimiLab/facsimilab-platform/commit/1e548673713ca2ab90136f86e51902ff98a4677c))

- Add nvidia-cuda image repo as a subdataset
  ([`478cfdf`](https://github.com/FacsimiLab/facsimilab-platform/commit/478cfdf86b80ebec4b7b7c376e22ad3861240927))

- Add readme and better build completion statements
  ([`440e0cb`](https://github.com/FacsimiLab/facsimilab-platform/commit/440e0cbb97c7a106c26da0e0bc8b4ba70fdb6dcc))

- Add semantic-versioning configuration
  ([`a017b56`](https://github.com/FacsimiLab/facsimilab-platform/commit/a017b56d23928db1ea693de012dc8fdd45e32b7c))

- Add webhook notification
  ([`4ce1606`](https://github.com/FacsimiLab/facsimilab-platform/commit/4ce1606127b27c85f47836d1bcf0f9ec0b4ad4be))

- Add webhook notification additional
  ([`5ac4e21`](https://github.com/FacsimiLab/facsimilab-platform/commit/5ac4e216750e91e17f337c547db7042854d4e4d6))

- Build containers using cuda 12.6.1 and ubuntu 22.04 as the base image
  ([`ad3ef42`](https://github.com/FacsimiLab/facsimilab-platform/commit/ad3ef42a8638003b409ee42891ca6e1a49a5a123))

- Build main image in 2 separate containers, pushing each stage
  ([`f64e11e`](https://github.com/FacsimiLab/facsimilab-platform/commit/f64e11e6eb8dacd9d490e5581139e7fb5b0e87d0))

- Building from full-env and main-env
  ([`0937c50`](https://github.com/FacsimiLab/facsimilab-platform/commit/0937c5062a187bd51eeb9583cb6d371b95c23398))

- Building image with some CVE addressed, lightning issue WIP
  ([`7f29646`](https://github.com/FacsimiLab/facsimilab-platform/commit/7f2964625e57f53fbb61f2e09ad5802490bcfb32))

created github issue on lightning dependency which is different from PIP vs. conda conda cannot
  solve the environment with the updated lightning. will update in the next one.

- Cache export and image export separate for main
  ([`15b96bb`](https://github.com/FacsimiLab/facsimilab-platform/commit/15b96bb9e24145e37aa6b9bb04640272c2f5cfd1))

- Change to matrix action
  ([`95540b2`](https://github.com/FacsimiLab/facsimilab-platform/commit/95540b23e4d678e0f6cccbf112021d2486a241b0))

- Commit test results to git
  ([`cd6df7f`](https://github.com/FacsimiLab/facsimilab-platform/commit/cd6df7f4ff44129d7230c61988845e96149179f2))

- Explicitly pull the base image for each build
  ([`48b4041`](https://github.com/FacsimiLab/facsimilab-platform/commit/48b4041a8825faaf3151102326f96450338854be))

- Have the python environments checked after the build is complete
  ([`3b194ba`](https://github.com/FacsimiLab/facsimilab-platform/commit/3b194ba931b8cd75456758f16ca45a620858419a))

- Installing docker directly into the runner rather than in facsimilab
  ([`ceae5d1`](https://github.com/FacsimiLab/facsimilab-platform/commit/ceae5d101b084d41cfc44b7a2683a82d57d66891))

- Mount local user's git config to the devcontainer
  ([`bedfbee`](https://github.com/FacsimiLab/facsimilab-platform/commit/bedfbeec237ead1f72f31eaef558c32d255d8742))

- New action for bleeding edge (each commit)
  ([`f7200cc`](https://github.com/FacsimiLab/facsimilab-platform/commit/f7200ccde9ffce66d859d048d28957b987b4b0b6))

- New action for bleeding edge (each commit)
  ([`24f6e8b`](https://github.com/FacsimiLab/facsimilab-platform/commit/24f6e8bd9914e850152e7f0d4dbd5664677c87ba))

- Pin exact sha of cuda image; cleanup
  ([`866d1a4`](https://github.com/FacsimiLab/facsimilab-platform/commit/866d1a49cd4db48968e7a9bfab279887059746b3))

- Pin exact sha of cuda image; cleanup
  ([`9707833`](https://github.com/FacsimiLab/facsimilab-platform/commit/9707833bf538a9f77b07acccb877c95dc7d47e8c))

- Script to clear cache
  ([`fbe4830`](https://github.com/FacsimiLab/facsimilab-platform/commit/fbe48305b31c164579d10b4cc5afab5bede2c1ec))

- Set default to copy environment, not link
  ([`423811e`](https://github.com/FacsimiLab/facsimilab-platform/commit/423811e47654be02f0943c487de605529104c011))

- Simplified build and push workflow
  ([`48ebe3e`](https://github.com/FacsimiLab/facsimilab-platform/commit/48ebe3ed909966d0a1180ca6dc038092f62cffca))

- Simplify bleeding edge
  ([`f34951f`](https://github.com/FacsimiLab/facsimilab-platform/commit/f34951f43ed1e59e040e87c4ca1855fe91b9e709))

- Simplify bleeding edge
  ([`de15ecc`](https://github.com/FacsimiLab/facsimilab-platform/commit/de15ecc511ed4c246bb5c3d975f119518d16361e))

- Simplify bleeding edge
  ([`62160ce`](https://github.com/FacsimiLab/facsimilab-platform/commit/62160ced7ff8be9c86e2e44cad748ad31a9a3bc4))

- Switch the python package check to github and expand space
  ([`206529b`](https://github.com/FacsimiLab/facsimilab-platform/commit/206529ba6c0bd3c9d137d9d095d0df4b8cf041a1))

- **dependencies**: Add gitpython
  ([`f724d64`](https://github.com/FacsimiLab/facsimilab-platform/commit/f724d642801440bdb479abd99dd70a6c54f2352d))

- **dependencies**: Add powerpoint python package to full image
  ([`20f17c5`](https://github.com/FacsimiLab/facsimilab-platform/commit/20f17c501a9499b1d5daae2aee86c9fbf2d696b6))

- **dependencies**: Bump quarto to version 1.5.56
  ([`dc28e8e`](https://github.com/FacsimiLab/facsimilab-platform/commit/dc28e8ebdbe47a2a0608a117868ad4ca0491a7e6))

- **dependencies**: Yadm dotfile apt package
  ([`3368173`](https://github.com/FacsimiLab/facsimilab-platform/commit/3368173a06cb5242f89a218b6a1fc97fd5339b61))

### Refactoring

- **docker**: Changed directory name for clarity
  ([`1d389db`](https://github.com/FacsimiLab/facsimilab-platform/commit/1d389db708cc1c3d8d87067306fb1c841ffd5da5))

- **docker**: Removing deprecated code with single stage main and full image builds
  ([`2d432e1`](https://github.com/FacsimiLab/facsimilab-platform/commit/2d432e1d62ffd0fedd7c603245eccf39fd7bb9af))

!BREAKING CHANGE: the older build-all script pointed to the /base, /main, /full directories, which
  are no longer present

### Testing

- Contribution to develop branch to see if actions run
  ([#18](https://github.com/FacsimiLab/facsimilab-platform/pull/18),
  [`c5c6b3a`](https://github.com/FacsimiLab/facsimilab-platform/commit/c5c6b3aa0061c182047c63450e080e84b93f9b6a))

- **code**: Change path of image version
  ([`ef637a4`](https://github.com/FacsimiLab/facsimilab-platform/commit/ef637a4aa4494158e6a42f9cbb40fb8bc0f734d3))

- **dependencies**: Refactor / minor changes to gh actions
  ([`35887fc`](https://github.com/FacsimiLab/facsimilab-platform/commit/35887fca7820e1a5b9f1e779ed1ea096d2b65a1d))


## v0.2.4 (2024-08-09)

### Bug Fixes

- Add credentials to ghcr.io
  ([`63e2ae0`](https://github.com/FacsimiLab/facsimilab-platform/commit/63e2ae041a027731d8144f04017dfac8fa8c3e8f))

- Build and push scripts can be run from any directory
  ([`5d5b91e`](https://github.com/FacsimiLab/facsimilab-platform/commit/5d5b91ef1d77ec723a3e724bdc004226b8321f94))

- Cat to echo
  ([`03c50ec`](https://github.com/FacsimiLab/facsimilab-platform/commit/03c50ec55a0b51a3b34f72d6f06d3b63f9a6c5cf))

- Change docker label to latest
  ([`394eaaf`](https://github.com/FacsimiLab/facsimilab-platform/commit/394eaafd41ab7767b67c6d11e6cc0e6c0bd165f2))

- Ci cleanup was erroring out; push was difficult to track
  ([`cf4ceec`](https://github.com/FacsimiLab/facsimilab-platform/commit/cf4ceec3fcfd31858ca13eb72c45ad54c2137433))

- Container label
  ([`685df5f`](https://github.com/FacsimiLab/facsimilab-platform/commit/685df5f7a9e59cceb73c75206ed0b3b93dc04944))

- Docker tags and repository to ghcr
  ([`1ad2e19`](https://github.com/FacsimiLab/facsimilab-platform/commit/1ad2e194af59065cc8a7b4f7e3e1e85a8644d4c2))

- Error in spelling filename
  ([`c418d64`](https://github.com/FacsimiLab/facsimilab-platform/commit/c418d6415bfbda90d3d96aa7fbb56b5c7c1a8034))

- Fix problem with seeing and logging the push to docker repos
  ([`9358b5d`](https://github.com/FacsimiLab/facsimilab-platform/commit/9358b5d23fe9871c6f9485cbc5d51a893a0931d6))

- Move condarc into the final build stage
  ([`b09130a`](https://github.com/FacsimiLab/facsimilab-platform/commit/b09130a1c4c1ff086761f8f823874ff62afec070))

- Remove extraneous files, get standard jupyter notebook working for a dockerized setup
  ([`bf5ebbf`](https://github.com/FacsimiLab/facsimilab-platform/commit/bf5ebbf9e87c7e684dafb0be71266e411bc51857))

- Removed ~/ from being mounted which interferes with docker configuration
  ([`2522376`](https://github.com/FacsimiLab/facsimilab-platform/commit/2522376da100cac4a742a93900256e84fe09af2b))

- Runs on
  ([`084085d`](https://github.com/FacsimiLab/facsimilab-platform/commit/084085d686285be92f1be56aecdf4facab36aa2a))

- **ci**: Header typo
  ([`efd13ba`](https://github.com/FacsimiLab/facsimilab-platform/commit/efd13ba2eef10735c331c627e064bc66e7ca8f8c))

- **ci**: Job summary sources
  ([`9ab96bc`](https://github.com/FacsimiLab/facsimilab-platform/commit/9ab96bcbc3ab204ad5301c48a8f15068f8473778))

- **ci**: Main and full image prints
  ([`c922e5c`](https://github.com/FacsimiLab/facsimilab-platform/commit/c922e5c53afd1d524375a7e71975b8b1cd10ce7b))

- **test**: Add tests for main and full image to the build and push
  ([`b74fb57`](https://github.com/FacsimiLab/facsimilab-platform/commit/b74fb5740294b0d8d22cc930510a7c61c465373a))

- **test**: Correct python path for main container
  ([`b7f2c55`](https://github.com/FacsimiLab/facsimilab-platform/commit/b7f2c55e9fa17b319dbcf9b386504f23db2e0ac3))

- **test**: Correct python path for main container
  ([`aa9cead`](https://github.com/FacsimiLab/facsimilab-platform/commit/aa9cead465352e341c78f598911affb0b7b3a6b4))

- **test**: Mount gitconfig in github runners
  ([`254ec62`](https://github.com/FacsimiLab/facsimilab-platform/commit/254ec621b2858c868baefd554b67b34f0a714ec0))

- **wip**: Removing tty terminal
  ([`7036fb8`](https://github.com/FacsimiLab/facsimilab-platform/commit/7036fb82af72c7a64ecb0601270884acca8cae52))

### Build System

- **dependencies**: Bump python package versions
  ([`1867952`](https://github.com/FacsimiLab/facsimilab-platform/commit/186795227e3705fe9bade0547450fa64b0b00394))

- **docker**: New script to build only the full container, tag as dev, and push to Docker
  ([`808418c`](https://github.com/FacsimiLab/facsimilab-platform/commit/808418ce4703688cf0bf11c9e57054040fe294bb))

### Code Style

- Cleanup
  ([`d4cf036`](https://github.com/FacsimiLab/facsimilab-platform/commit/d4cf036287e38d19be2ead740170ad445d1aee4c))

### Continuous Integration

- Add condition for run
  ([`6b0e573`](https://github.com/FacsimiLab/facsimilab-platform/commit/6b0e573f4a9590f6e3660c60c07161c959ac79ba))

- Add selfhosted runner
  ([`4a2c5a6`](https://github.com/FacsimiLab/facsimilab-platform/commit/4a2c5a6726ee1c6353e87e0318010ede734911f8))

- Ci: Add filters to the pull request
  ([`0de54c8`](https://github.com/FacsimiLab/facsimilab-platform/commit/0de54c80d3e3c4146701a899596dd24b31ec1217))

- Create a job summary
  ([`3894897`](https://github.com/FacsimiLab/facsimilab-platform/commit/3894897c0b34888d868e05ec35cfe02bc97284cc))

- Do not perform clean checkout due to error
  ([`c1df9ee`](https://github.com/FacsimiLab/facsimilab-platform/commit/c1df9eecfd9d8ca828880d2526c3d780ac3ee5a2))

- Init a dev facsimilab container test
  ([`75c0f12`](https://github.com/FacsimiLab/facsimilab-platform/commit/75c0f12b1e1f49abbd244c85db0209ad2d02f2a4))

- Trying checkout v3
  ([`975f168`](https://github.com/FacsimiLab/facsimilab-platform/commit/975f168b5e04a73e6a1fe3875554e2f3b1f1a4e1))

- Trying checkout v4
  ([`39b707d`](https://github.com/FacsimiLab/facsimilab-platform/commit/39b707dc359c50ea066fe927e274e129a0ae0abf))

- **dependencies**: Check python packages in main and full images
  ([`cae239b`](https://github.com/FacsimiLab/facsimilab-platform/commit/cae239b6d8d7a625f754ce68a5bf8335ab70acb0))

- **dependencies**: Test only on a push to main
  ([`ed41b24`](https://github.com/FacsimiLab/facsimilab-platform/commit/ed41b241c556cf306d5914284d79294ce98fc02e))

- **docker**: Add condition to check if a new build_version is detected
  ([`63ca558`](https://github.com/FacsimiLab/facsimilab-platform/commit/63ca558eb959e8175214cde82d001d2cad8a87d7))

- **docker**: Build and push a tagged image version
  ([`bb7706e`](https://github.com/FacsimiLab/facsimilab-platform/commit/bb7706e46d3130f55a5c0237572abee8efb5d650))

- **docker**: Push only to docker, not gitea
  ([`4484e75`](https://github.com/FacsimiLab/facsimilab-platform/commit/4484e75144c57fee141434116932f2d2adb4b06d))

- **docker**: Wip build and push
  ([`2d1fb0a`](https://github.com/FacsimiLab/facsimilab-platform/commit/2d1fb0ab3e6e7fb26107cc7c2d641d52c416ee39))

- **test**: Check datalad for main
  ([`3889537`](https://github.com/FacsimiLab/facsimilab-platform/commit/3889537b9618e37c9b26d559cc28d5ed5b8a9dbd))

- **test**: Results to an upload artifact
  ([`121b48f`](https://github.com/FacsimiLab/facsimilab-platform/commit/121b48fb962c75b94a127b5b45a57b0f6048e744))

- **test**: Running versions inside of the docker container
  ([`9c6e5b6`](https://github.com/FacsimiLab/facsimilab-platform/commit/9c6e5b68df384375874fddc5cd2613346d2300f9))

- **wip**: Using dockerhub
  ([`b5b8996`](https://github.com/FacsimiLab/facsimilab-platform/commit/b5b8996c0be6a9521401489fa9f22f9a821499ec))

### Documentation

- (#5) Update readme, licenses for the GPU capable multi image facsimilab platform
  ([`ba96eb3`](https://github.com/FacsimiLab/facsimilab-platform/commit/ba96eb3a165acf8bcb93708492941dd02c4cab4a))

Merge pull request #5 from pranavmishra90/develop

- Update readme for the GPU capable multi image facsimilab platform
  ([`e6f47ce`](https://github.com/FacsimiLab/facsimilab-platform/commit/e6f47cedd3b65994ac5a9b9894f2bd620ce4de54))

### Features

- Add additional scverse packages, rmm
  ([`6fc4650`](https://github.com/FacsimiLab/facsimilab-platform/commit/6fc46507b46742e8ec2fbc99cd5d480af9428007))

- Add bbknn
  ([`94458e4`](https://github.com/FacsimiLab/facsimilab-platform/commit/94458e4b3caf4f4124c1b8c45d02cd2786f2fed8))

- Add current state
  ([`50222a8`](https://github.com/FacsimiLab/facsimilab-platform/commit/50222a8e60e0077a5a987fcfb8e2b359b4e30eac))

- Add dask
  ([`8986b9e`](https://github.com/FacsimiLab/facsimilab-platform/commit/8986b9e707b8df9609533e2a885680bcd15d7583))

- Add dockerfile syntax
  ([`64bb65b`](https://github.com/FacsimiLab/facsimilab-platform/commit/64bb65b323c703e934091c9fcc4d48cddb5b049f))

- Add faiss-gpu
  ([`66f3551`](https://github.com/FacsimiLab/facsimilab-platform/commit/66f3551fe077723b61d74b0889c43d01c2199d3e))

- Add local bare metal conda lock
  ([`37e14c8`](https://github.com/FacsimiLab/facsimilab-platform/commit/37e14c823c665db7b2c51c0ae5955cbf9bb20633))

- Add new packages and notebooks for testing
  ([`0747686`](https://github.com/FacsimiLab/facsimilab-platform/commit/0747686d55b90da42f45dd7ae34c6a472037fcfe))

- Add openpyxl for reading excel files
  ([`dbfacd5`](https://github.com/FacsimiLab/facsimilab-platform/commit/dbfacd5c379d37869a44cc1851514b2004867a5e))

- Add primer3-py
  ([`a2ab3a4`](https://github.com/FacsimiLab/facsimilab-platform/commit/a2ab3a45d6200b9643864725a634d40564301355))

- Add references in biblatex format
  ([`eb577c0`](https://github.com/FacsimiLab/facsimilab-platform/commit/eb577c0200aa3075222af6c8107e2f2b6d4ebaa9))

- Add the nvidia/cuda base image as part of build-all
  ([`d063567`](https://github.com/FacsimiLab/facsimilab-platform/commit/d063567e5fb6a36e79ff6991f0a716d3cd8e50b7))

We want to ensure that our ubuntu base image is up to date

- Dynamic build and push scripts; conda-lock
  ([`c926fab`](https://github.com/FacsimiLab/facsimilab-platform/commit/c926fab718cf718108368a5a190aae73b4f7a9e7))

version number is picked up from a text file inside of the /docker dir this is then fed into the
  build-all.sh and push-all.sh files

we are now using a conda-lock file to ensure proper images. This is programmatically generated from
  the environment.yml file inside of the full container's directory.

- Full image build and buildx engines working. testing buildx ci
  ([`619aa30`](https://github.com/FacsimiLab/facsimilab-platform/commit/619aa30e23a504c8411a80a933aa29b74488cd03))

- Improved caching
  ([`cf0c0b4`](https://github.com/FacsimiLab/facsimilab-platform/commit/cf0c0b4b9a27c6bd2a5813dbc0a49afcf4ec5c34))

- Improved workflow, simplified copy statements
  ([`9be923f`](https://github.com/FacsimiLab/facsimilab-platform/commit/9be923f9d1f2619c29e5e0124b2224ee7cee1758))

- Making small change for ci
  ([`3acfe74`](https://github.com/FacsimiLab/facsimilab-platform/commit/3acfe742eb36b9a7952d16d3b58c342dfc9d8350))

- Modified readme for pranavmishra90's images
  ([`0d28f8a`](https://github.com/FacsimiLab/facsimilab-platform/commit/0d28f8aacbaa57a9d9467badbfd8d7b51f42b121))

- Move quick deploy
  ([`b529e0e`](https://github.com/FacsimiLab/facsimilab-platform/commit/b529e0e9efb91fda1c64cf5e03f1a4a8d2caf10d))

- Pass through ports for jupyter server in docker container
  ([`0a32d33`](https://github.com/FacsimiLab/facsimilab-platform/commit/0a32d33e3fba6e6c9283f8696d6ec4b4a6fe9dbb))

- Rename build_version.txt to image_version.txt for ease of autocomplete
  ([`7b2778d`](https://github.com/FacsimiLab/facsimilab-platform/commit/7b2778d8cfb1450a6af451e445c67f362b0a62b7))

- Results for versions
  ([`ef714ac`](https://github.com/FacsimiLab/facsimilab-platform/commit/ef714ac80e57c357e075682615f54a6b3308a26d))

- Set default environment
  ([`81cfe9d`](https://github.com/FacsimiLab/facsimilab-platform/commit/81cfe9dda0e64e9b0a4be36587c74f1b89e29772))

- Start pushing docker base images in background during build
  ([`e5f1f14`](https://github.com/FacsimiLab/facsimilab-platform/commit/e5f1f142b014c15b50d7de027183f91d50c9e047))

- Wip v0.2.5 with added and updated packages, improved ci, tested on tutorials
  ([`ec202a4`](https://github.com/FacsimiLab/facsimilab-platform/commit/ec202a49f49238c5c040366e39d0ee6cecc170ba))

- **build**: Wip building v0.2.4-lock
  ([`93ddd6e`](https://github.com/FacsimiLab/facsimilab-platform/commit/93ddd6ef4465e862e1981dfc88d24564cb9da330))

- **ci**: When adding python packages, build only the full image
  ([`956601a`](https://github.com/FacsimiLab/facsimilab-platform/commit/956601afa79c9c97e058707b77a1300df7ccd8a7))

- **dependencies**: Add `ForceAtlas2` algorithm for network visualization
  ([`ea153df`](https://github.com/FacsimiLab/facsimilab-platform/commit/ea153df67b23ea281f2ed1685dafd5f5581e8119))

Add accompanying citation: 10.1371/journal.pone.0098679

Starting new version --> v0.2.5

- **dependencies**: Add fa2 v0.3.5
  ([`3ab6c59`](https://github.com/FacsimiLab/facsimilab-platform/commit/3ab6c594c54ae29c920d44ffac709319c8e72bb3))

- **dependencies**: Removing zenodo_get due to reducancy with pooch
  ([`48bfafc`](https://github.com/FacsimiLab/facsimilab-platform/commit/48bfafc68b70028f3030a85c96dc3db96d6d76cb))

- **dependency**: Add pipx, preferring native docker builder, cleanup
  ([`c5b0f2c`](https://github.com/FacsimiLab/facsimilab-platform/commit/c5b0f2cc4aa4c2c9fe64ed9e40c7da41202d4e1a))

- **dependency**: Bump datalad 1.1
  ([`79f78c3`](https://github.com/FacsimiLab/facsimilab-platform/commit/79f78c364cf80b25c81287ad938547ed2b3d766d))

- **dependency**: Wip testing cuda 12.4 container
  ([`e474bb1`](https://github.com/FacsimiLab/facsimilab-platform/commit/e474bb16d10d8fe70e7a3b27c98d96af54b22f1d))

Building platform:

+-----------------------------------------------------------------------------------------+ |
  NVIDIA-SMI 555.42.06 Driver Version: 555.42.06 CUDA Version: 12.5 |
  |-----------------------------------------+------------------------+----------------------+ | GPU
  Name Persistence-M | Bus-Id Disp.A | Volatile Uncorr. ECC | | Fan Temp Perf Pwr:Usage/Cap |
  Memory-Usage | GPU-Util Compute M. | | | | MIG M. |
  |=========================================+========================+======================| | 0
  NVIDIA GeForce RTX 3060 Off | 00000000:05:00.0 Off | N/A | | 0% 38C P8 12W / 170W | 1854MiB /
  12288MiB | 0% Default | | | | N/A |
  +-----------------------------------------+------------------------+----------------------+

- **devcontainer**: Switch back to full container
  ([`a72e4e4`](https://github.com/FacsimiLab/facsimilab-platform/commit/a72e4e46d52490c5f8eae583635a27d956e81465))

### Performance Improvements

- **dependencies**: Do not rerun a conda-lock generation
  ([`1aa62ae`](https://github.com/FacsimiLab/facsimilab-platform/commit/1aa62aecd3a054aa73628abdf845147619dc3e1f))

### Testing

- Checking versions of python packages in the container
  ([`5f2041c`](https://github.com/FacsimiLab/facsimilab-platform/commit/5f2041ce832847a63eff6a35b34694806cc53d43))

- **dependencies**: Add addtional packages to be tested
  ([`c2956fe`](https://github.com/FacsimiLab/facsimilab-platform/commit/c2956fe098799a69d233133b61e3bbe0ad5f38eb))

Taken from the Prrx1 notebook for hardware and software testing

- **dependencies**: Check current package versions and see if updates are possible
  ([`91c7139`](https://github.com/FacsimiLab/facsimilab-platform/commit/91c71391da4a58f5087da2033add3c13f84e3b2c))


## v0.2.1 (2024-07-04)

### Bug Fixes

- **docker**: .profile --> .bash_aliases. removed /bin/conda causing init error. installed main base
  into base env
  ([`07b1c00`](https://github.com/FacsimiLab/facsimilab-platform/commit/07b1c006a1c6492319fbdefbb78a31d35407cef5))

- **docker**: Remove failing autoactivate of facsimilab env
  ([`9596784`](https://github.com/FacsimiLab/facsimilab-platform/commit/9596784b209a4c6fdb69f634848b033cf4eb3754))

### Build System

- **docker**: Build scripts working for all images
  ([`11879f8`](https://github.com/FacsimiLab/facsimilab-platform/commit/11879f80aace595ecd478ad87178c34b28edfee4))

### Documentation

- **licenses**: Add rclone license
  ([`3596cf3`](https://github.com/FacsimiLab/facsimilab-platform/commit/3596cf35166cd638033713309a1be08819c9d1da))

### Features

- **docker**: Add rclone for datalad remote siblings. .bash_aliases. Base and facsimilab env (#4)
  v0.2.1
  ([`6115a0d`](https://github.com/FacsimiLab/facsimilab-platform/commit/6115a0dd3daa96353e4d6ddc1b626f78638031a6))

* Add / Fix: [WIP] Working docker image with CUDA12.1

Why: cuda was not working on the previous method of config

How:

base image has changed to nvidia's image. no longer using vscode since that is image bloat

Pytorch is being installed with pip with a cuda requirement. This is uninstalling the version from
  conda and reinstalling

Tags: nvidia, cuda, pytorch, pip, conda

* Fix: torch version printout

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage

* feat(docker): Multistage builds

faster testing of docker builds. Improved debugging with python packages

* feat: Add dynamic load/run of scvi model if it does / does not exist

Determine if a trained scvi model exists. If so, load it. If not, train a new model.

* feat(docker): Updated method for passing version number; push script which adds latest tag

* feat(docker): Add dockerignore

* feat(docker): updated quick build and docker-compose files for testing

* feat(docker): preparing v0.2.1 which adds back rclone

* feat(docker): Add sound alert on script completion

* fix(docker): remove failing autoactivate of facsimilab env

* fix(docker): .profile --> .bash_aliases. removed /bin/conda causing init error. installed main
  base into base env

* build(docker): build scripts working for all images

* docs(licenses): Add rclone license

- **docker**: Add rclone, use.bash_aliases, use discrete base environment for facsimilab-main
  ([`e987f9f`](https://github.com/FacsimiLab/facsimilab-platform/commit/e987f9f23b32410e9cc6670889cbc61c8425d2b7))

WIP v0.2.1 Add rclone, use .bash_aliases, use discrete base environment for facsimilab-main

- **docker**: Add sound alert on script completion
  ([`f94ca6a`](https://github.com/FacsimiLab/facsimilab-platform/commit/f94ca6a92d10589002d960ed39eb43432999c498))

- **docker**: Preparing v0.2.1 which adds back rclone
  ([`96c9e41`](https://github.com/FacsimiLab/facsimilab-platform/commit/96c9e4171058a70bbd2f91ff7964a245e951822b))


## v0.2.0 (2024-07-04)

### Features

- Add dynamic load/run of scvi model if it does / does not exist
  ([`5438df0`](https://github.com/FacsimiLab/facsimilab-platform/commit/5438df04a8f317d97b6191fc8e48eefbeabb8183))

Determine if a trained scvi model exists. If so, load it. If not, train a new model.

- **docker**: Add dockerignore
  ([`f49490b`](https://github.com/FacsimiLab/facsimilab-platform/commit/f49490b8e4fbfb2abe4a50db255828f0622b9c7f))

- **docker**: Creation of multiple docker images (#2) v0.2.0
  ([`92fe9cd`](https://github.com/FacsimiLab/facsimilab-platform/commit/92fe9cd592f814ce868713dc6f97ebadc4c611d9))

* Add / Fix: [WIP] Working docker image with CUDA12.1

Why: cuda was not working on the previous method of config

How:

base image has changed to nvidia's image. no longer using vscode since that is image bloat

Pytorch is being installed with pip with a cuda requirement. This is uninstalling the version from
  conda and reinstalling

Tags: nvidia, cuda, pytorch, pip, conda

* Fix: torch version printout

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage

* feat(docker): Multistage builds

faster testing of docker builds. Improved debugging with python packages

* feat: Add dynamic load/run of scvi model if it does / does not exist

Determine if a trained scvi model exists. If so, load it. If not, train a new model.

* feat(docker): Updated method for passing version number; push script which adds latest tag

* feat(docker): Add dockerignore

* feat(docker): updated quick build and docker-compose files for testing

- **docker**: Multistage builds
  ([`0821ac8`](https://github.com/FacsimiLab/facsimilab-platform/commit/0821ac87df68f073250ecc891be5f89f62e7989c))

faster testing of docker builds. Improved debugging with python packages

- **docker**: Updated method for passing version number; push script which adds latest tag
  ([`fb4d039`](https://github.com/FacsimiLab/facsimilab-platform/commit/fb4d0396660d23fd58fb0dc3140e01ee898f59f6))

- **docker**: Updated quick build and docker-compose files for testing
  ([`a4f43a9`](https://github.com/FacsimiLab/facsimilab-platform/commit/a4f43a904e011b550d30dab7266077e28cc6de63))


## v0.1.0 (2024-05-07)
