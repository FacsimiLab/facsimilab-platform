# CHANGELOG


## v0.3.1 (2024-12-18)

### Bug Fixes

* fix: local docker registry and build full container ([`c46c3a0`](https://github.com/pranavmishra90/facsimilab-platform/commit/c46c3a0f2b8f6a609949eb52b92666090868ff8a))


## v0.3.0 (2024-12-18)

### Bug Fixes

* fix(docker): permissions on /tmp and /opt in base dir (#34) ([`197b233`](https://github.com/pranavmishra90/facsimilab-platform/commit/197b233f198dccffc27bbb51e98602c13222743b))

* fix: WIP temporarily pausing automatic github actions with selfhosted runner offline ([`4dc2b24`](https://github.com/pranavmishra90/facsimilab-platform/commit/4dc2b240d1cd51fbe54d3b76297dbbec681d3476))

* fix: build should always occur on the main branch (#17) ([`7a50800`](https://github.com/pranavmishra90/facsimilab-platform/commit/7a50800700f93692a495bbfd2375167f782f12fc))

* fix: adjust GH Runner labels (#16) ([`2075c2d`](https://github.com/pranavmishra90/facsimilab-platform/commit/2075c2d53d3bc1679ac0fb15070b82ec91c09e37))

### Chores

* chore: temp before pull ([`35eb2d2`](https://github.com/pranavmishra90/facsimilab-platform/commit/35eb2d2f03d39ff4a6bfe279b64776d3de1e0f7c))

* chore: Merge branch 'main' into develop ([`c6d433b`](https://github.com/pranavmishra90/facsimilab-platform/commit/c6d433b0fd3ff098353f6de0088cc3c58892bdce))

### Features

* feat: add `tmux`, `argcomplete`, and bump `quarto` to v1.6 (#36)

Resolves FacsimiLab/facsimilab-platform#35,
FacsimiLab/facsimilab-platform#31, FacsimiLab/facsimilab-platform#26 ([`3095cb7`](https://github.com/pranavmishra90/facsimilab-platform/commit/3095cb79d6f6ba01822a171047199e1f6c605f37))

* feat: add github action to update the develop branch when a new commit to main is made (#30)

Also pausing all other github actions until our self-hosted runner is
working again ([`01d4b8c`](https://github.com/pranavmishra90/facsimilab-platform/commit/01d4b8c15f996b757fb306e5d2ed2d4c56cc4cc1))

* feat: using CUDA 12.6.1 as base; add nvidia-container-images repo as subdataset (#29) ([`5ad67bf`](https://github.com/pranavmishra90/facsimilab-platform/commit/5ad67bf4d7eef52241f11a28e19793afe6b5ad79))

* feat: bump quarto v1.5 --> 1.6 ([`64d75c8`](https://github.com/pranavmishra90/facsimilab-platform/commit/64d75c8f01dba5f627eb2a5969ea364c88125b68))

* feat: add `argcomplete`

Fixes #31 ([`803af02`](https://github.com/pranavmishra90/facsimilab-platform/commit/803af02ebfe63d1cbe5fbd1e8b0e5c91cea40577))

* feat: add tmux to base

Fixes #26 ([`d0022a5`](https://github.com/pranavmishra90/facsimilab-platform/commit/d0022a5084ba0e803409e80f4efa32f83d3d04bc))

* feat: add github action to update the develop branch when a new commit to main is made ([`cd2fa23`](https://github.com/pranavmishra90/facsimilab-platform/commit/cd2fa230f7cfebca77bd928338adfca8ad582710))

* feat: discrete python build stages; semantic versioning; packages: gitpython, yadm, pptx, bump quarto to 1.5.56; cleanup old images (#15)

## Docker build

The main and full images now have a separate state just for building the
python environment. This is done using the standard docker builder, not
the `docker buildx build` due to an issue with hardlinks. The buildx
builder has issues when moving conda packages across the hardlink from
their downloaded directory to the environment directory. Could not
resolve this using different `conda` commands or `conda-lock`. As a
benefit, now this separate image improves caching, which improves build
times.


## Dependencies
- `yadm`: efficient pulldown of configuration templates - helpful in
ephemeral environments like docker
- `gitpython`: automate `git`, specifically branch creation, in
conjunction with `datalad`. `datalad` does not natively support actions
on branches
- semantic versioning with
[python-semantic-release](https://github.com/python-semantic-release/python-semantic-release)
- `python-pptx`: generate PowerPoint presentations with python - useful
when we need to quickly combine figures and send to colleagues in
PowerPoint format for review.
- Upgrade quarto version to 1.5.56 ([`7a4cdae`](https://github.com/pranavmishra90/facsimilab-platform/commit/7a4cdaecc462fc6b923c891c1e4336f51592e64b))

### Refactoring

* refactor: Rename python environment directory (#28) ([`c02d757`](https://github.com/pranavmishra90/facsimilab-platform/commit/c02d757e40c8df8033e90f0a83a0b3f2473b821c))

### Unknown

* Merge branch 'FacsimiLab:main' into develop ([`a07d956`](https://github.com/pranavmishra90/facsimilab-platform/commit/a07d956a27ffa47744cfb1c4a9389f5557380a0c))


## v0.2.5 (2024-08-27)

### Bug Fixes

* fix: build should always occur on the main branch ([`faeec95`](https://github.com/pranavmishra90/facsimilab-platform/commit/faeec95544befe5d9f3ac50b5e522577eff3c20e))

* fix: adding additional gh runner tags ([`1e04e4c`](https://github.com/pranavmishra90/facsimilab-platform/commit/1e04e4cfe07233aeb5e27b5a5f49087595a9a28e))

* fix: runs on label having error picking up ([`29cb883`](https://github.com/pranavmishra90/facsimilab-platform/commit/29cb8837be3d2ac9ff98831b064b6254e782a876))

* fix: workflow permissions ([`fddfb21`](https://github.com/pranavmishra90/facsimilab-platform/commit/fddfb213856ed535f8a935ef97b015c4628693d6))

* fix(code): change the changelog output filename ([`454d50b`](https://github.com/pranavmishra90/facsimilab-platform/commit/454d50bcb77575175bc077cc742aff64eb42e18f))

* fix: remove git commit from action due to failure ([`5e2f5f3`](https://github.com/pranavmishra90/facsimilab-platform/commit/5e2f5f3106ea842364e1bebf7033c46cec774a7d))

* fix: path to image_version ([`4a54073`](https://github.com/pranavmishra90/facsimilab-platform/commit/4a5407366a3460710814e3424fd5322e16284380))

* fix: corrected spelling of environment and set push-all repository ([`8f18f06`](https://github.com/pranavmishra90/facsimilab-platform/commit/8f18f063bf93342acc80913f272e5242dfa9090e))

* fix: gpu --> gpus ([`7998d2f`](https://github.com/pranavmishra90/facsimilab-platform/commit/7998d2f81ebc0850e7496c59c7991424229833fd))

* fix: cat to echo ([`782b6cf`](https://github.com/pranavmishra90/facsimilab-platform/commit/782b6cf52b6a48b415aeb4dd7142afe3ecd08eab))

* fix: appending directly to the github step summary || removed building on every commit ([`4e2ce0d`](https://github.com/pranavmishra90/facsimilab-platform/commit/4e2ce0d2e6f17719cc3cea0440636ef5738d2597))

* fix: cleanup python package check ([`fb65d99`](https://github.com/pranavmishra90/facsimilab-platform/commit/fb65d99489a7eca5033ab342baa57fc9ce4e71e7))

* fix: build arguments for base ([`054c9f7`](https://github.com/pranavmishra90/facsimilab-platform/commit/054c9f7c04c5882d0f5777d2c01ff8a5195a33dd))

* fix: add condition for action ([`6f73e25`](https://github.com/pranavmishra90/facsimilab-platform/commit/6f73e2548a8be37bab9f742c6f861faec692d538))

* fix: add condition for action ([`c4072e5`](https://github.com/pranavmishra90/facsimilab-platform/commit/c4072e58d38ce85d5d2ac9060b1252cfbf730e72))

* fix: change permissions to 755 ([`7b4df80`](https://github.com/pranavmishra90/facsimilab-platform/commit/7b4df80196e6270b5507d400a5736dd9fbb13ebc))

* fix: adding a git ([`56e7eb7`](https://github.com/pranavmishra90/facsimilab-platform/commit/56e7eb7071785dde324146615a67b84327f132da))

* fix: cleanup ([`0bc4248`](https://github.com/pranavmishra90/facsimilab-platform/commit/0bc424856a0266178bc8c00d87ffd706a2579302))

* fix: change back to selfhosted due to docker container size limitation ([`cdec609`](https://github.com/pranavmishra90/facsimilab-platform/commit/cdec6098d36a4af6c73604dbeb208cd45c88cf08))

* fix: append to overwrite and add gitconfig ([`25e9862`](https://github.com/pranavmishra90/facsimilab-platform/commit/25e9862f972b1dbcd33e202df7dd128d471ffde6))

* fix: append to overwrite and add gitconfig ([`9abbf06`](https://github.com/pranavmishra90/facsimilab-platform/commit/9abbf06d8a7354d100185dc72e4d42903d585967))

* fix: missing -e flag for environment ([`391e888`](https://github.com/pranavmishra90/facsimilab-platform/commit/391e8885367a27468bbfd9ecb3ef49b18039f972))

* fix: GH action ([`054592b`](https://github.com/pranavmishra90/facsimilab-platform/commit/054592b51b48d5b0291f492c07421fa55f817001))

* fix: was not passing in image_version.txt ([`d2a781b`](https://github.com/pranavmishra90/facsimilab-platform/commit/d2a781b323645bbc9173a02082ada0366b742af0))

* fix: build all was not building all ([`f4e8334`](https://github.com/pranavmishra90/facsimilab-platform/commit/f4e83343a080e448e3eb1070ede790eaf7e331a2))

* fix: runs on statement ([`b704129`](https://github.com/pranavmishra90/facsimilab-platform/commit/b7041290ac250e83cbe043aa882941a07f722063))

* fix: branch specification ([`09ee265`](https://github.com/pranavmishra90/facsimilab-platform/commit/09ee265d645b9668e1519a2947bb287ed9fcf76e))

* fix: branch specification ([`b458f8f`](https://github.com/pranavmishra90/facsimilab-platform/commit/b458f8fe0f24539219f6de70855c907723ae8999))

* fix: pushing the main-env in two stages also ([`13dd422`](https://github.com/pranavmishra90/facsimilab-platform/commit/13dd422d647efbb54734434777c64efd4b5fbcbc))

* fix: push full images ([`9bccc7b`](https://github.com/pranavmishra90/facsimilab-platform/commit/9bccc7b9b10b61f7b15c65c6c5270296f74162cb))

* fix: buildall was not building all ([`78a94bd`](https://github.com/pranavmishra90/facsimilab-platform/commit/78a94bd968b427f16253672e5232cab34d916211))

* fix: add docker pull ([`4cedb0a`](https://github.com/pranavmishra90/facsimilab-platform/commit/4cedb0a7852c74b41ee909830b54cba66e20b508))

* fix: multiple jobs ([`08f5f48`](https://github.com/pranavmishra90/facsimilab-platform/commit/08f5f483283d0afe803eb05815d7a9e9a7efd8cb))

* fix: matrix server ([`42ff5f1`](https://github.com/pranavmishra90/facsimilab-platform/commit/42ff5f1930044f0f00139a7a5814d47cda6da507))

* fix: use current facsimilab label to test image ([`3f052b3`](https://github.com/pranavmishra90/facsimilab-platform/commit/3f052b39365d8d1f0ffe3ec0256fa6be0828724b))

* fix: pass in conda env name ([`29f53c2`](https://github.com/pranavmishra90/facsimilab-platform/commit/29f53c2a3d7f64e3c9eb2290a8fbe4a133cba5d6))

* fix: order of action ([`c59e099`](https://github.com/pranavmishra90/facsimilab-platform/commit/c59e0999aecdd81b04758935039a3ee4e22f5d53))

* fix: adjust name of action ([`6f151a7`](https://github.com/pranavmishra90/facsimilab-platform/commit/6f151a79e093ea171c1a514d536b7b676653a534))

* fix: pull images by tags ([`67b054b`](https://github.com/pranavmishra90/facsimilab-platform/commit/67b054bcf015c703896534aa9e6c3b9431a64a42))

### Build System

* build: update conda lock file ([`b58aad5`](https://github.com/pranavmishra90/facsimilab-platform/commit/b58aad51a33ff0840c7376b863a663b461998f92))

* build: v0.2.5-delta on gitea ([`161dd67`](https://github.com/pranavmishra90/facsimilab-platform/commit/161dd675c70e2c044ba89f37abbfdf111a067fc4))

* build(dependencies): update / pin depedencies based on CVE reports ([`153d604`](https://github.com/pranavmishra90/facsimilab-platform/commit/153d604b2dc7463b7b49ee84f1c135c99e2041e6))

### Chores

* chore: chmod after backup restoration ([`09de4ef`](https://github.com/pranavmishra90/facsimilab-platform/commit/09de4efbb5845d713b93c275332f60263cbfe709))

* chore: removing extraneous workflows ([`ce36ac8`](https://github.com/pranavmishra90/facsimilab-platform/commit/ce36ac82ed58901ee15c0edbfa3c4082701d875e))

* chore: rename main-env and full-env to main and full

In a previous commit, we deleted the single stage image builds. now we are renaming the multi-stage ones to the original directory names. This will clean up the repository. ([`c0baff2`](https://github.com/pranavmishra90/facsimilab-platform/commit/c0baff235fabb3986c0d3828ed98fb70c35f3f4b))

* chore: cleanup extraneous dev_test_full and related workflows ([`58c5d52`](https://github.com/pranavmishra90/facsimilab-platform/commit/58c5d520ff065be4270f554d8f0daeef09c3dfc4))

### Continuous Integration

* ci: set git safe directory to allow write permissions ([`06c56bb`](https://github.com/pranavmishra90/facsimilab-platform/commit/06c56bb24b1eb451e772c184356f5fc4dcbcffcd))

* ci(code): apply docker labels and push ([`c403d44`](https://github.com/pranavmishra90/facsimilab-platform/commit/c403d44435ed58816bae237d25560d367eb27e7e))

* ci: starting build on selfhosted ubuntu22 runners not the custom images ([`758478c`](https://github.com/pranavmishra90/facsimilab-platform/commit/758478c026ab4e5d2f9bbbfa6d1edfdf70e0e5fa))

* ci: starting build on selfhosted ubuntu22 runners ([`a89fc61`](https://github.com/pranavmishra90/facsimilab-platform/commit/a89fc61ce1a685b76cef1f008b66179b7d71e0ab))

* ci(build): testing containers version wise ([`a501a09`](https://github.com/pranavmishra90/facsimilab-platform/commit/a501a09d161ceffbe1eb6889824eab2a6c9abf4c))

### Features

* feat: build containers using cuda 12.6.1 and ubuntu 22.04 as the base image ([`ad3ef42`](https://github.com/pranavmishra90/facsimilab-platform/commit/ad3ef42a8638003b409ee42891ca6e1a49a5a123))

* feat: add nvidia-cuda image repo as a subdataset ([`478cfdf`](https://github.com/pranavmishra90/facsimilab-platform/commit/478cfdf86b80ebec4b7b7c376e22ad3861240927))

* feat: add semantic-versioning configuration ([`a017b56`](https://github.com/pranavmishra90/facsimilab-platform/commit/a017b56d23928db1ea693de012dc8fdd45e32b7c))

* feat(dependencies): bump quarto to version 1.5.56 ([`dc28e8e`](https://github.com/pranavmishra90/facsimilab-platform/commit/dc28e8ebdbe47a2a0608a117868ad4ca0491a7e6))

* feat(dependencies): add gitpython ([`f724d64`](https://github.com/pranavmishra90/facsimilab-platform/commit/f724d642801440bdb479abd99dd70a6c54f2352d))

* feat: mount local user's git config to the devcontainer ([`bedfbee`](https://github.com/pranavmishra90/facsimilab-platform/commit/bedfbeec237ead1f72f31eaef558c32d255d8742))

* feat(dependencies): yadm dotfile apt package ([`3368173`](https://github.com/pranavmishra90/facsimilab-platform/commit/3368173a06cb5242f89a218b6a1fc97fd5339b61))

* feat: add bash prompt coloring ([`0cd3e57`](https://github.com/pranavmishra90/facsimilab-platform/commit/0cd3e57047343dd9083f711e31d67098f969e76c))

* feat(dependencies): add powerpoint python package to full image ([`20f17c5`](https://github.com/pranavmishra90/facsimilab-platform/commit/20f17c501a9499b1d5daae2aee86c9fbf2d696b6))

* feat: commit test results to git ([`cd6df7f`](https://github.com/pranavmishra90/facsimilab-platform/commit/cd6df7f4ff44129d7230c61988845e96149179f2))

* feat: add matrix notification ([`d5cec47`](https://github.com/pranavmishra90/facsimilab-platform/commit/d5cec47c0327c689aa6604f26b245ee1302467dc))

* feat: have the python environments checked after the build is complete ([`3b194ba`](https://github.com/pranavmishra90/facsimilab-platform/commit/3b194ba931b8cd75456758f16ca45a620858419a))

* feat: Installing docker directly into the runner rather than in facsimilab ([`ceae5d1`](https://github.com/pranavmishra90/facsimilab-platform/commit/ceae5d101b084d41cfc44b7a2683a82d57d66891))

* feat: add in apt caches ([`bd72fb0`](https://github.com/pranavmishra90/facsimilab-platform/commit/bd72fb0b75c416f31382612914e0e752939f24c6))

* feat: explicitly pull the base image for each build ([`48b4041`](https://github.com/pranavmishra90/facsimilab-platform/commit/48b4041a8825faaf3151102326f96450338854be))

* feat: pin exact sha of cuda image; cleanup ([`866d1a4`](https://github.com/pranavmishra90/facsimilab-platform/commit/866d1a49cd4db48968e7a9bfab279887059746b3))

* feat: pin exact sha of cuda image; cleanup ([`9707833`](https://github.com/pranavmishra90/facsimilab-platform/commit/9707833bf538a9f77b07acccb877c95dc7d47e8c))

* feat: switch the python package check to github and expand space ([`206529b`](https://github.com/pranavmishra90/facsimilab-platform/commit/206529ba6c0bd3c9d137d9d095d0df4b8cf041a1))

* feat: add build conditions ([`cff9f85`](https://github.com/pranavmishra90/facsimilab-platform/commit/cff9f856dc1e0230f0308f051550ad13c5072bb6))

* feat: simplified build and push workflow ([`48ebe3e`](https://github.com/pranavmishra90/facsimilab-platform/commit/48ebe3ed909966d0a1180ca6dc038092f62cffca))

* feat: simplify bleeding edge ([`f34951f`](https://github.com/pranavmishra90/facsimilab-platform/commit/f34951f43ed1e59e040e87c4ca1855fe91b9e709))

* feat: simplify bleeding edge ([`de15ecc`](https://github.com/pranavmishra90/facsimilab-platform/commit/de15ecc511ed4c246bb5c3d975f119518d16361e))

* feat: simplify bleeding edge ([`62160ce`](https://github.com/pranavmishra90/facsimilab-platform/commit/62160ced7ff8be9c86e2e44cad748ad31a9a3bc4))

* feat: add exact commit SHA for the cuda base ([`e3b6a0d`](https://github.com/pranavmishra90/facsimilab-platform/commit/e3b6a0d656bbdcd73ba97e8de67f6e084ba6ed38))

* feat: add more labels and cleanup ([`a9be95c`](https://github.com/pranavmishra90/facsimilab-platform/commit/a9be95ce027faa092a15bbd7e005898ad7b084d3))

* feat: add more OCI labels ([`1e54867`](https://github.com/pranavmishra90/facsimilab-platform/commit/1e548673713ca2ab90136f86e51902ff98a4677c))

* feat: script to clear cache ([`fbe4830`](https://github.com/pranavmishra90/facsimilab-platform/commit/fbe48305b31c164579d10b4cc5afab5bede2c1ec))

* feat: cache export and image export separate for main ([`15b96bb`](https://github.com/pranavmishra90/facsimilab-platform/commit/15b96bb9e24145e37aa6b9bb04640272c2f5cfd1))

* feat: add docker login, push main image directly ([`635a89c`](https://github.com/pranavmishra90/facsimilab-platform/commit/635a89c927f2f46907a56b8a1b42f1dae07f9d5d))

* feat: new action for bleeding edge (each commit) ([`f7200cc`](https://github.com/pranavmishra90/facsimilab-platform/commit/f7200ccde9ffce66d859d048d28957b987b4b0b6))

* feat: new action for bleeding edge (each commit) ([`24f6e8b`](https://github.com/pranavmishra90/facsimilab-platform/commit/24f6e8bd9914e850152e7f0d4dbd5664677c87ba))

* feat: add additional notifications ([`09f4ad2`](https://github.com/pranavmishra90/facsimilab-platform/commit/09f4ad2ee24569c5b29c89e7805d074e86570011))

* feat: change to matrix action ([`95540b2`](https://github.com/pranavmishra90/facsimilab-platform/commit/95540b23e4d678e0f6cccbf112021d2486a241b0))

* feat: add webhook notification additional ([`5ac4e21`](https://github.com/pranavmishra90/facsimilab-platform/commit/5ac4e216750e91e17f337c547db7042854d4e4d6))

* feat: add webhook notification ([`4ce1606`](https://github.com/pranavmishra90/facsimilab-platform/commit/4ce1606127b27c85f47836d1bcf0f9ec0b4ad4be))

* feat: add readme and better build completion statements ([`440e0cb`](https://github.com/pranavmishra90/facsimilab-platform/commit/440e0cbb97c7a106c26da0e0bc8b4ba70fdb6dcc))

* feat: add gitea actions ([`619ee26`](https://github.com/pranavmishra90/facsimilab-platform/commit/619ee26e6a7995a62724ed1592bed4f73e563edb))

* feat: building from full-env and main-env ([`0937c50`](https://github.com/pranavmishra90/facsimilab-platform/commit/0937c5062a187bd51eeb9583cb6d371b95c23398))

* feat: build main image in 2 separate containers, pushing each stage ([`f64e11e`](https://github.com/pranavmishra90/facsimilab-platform/commit/f64e11e6eb8dacd9d490e5581139e7fb5b0e87d0))

* feat: set default to copy environment, not link ([`423811e`](https://github.com/pranavmishra90/facsimilab-platform/commit/423811e47654be02f0943c487de605529104c011))

* feat: building image with some CVE addressed, lightning issue WIP

created github issue on lightning dependency which is different from PIP vs. conda
conda cannot solve the environment with the updated lightning. will update in the next one. ([`7f29646`](https://github.com/pranavmishra90/facsimilab-platform/commit/7f2964625e57f53fbb61f2e09ad5802490bcfb32))

* feat: add build-and-push to main for workflow-dispatch ([`988bdd6`](https://github.com/pranavmishra90/facsimilab-platform/commit/988bdd604673c32e84f92455e20e067116b205b1))

### Refactoring

* refactor(docker): changed directory name for clarity ([`1d389db`](https://github.com/pranavmishra90/facsimilab-platform/commit/1d389db708cc1c3d8d87067306fb1c841ffd5da5))

* refactor(docker):  removing deprecated code with single stage main and full image builds

!BREAKING CHANGE: the older build-all script pointed to the /base, /main, /full directories, which are no longer present ([`2d432e1`](https://github.com/pranavmishra90/facsimilab-platform/commit/2d432e1d62ffd0fedd7c603245eccf39fd7bb9af))

### Testing

* test: contribution to develop branch to see if actions run (#18) ([`c5c6b3a`](https://github.com/pranavmishra90/facsimilab-platform/commit/c5c6b3aa0061c182047c63450e080e84b93f9b6a))

* test(dependencies): refactor / minor changes to gh actions ([`35887fc`](https://github.com/pranavmishra90/facsimilab-platform/commit/35887fca7820e1a5b9f1e779ed1ea096d2b65a1d))

* test(code): change path of image version ([`ef637a4`](https://github.com/pranavmishra90/facsimilab-platform/commit/ef637a4aa4494158e6a42f9cbb40fb8bc0f734d3))

### Unknown

* v0.2.5 - Update packages, multi-stage build with standard and buildx, ci / tests ([`e9f1989`](https://github.com/pranavmishra90/facsimilab-platform/commit/e9f1989f6bac9bc2d1934f389ad4fa51e68e555f))

* Merge branch 'main' into version/0.2.5 ([`38905c2`](https://github.com/pranavmishra90/facsimilab-platform/commit/38905c26aed0d2067a4efdb1f737a91fa0a8f793))

* [DATALAD] Added subdataset ([`c1400d2`](https://github.com/pranavmishra90/facsimilab-platform/commit/c1400d2c89ec089e551857656d667d19971529ff))

* Merge branch 'main' into develop ([`a801138`](https://github.com/pranavmishra90/facsimilab-platform/commit/a801138d28425a1ac8f4e467c47e90562ec26454))

* add action ([`694cf6f`](https://github.com/pranavmishra90/facsimilab-platform/commit/694cf6f4daaea89a2f69ff290b83a007654bdf4c))

* add testing results ([`949b91c`](https://github.com/pranavmishra90/facsimilab-platform/commit/949b91c41d91b38cbbd9951a6b4fd09cffc7a7ab))

* add actions ([`282237a`](https://github.com/pranavmishra90/facsimilab-platform/commit/282237ae19d45308edaedc3e7782dc6a22ff9e61))

* trying to pass in gpu ([`dac127f`](https://github.com/pranavmishra90/facsimilab-platform/commit/dac127fef283e0252cbd2cc0937b702308eb3e90))

* debugging the job summary build ([`9413ed9`](https://github.com/pranavmishra90/facsimilab-platform/commit/9413ed92881f5ad2b80b58c0f9258a663cefa03e))

* Merge branch 'gitea' of github.com:FacsimiLab/dev-platform into gitea ([`102dc55`](https://github.com/pranavmishra90/facsimilab-platform/commit/102dc5510960291feb0ae1c3f64f13619c3f0232))

* change version ([`48c3a8f`](https://github.com/pranavmishra90/facsimilab-platform/commit/48c3a8fe374b838209a5af9ce37c460ff5369744))

* fix concurrancy ([`e37eade`](https://github.com/pranavmishra90/facsimilab-platform/commit/e37eade361103b183c4a0f9bf332d4d3c457babf))

* Merge branch 'gitea' of github.com:pranavmishra90/facsimilab-platform into gitea ([`bad7a5a`](https://github.com/pranavmishra90/facsimilab-platform/commit/bad7a5ac27f0688422839723875c14f5dcfc387a))

* Update build-and-push.yml ([`0d35691`](https://github.com/pranavmishra90/facsimilab-platform/commit/0d35691e53687627a10be7ed27b781a9ed5c1b6a))

* remove conditions for the test compose action ([`4c75f9e`](https://github.com/pranavmishra90/facsimilab-platform/commit/4c75f9edc5d0d14dd042271e009bd3cc78375c43))

* Merge branch 'gitea' of github.com:pranavmishra90/facsimilab-platform into gitea ([`a78a95f`](https://github.com/pranavmishra90/facsimilab-platform/commit/a78a95f96fcb69fce2ab2aab1f6bf68dbbf92f8f))

* adding more commands including copy ([`b1bcbba`](https://github.com/pranavmishra90/facsimilab-platform/commit/b1bcbba26f5102213f00307b51af3f6c15bd90a8))

* adding more commands including copy ([`ae10e7b`](https://github.com/pranavmishra90/facsimilab-platform/commit/ae10e7b1cb20c673782897accb27df43457af111))

* add quotes ([`5837efc`](https://github.com/pranavmishra90/facsimilab-platform/commit/5837efccb3ee0d816e8db9579991335f298870bc))

* add quotes ([`6dfcf19`](https://github.com/pranavmishra90/facsimilab-platform/commit/6dfcf198410d30395ced461dbb207d97ab9f3a72))

* add quotes ([`987a0b0`](https://github.com/pranavmishra90/facsimilab-platform/commit/987a0b03287b8b505484a51af017a2c61af0d883))

* try new ([`e615601`](https://github.com/pranavmishra90/facsimilab-platform/commit/e6156014a7410d2509afd1052098ee205307c511))

* try new ([`2e8e71e`](https://github.com/pranavmishra90/facsimilab-platform/commit/2e8e71e80a8949a4b23b96aeabf9cb4eeac5ac05))

* change to selfhosted ([`aea2c7c`](https://github.com/pranavmishra90/facsimilab-platform/commit/aea2c7cc625d53b13406a9b16f822715626957ab))

* change full to main image ([`99bdf73`](https://github.com/pranavmishra90/facsimilab-platform/commit/99bdf73ad6b17dd0795c40c01306b7c7ccf5c1de))

* running a test using a docker container run ([`7221ad2`](https://github.com/pranavmishra90/facsimilab-platform/commit/7221ad29ac1b6a19764729b777c1521bf42a649a))

* test container workflow ([`1eceda5`](https://github.com/pranavmishra90/facsimilab-platform/commit/1eceda584c6a5f908e08199a79ef8b5ec0dd6401))

* get image info ([`8514f23`](https://github.com/pranavmishra90/facsimilab-platform/commit/8514f235fe72678524e52194aa09a3ad5e05fbd3))

* get image info ([`523fd12`](https://github.com/pranavmishra90/facsimilab-platform/commit/523fd12d5c8839a66988f43ae4a4ca4f01f8adfc))

* get image info ([`65e9ddf`](https://github.com/pranavmishra90/facsimilab-platform/commit/65e9ddf27d9e246bfac822765d569d4152ea0a46))

* get image info ([`b733ff3`](https://github.com/pranavmishra90/facsimilab-platform/commit/b733ff353a17b5f4971977aa7fc71ffc1836f7bd))

* get image info ([`c954638`](https://github.com/pranavmishra90/facsimilab-platform/commit/c95463879734cc2807794ede167b0d1dc8430891))

* using workspace var ([`dfa7263`](https://github.com/pranavmishra90/facsimilab-platform/commit/dfa7263f7b45858780e4aa695a83b3320d7227dc))

* changing to run ([`89fde89`](https://github.com/pranavmishra90/facsimilab-platform/commit/89fde8929ce1dc8a355cdd390e00d05bbd001a48))

* changing to run ([`4da9c6a`](https://github.com/pranavmishra90/facsimilab-platform/commit/4da9c6a1b3d06424b58bba9bb8ac11f0c05f0af4))

* fix missing tree ([`1060779`](https://github.com/pranavmishra90/facsimilab-platform/commit/10607795e412721eda120c219762440080584c3a))

* testing ([`a3f0903`](https://github.com/pranavmishra90/facsimilab-platform/commit/a3f090366c53ff9ea1dd1d97ccf129777ccec815))

* using actoins used in protocol timer ([`4b78590`](https://github.com/pranavmishra90/facsimilab-platform/commit/4b78590f1c07f3ac76eb8701368ec3d4bc505840))

* fix concurrancy and -e flag ([`e0c4c92`](https://github.com/pranavmishra90/facsimilab-platform/commit/e0c4c92d09531cf6ce1825387259daad56b59b8f))

* tmp remove concurrancy ([`4f13427`](https://github.com/pranavmishra90/facsimilab-platform/commit/4f13427ad236673e269f8c37fac27282b47c8ecf))

* modify actions ([`4164ab9`](https://github.com/pranavmishra90/facsimilab-platform/commit/4164ab909a3f32b9a41be57993cbd2045484c766))

* change name to start action ([`f6e4c2f`](https://github.com/pranavmishra90/facsimilab-platform/commit/f6e4c2f5bd3c1f8b8e07febe7d165af3449bce59))

* improved workflows ([`fa8d739`](https://github.com/pranavmishra90/facsimilab-platform/commit/fa8d739aec6e3d96fc165f2ec43db76d08143bcb))

* Fixing full image WIP ([`479c8ca`](https://github.com/pranavmishra90/facsimilab-platform/commit/479c8ca5502058859994172f0521f544668b7793))

* ix: runs on ([`2855187`](https://github.com/pranavmishra90/facsimilab-platform/commit/2855187c6b67c0b91d00102f34d159b8f1b4522c))

* v0.2.5-beta8 - CI working on main image, now building all ([`0f4fa2d`](https://github.com/pranavmishra90/facsimilab-platform/commit/0f4fa2d20f4fa88875362be174aacfe10e53ac47))

* removed cuda submodule [WIP] ([`303b6e7`](https://github.com/pranavmishra90/facsimilab-platform/commit/303b6e706193958efc591e76af83efb011ae6ed9))

* Merge branch 'main' into develop ([`520140f`](https://github.com/pranavmishra90/facsimilab-platform/commit/520140f44b670d3d1096a04e510edbc2b935e125))


## v0.2.4 (2024-08-09)

### Bug Fixes

* fix: ci cleanup was erroring out; push was difficult to track ([`cf4ceec`](https://github.com/pranavmishra90/facsimilab-platform/commit/cf4ceec3fcfd31858ca13eb72c45ad54c2137433))

* fix: error in spelling filename ([`c418d64`](https://github.com/pranavmishra90/facsimilab-platform/commit/c418d6415bfbda90d3d96aa7fbb56b5c7c1a8034))

* fix: move condarc into the final build stage ([`b09130a`](https://github.com/pranavmishra90/facsimilab-platform/commit/b09130a1c4c1ff086761f8f823874ff62afec070))

* fix: remove extraneous files, get standard jupyter notebook working for a dockerized setup ([`bf5ebbf`](https://github.com/pranavmishra90/facsimilab-platform/commit/bf5ebbf9e87c7e684dafb0be71266e411bc51857))

* fix(test): Mount gitconfig in github runners ([`254ec62`](https://github.com/pranavmishra90/facsimilab-platform/commit/254ec621b2858c868baefd554b67b34f0a714ec0))

* fix: cat to echo ([`03c50ec`](https://github.com/pranavmishra90/facsimilab-platform/commit/03c50ec55a0b51a3b34f72d6f06d3b63f9a6c5cf))

* fix(ci): main and full image prints ([`c922e5c`](https://github.com/pranavmishra90/facsimilab-platform/commit/c922e5c53afd1d524375a7e71975b8b1cd10ce7b))

* fix(ci): header typo ([`efd13ba`](https://github.com/pranavmishra90/facsimilab-platform/commit/efd13ba2eef10735c331c627e064bc66e7ca8f8c))

* fix(ci): Job summary sources ([`9ab96bc`](https://github.com/pranavmishra90/facsimilab-platform/commit/9ab96bcbc3ab204ad5301c48a8f15068f8473778))

* fix(test): correct python path for main container ([`b7f2c55`](https://github.com/pranavmishra90/facsimilab-platform/commit/b7f2c55e9fa17b319dbcf9b386504f23db2e0ac3))

* fix(test): correct python path for main container ([`aa9cead`](https://github.com/pranavmishra90/facsimilab-platform/commit/aa9cead465352e341c78f598911affb0b7b3a6b4))

* fix(test): Add tests for main and full image to the build and push ([`b74fb57`](https://github.com/pranavmishra90/facsimilab-platform/commit/b74fb5740294b0d8d22cc930510a7c61c465373a))

* fix: change docker label to latest ([`394eaaf`](https://github.com/pranavmishra90/facsimilab-platform/commit/394eaafd41ab7767b67c6d11e6cc0e6c0bd165f2))

* fix(wip): removing tty terminal ([`7036fb8`](https://github.com/pranavmishra90/facsimilab-platform/commit/7036fb82af72c7a64ecb0601270884acca8cae52))

* fix: runs on ([`084085d`](https://github.com/pranavmishra90/facsimilab-platform/commit/084085d686285be92f1be56aecdf4facab36aa2a))

* fix: Add credentials to ghcr.io ([`63e2ae0`](https://github.com/pranavmishra90/facsimilab-platform/commit/63e2ae041a027731d8144f04017dfac8fa8c3e8f))

* fix: container label ([`685df5f`](https://github.com/pranavmishra90/facsimilab-platform/commit/685df5f7a9e59cceb73c75206ed0b3b93dc04944))

* fix: docker tags and repository to ghcr ([`1ad2e19`](https://github.com/pranavmishra90/facsimilab-platform/commit/1ad2e194af59065cc8a7b4f7e3e1e85a8644d4c2))

* fix: Fix problem with seeing and logging the push to docker repos ([`9358b5d`](https://github.com/pranavmishra90/facsimilab-platform/commit/9358b5d23fe9871c6f9485cbc5d51a893a0931d6))

* fix: Removed ~/ from being mounted which interferes with docker configuration ([`2522376`](https://github.com/pranavmishra90/facsimilab-platform/commit/2522376da100cac4a742a93900256e84fe09af2b))

* fix: build and push scripts can be run from any directory ([`5d5b91e`](https://github.com/pranavmishra90/facsimilab-platform/commit/5d5b91ef1d77ec723a3e724bdc004226b8321f94))

### Build System

* build(dependencies): bump python package versions ([`1867952`](https://github.com/pranavmishra90/facsimilab-platform/commit/186795227e3705fe9bade0547450fa64b0b00394))

* build(docker): New script to build only the full container, tag as dev, and push to Docker ([`808418c`](https://github.com/pranavmishra90/facsimilab-platform/commit/808418ce4703688cf0bf11c9e57054040fe294bb))

### Code Style

* style: cleanup ([`d4cf036`](https://github.com/pranavmishra90/facsimilab-platform/commit/d4cf036287e38d19be2ead740170ad445d1aee4c))

### Continuous Integration

* ci: trying checkout v4 ([`39b707d`](https://github.com/pranavmishra90/facsimilab-platform/commit/39b707dc359c50ea066fe927e274e129a0ae0abf))

* ci: trying checkout v3 ([`975f168`](https://github.com/pranavmishra90/facsimilab-platform/commit/975f168b5e04a73e6a1fe3875554e2f3b1f1a4e1))

* ci: do not perform clean checkout due to error ([`c1df9ee`](https://github.com/pranavmishra90/facsimilab-platform/commit/c1df9eecfd9d8ca828880d2526c3d780ac3ee5a2))

* ci: Add condition for run ([`6b0e573`](https://github.com/pranavmishra90/facsimilab-platform/commit/6b0e573f4a9590f6e3660c60c07161c959ac79ba))

* ci(test): check datalad for main ([`3889537`](https://github.com/pranavmishra90/facsimilab-platform/commit/3889537b9618e37c9b26d559cc28d5ed5b8a9dbd))

* ci: ci: Add filters to the pull request ([`0de54c8`](https://github.com/pranavmishra90/facsimilab-platform/commit/0de54c80d3e3c4146701a899596dd24b31ec1217))

* ci(docker): Push only to docker, not gitea ([`4484e75`](https://github.com/pranavmishra90/facsimilab-platform/commit/4484e75144c57fee141434116932f2d2adb4b06d))

* ci(dependencies): Check python packages in main and full images ([`cae239b`](https://github.com/pranavmishra90/facsimilab-platform/commit/cae239b6d8d7a625f754ce68a5bf8335ab70acb0))

* ci(dependencies): Test only on a push to main ([`ed41b24`](https://github.com/pranavmishra90/facsimilab-platform/commit/ed41b241c556cf306d5914284d79294ce98fc02e))

* ci(docker): WIP build and push ([`2d1fb0a`](https://github.com/pranavmishra90/facsimilab-platform/commit/2d1fb0ab3e6e7fb26107cc7c2d641d52c416ee39))

* ci(docker): Add condition to check if a new build_version is detected ([`63ca558`](https://github.com/pranavmishra90/facsimilab-platform/commit/63ca558eb959e8175214cde82d001d2cad8a87d7))

* ci(docker): Build and push a tagged image version ([`bb7706e`](https://github.com/pranavmishra90/facsimilab-platform/commit/bb7706e46d3130f55a5c0237572abee8efb5d650))

* ci: create a job summary ([`3894897`](https://github.com/pranavmishra90/facsimilab-platform/commit/3894897c0b34888d868e05ec35cfe02bc97284cc))

* ci: add selfhosted runner ([`4a2c5a6`](https://github.com/pranavmishra90/facsimilab-platform/commit/4a2c5a6726ee1c6353e87e0318010ede734911f8))

* ci(test): Results to an upload artifact ([`121b48f`](https://github.com/pranavmishra90/facsimilab-platform/commit/121b48fb962c75b94a127b5b45a57b0f6048e744))

* ci(test): Running versions inside of the docker container ([`9c6e5b6`](https://github.com/pranavmishra90/facsimilab-platform/commit/9c6e5b68df384375874fddc5cd2613346d2300f9))

* ci(wip): using dockerhub ([`b5b8996`](https://github.com/pranavmishra90/facsimilab-platform/commit/b5b8996c0be6a9521401489fa9f22f9a821499ec))

* ci: Init a dev facsimilab container test ([`75c0f12`](https://github.com/pranavmishra90/facsimilab-platform/commit/75c0f12b1e1f49abbd244c85db0209ad2d02f2a4))

### Documentation

* docs:  (#5) Update readme, licenses for the GPU capable multi image facsimilab platform

Merge pull request #5 from pranavmishra90/develop ([`ba96eb3`](https://github.com/pranavmishra90/facsimilab-platform/commit/ba96eb3a165acf8bcb93708492941dd02c4cab4a))

* docs: Update readme for the GPU capable multi image facsimilab platform ([`e6f47ce`](https://github.com/pranavmishra90/facsimilab-platform/commit/e6f47cedd3b65994ac5a9b9894f2bd620ce4de54))

### Features

* feat: modified readme for pranavmishra90's images ([`0d28f8a`](https://github.com/pranavmishra90/facsimilab-platform/commit/0d28f8aacbaa57a9d9467badbfd8d7b51f42b121))

* feat: making small change for ci ([`3acfe74`](https://github.com/pranavmishra90/facsimilab-platform/commit/3acfe742eb36b9a7952d16d3b58c342dfc9d8350))

* feat: full image build and buildx engines working. testing buildx ci ([`619aa30`](https://github.com/pranavmishra90/facsimilab-platform/commit/619aa30e23a504c8411a80a933aa29b74488cd03))

* feat: add the nvidia/cuda base image as part of build-all

We want to ensure that our ubuntu base image is up to date ([`d063567`](https://github.com/pranavmishra90/facsimilab-platform/commit/d063567e5fb6a36e79ff6991f0a716d3cd8e50b7))

* feat: rename build_version.txt to image_version.txt for ease of autocomplete ([`7b2778d`](https://github.com/pranavmishra90/facsimilab-platform/commit/7b2778d8cfb1450a6af451e445c67f362b0a62b7))

* feat: improved caching ([`cf0c0b4`](https://github.com/pranavmishra90/facsimilab-platform/commit/cf0c0b4b9a27c6bd2a5813dbc0a49afcf4ec5c34))

* feat: improved workflow, simplified copy statements ([`9be923f`](https://github.com/pranavmishra90/facsimilab-platform/commit/9be923f9d1f2619c29e5e0124b2224ee7cee1758))

* feat: start pushing docker base images in background during build ([`e5f1f14`](https://github.com/pranavmishra90/facsimilab-platform/commit/e5f1f142b014c15b50d7de027183f91d50c9e047))

* feat(dependencies): Removing zenodo_get due to reducancy with pooch ([`48bfafc`](https://github.com/pranavmishra90/facsimilab-platform/commit/48bfafc68b70028f3030a85c96dc3db96d6d76cb))

* feat: Add dockerfile syntax ([`64bb65b`](https://github.com/pranavmishra90/facsimilab-platform/commit/64bb65b323c703e934091c9fcc4d48cddb5b049f))

* feat: add openpyxl for reading excel files ([`dbfacd5`](https://github.com/pranavmishra90/facsimilab-platform/commit/dbfacd5c379d37869a44cc1851514b2004867a5e))

* feat: WIP v0.2.5 with added and updated packages, improved ci, tested on tutorials ([`ec202a4`](https://github.com/pranavmishra90/facsimilab-platform/commit/ec202a49f49238c5c040366e39d0ee6cecc170ba))

* feat: Add bbknn ([`94458e4`](https://github.com/pranavmishra90/facsimilab-platform/commit/94458e4b3caf4f4124c1b8c45d02cd2786f2fed8))

* feat: Add primer3-py ([`a2ab3a4`](https://github.com/pranavmishra90/facsimilab-platform/commit/a2ab3a45d6200b9643864725a634d40564301355))

* feat: Add faiss-gpu ([`66f3551`](https://github.com/pranavmishra90/facsimilab-platform/commit/66f3551fe077723b61d74b0889c43d01c2199d3e))

* feat: Add dask ([`8986b9e`](https://github.com/pranavmishra90/facsimilab-platform/commit/8986b9e707b8df9609533e2a885680bcd15d7583))

* feat: Add current state ([`50222a8`](https://github.com/pranavmishra90/facsimilab-platform/commit/50222a8e60e0077a5a987fcfb8e2b359b4e30eac))

* feat(ci): when adding python packages, build only the full image ([`956601a`](https://github.com/pranavmishra90/facsimilab-platform/commit/956601afa79c9c97e058707b77a1300df7ccd8a7))

* feat: set default environment ([`81cfe9d`](https://github.com/pranavmishra90/facsimilab-platform/commit/81cfe9dda0e64e9b0a4be36587c74f1b89e29772))

* feat: Add additional scverse packages, rmm ([`6fc4650`](https://github.com/pranavmishra90/facsimilab-platform/commit/6fc46507b46742e8ec2fbc99cd5d480af9428007))

* feat: add new packages and notebooks for testing ([`0747686`](https://github.com/pranavmishra90/facsimilab-platform/commit/0747686d55b90da42f45dd7ae34c6a472037fcfe))

* feat: results for versions ([`ef714ac`](https://github.com/pranavmishra90/facsimilab-platform/commit/ef714ac80e57c357e075682615f54a6b3308a26d))

* feat: Pass through ports for jupyter server in docker container ([`0a32d33`](https://github.com/pranavmishra90/facsimilab-platform/commit/0a32d33e3fba6e6c9283f8696d6ec4b4a6fe9dbb))

* feat(dependencies): Add fa2 v0.3.5 ([`3ab6c59`](https://github.com/pranavmishra90/facsimilab-platform/commit/3ab6c594c54ae29c920d44ffac709319c8e72bb3))

* feat(dependencies): Add `ForceAtlas2` algorithm for network visualization

Add accompanying citation: 10.1371/journal.pone.0098679

Starting new version --> v0.2.5 ([`ea153df`](https://github.com/pranavmishra90/facsimilab-platform/commit/ea153df67b23ea281f2ed1685dafd5f5581e8119))

* feat: Add references in biblatex format ([`eb577c0`](https://github.com/pranavmishra90/facsimilab-platform/commit/eb577c0200aa3075222af6c8107e2f2b6d4ebaa9))

* feat: Dynamic build and push scripts; conda-lock

version number is picked up from a text file inside of the /docker dir
this is then fed into the build-all.sh and push-all.sh files

we are now using a conda-lock file to ensure proper images. This is
programmatically generated from the environment.yml file inside of
the full container's directory. ([`c926fab`](https://github.com/pranavmishra90/facsimilab-platform/commit/c926fab718cf718108368a5a190aae73b4f7a9e7))

* feat(dependency): Add pipx, preferring native docker builder, cleanup ([`c5b0f2c`](https://github.com/pranavmishra90/facsimilab-platform/commit/c5b0f2cc4aa4c2c9fe64ed9e40c7da41202d4e1a))

* feat(build): WIP building v0.2.4-lock ([`93ddd6e`](https://github.com/pranavmishra90/facsimilab-platform/commit/93ddd6ef4465e862e1981dfc88d24564cb9da330))

* feat: add local bare metal conda lock ([`37e14c8`](https://github.com/pranavmishra90/facsimilab-platform/commit/37e14c823c665db7b2c51c0ae5955cbf9bb20633))

* feat(dependency): WIP testing cuda 12.4 container

Building platform:

+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 555.42.06              Driver Version: 555.42.06      CUDA Version: 12.5     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 3060        Off |   00000000:05:00.0 Off |                  N/A |
|  0%   38C    P8             12W /  170W |    1854MiB /  12288MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+ ([`e474bb1`](https://github.com/pranavmishra90/facsimilab-platform/commit/e474bb16d10d8fe70e7a3b27c98d96af54b22f1d))

* feat(dependency): bump datalad 1.1 ([`79f78c3`](https://github.com/pranavmishra90/facsimilab-platform/commit/79f78c364cf80b25c81287ad938547ed2b3d766d))

* feat: move quick deploy ([`b529e0e`](https://github.com/pranavmishra90/facsimilab-platform/commit/b529e0e9efb91fda1c64cf5e03f1a4a8d2caf10d))

* feat(devcontainer): switch back to full container ([`a72e4e4`](https://github.com/pranavmishra90/facsimilab-platform/commit/a72e4e46d52490c5f8eae583635a27d956e81465))

### Performance Improvements

* perf(dependencies): Do not rerun a conda-lock generation ([`1aa62ae`](https://github.com/pranavmishra90/facsimilab-platform/commit/1aa62aecd3a054aa73628abdf845147619dc3e1f))

### Testing

* test(dependencies): Add addtional packages to be tested

Taken from the Prrx1 notebook for hardware and software testing ([`c2956fe`](https://github.com/pranavmishra90/facsimilab-platform/commit/c2956fe098799a69d233133b61e3bbe0ad5f38eb))

* test(dependencies): Check current package versions and see if updates are possible ([`91c7139`](https://github.com/pranavmishra90/facsimilab-platform/commit/91c71391da4a58f5087da2033add3c13f84e3b2c))

* test: checking versions of python packages in the container ([`5f2041c`](https://github.com/pranavmishra90/facsimilab-platform/commit/5f2041ce832847a63eff6a35b34694806cc53d43))

### Unknown

* Using a conda lock file to fix GPU-enable pytorch + dependencies not being added correctly ([`e7f380e`](https://github.com/pranavmishra90/facsimilab-platform/commit/e7f380eb82eb4c6c0119fa3265df2daf1c31fcd0))

* [DATALAD] Added subdataset ([`705e263`](https://github.com/pranavmishra90/facsimilab-platform/commit/705e263817fc2f4097501cffdc4df0e390b19035))

* [DATALAD] Recorded changes ([`f914234`](https://github.com/pranavmishra90/facsimilab-platform/commit/f914234fea871929e5992c4168225b578e97d2f4))

* [DATALAD] new dataset ([`2eca83d`](https://github.com/pranavmishra90/facsimilab-platform/commit/2eca83da48589258d9b50f868b4a0ece4c3ff4e0))

* [AUTO]Docker images built and pushed

Files changed:
M	docker/metadata/01-base_metadata.json
M	docker/metadata/02-main_metadata.json
M	docker/metadata/03-full_metadata.json
M	testing/results/full-image.txt
M	testing/results/main-image.txt ([`e6d5f8f`](https://github.com/pranavmishra90/facsimilab-platform/commit/e6d5f8f51e527bb88ffb15925d67edbdb7f5828f))

* Merge branch 'main' into develop ([`9dfd507`](https://github.com/pranavmishra90/facsimilab-platform/commit/9dfd50779402cfb284b788d837f9463132c6b28c))

* having issue with jaxlib installation not detecting cuda. testing on older image ([`8ff5f28`](https://github.com/pranavmishra90/facsimilab-platform/commit/8ff5f283ff6c0fc7b355f529c56b8acdcfeaef80))

* having issue with jaxlib installation not detecting cuda. testing on older image ([`dffe3fd`](https://github.com/pranavmishra90/facsimilab-platform/commit/dffe3fd59f79e1eb617d741b2839e7cef5570748))

* moving out doublet detection ([`50a11b4`](https://github.com/pranavmishra90/facsimilab-platform/commit/50a11b40245c7711af0ff3210f778e3405d45ed6))

* Removed code-workspace from git ([`a66a961`](https://github.com/pranavmishra90/facsimilab-platform/commit/a66a961d80efe2703444905fb4e46ff4670a6157))

* doc(licenses): Add Nvidia CUDA docker image license ([`fbb336f`](https://github.com/pranavmishra90/facsimilab-platform/commit/fbb336f5cab1cd8ac9a79e4ec0a911e6b508fb06))

* Merge branch 'main' into develop v0.2.1 ([`578ba06`](https://github.com/pranavmishra90/facsimilab-platform/commit/578ba06e3f42d69a6045c16ffa953b21d5c0bba9))


## v0.2.1 (2024-07-04)

### Bug Fixes

* fix(docker): .profile --> .bash_aliases. removed /bin/conda causing init error. installed main base into base env ([`07b1c00`](https://github.com/pranavmishra90/facsimilab-platform/commit/07b1c006a1c6492319fbdefbb78a31d35407cef5))

* fix(docker): remove failing autoactivate of facsimilab env ([`9596784`](https://github.com/pranavmishra90/facsimilab-platform/commit/9596784b209a4c6fdb69f634848b033cf4eb3754))

### Build System

* build(docker): build scripts working for all images ([`11879f8`](https://github.com/pranavmishra90/facsimilab-platform/commit/11879f80aace595ecd478ad87178c34b28edfee4))

### Documentation

* docs(licenses): Add rclone license ([`3596cf3`](https://github.com/pranavmishra90/facsimilab-platform/commit/3596cf35166cd638033713309a1be08819c9d1da))

### Features

* feat(docker): Add rclone for datalad remote siblings. .bash_aliases. Base and facsimilab env (#4) v0.2.1

* Add / Fix: [WIP] Working docker image with CUDA12.1

Why: cuda was not working on the previous method of config

How:

base image has changed to nvidia's image. no longer using vscode since
that is image bloat

Pytorch is being installed with pip with a cuda requirement. This is
uninstalling the version from conda and reinstalling

Tags: nvidia, cuda, pytorch, pip, conda

* Fix: torch version printout

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage

* feat(docker): Multistage builds

faster testing of docker builds. Improved debugging with python packages

* feat: Add dynamic load/run of scvi model if it does / does not exist

Determine if a trained scvi model exists. If so, load it. If not,
train a new model.

* feat(docker): Updated method for passing version number; push script which adds latest tag

* feat(docker): Add dockerignore

* feat(docker): updated quick build and docker-compose files for testing

* feat(docker): preparing v0.2.1 which adds back rclone

* feat(docker): Add sound alert on script completion

* fix(docker): remove failing autoactivate of facsimilab env

* fix(docker): .profile --> .bash_aliases. removed /bin/conda causing init error. installed main base into base env

* build(docker): build scripts working for all images

* docs(licenses): Add rclone license ([`6115a0d`](https://github.com/pranavmishra90/facsimilab-platform/commit/6115a0dd3daa96353e4d6ddc1b626f78638031a6))

* feat(docker): Add rclone, use.bash_aliases, use discrete base environment for facsimilab-main

WIP v0.2.1 Add rclone, use .bash_aliases, use discrete base environment for facsimilab-main ([`e987f9f`](https://github.com/pranavmishra90/facsimilab-platform/commit/e987f9f23b32410e9cc6670889cbc61c8425d2b7))

* feat(docker): Add sound alert on script completion ([`f94ca6a`](https://github.com/pranavmishra90/facsimilab-platform/commit/f94ca6a92d10589002d960ed39eb43432999c498))

* feat(docker): preparing v0.2.1 which adds back rclone ([`96c9e41`](https://github.com/pranavmishra90/facsimilab-platform/commit/96c9e4171058a70bbd2f91ff7964a245e951822b))

### Unknown

* Merge branch 'main' into develop ([`73e9a2f`](https://github.com/pranavmishra90/facsimilab-platform/commit/73e9a2f04f4b39ed9ba7bc6b964765ccb6681117))


## v0.2.0 (2024-07-04)

### Features

* feat(docker): Creation of multiple docker images (#2) v0.2.0

* Add / Fix: [WIP] Working docker image with CUDA12.1

Why: cuda was not working on the previous method of config

How:

base image has changed to nvidia's image. no longer using vscode since
that is image bloat

Pytorch is being installed with pip with a cuda requirement. This is
uninstalling the version from conda and reinstalling

Tags: nvidia, cuda, pytorch, pip, conda

* Fix: torch version printout

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage

* feat(docker): Multistage builds

faster testing of docker builds. Improved debugging with python packages

* feat: Add dynamic load/run of scvi model if it does / does not exist

Determine if a trained scvi model exists. If so, load it. If not,
train a new model.

* feat(docker): Updated method for passing version number; push script which adds latest tag

* feat(docker): Add dockerignore

* feat(docker): updated quick build and docker-compose files for testing ([`92fe9cd`](https://github.com/pranavmishra90/facsimilab-platform/commit/92fe9cd592f814ce868713dc6f97ebadc4c611d9))

* feat(docker): updated quick build and docker-compose files for testing ([`a4f43a9`](https://github.com/pranavmishra90/facsimilab-platform/commit/a4f43a904e011b550d30dab7266077e28cc6de63))

* feat(docker): Add dockerignore ([`f49490b`](https://github.com/pranavmishra90/facsimilab-platform/commit/f49490b8e4fbfb2abe4a50db255828f0622b9c7f))

* feat(docker): Updated method for passing version number; push script which adds latest tag ([`fb4d039`](https://github.com/pranavmishra90/facsimilab-platform/commit/fb4d0396660d23fd58fb0dc3140e01ee898f59f6))

* feat: Add dynamic load/run of scvi model if it does / does not exist

Determine if a trained scvi model exists. If so, load it. If not,
train a new model. ([`5438df0`](https://github.com/pranavmishra90/facsimilab-platform/commit/5438df04a8f317d97b6191fc8e48eefbeabb8183))

* feat(docker): Multistage builds

faster testing of docker builds. Improved debugging with python packages ([`0821ac8`](https://github.com/pranavmishra90/facsimilab-platform/commit/0821ac87df68f073250ecc891be5f89f62e7989c))

### Unknown

* Merge pull request #1 from pranavmishra90/feat/multiple-images

v0.2.0 - Creation of multiple docker images ([`2a5d5c3`](https://github.com/pranavmishra90/facsimilab-platform/commit/2a5d5c310c57059aec19e44a329113bf003bdc86))

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage ([`35f9d5a`](https://github.com/pranavmishra90/facsimilab-platform/commit/35f9d5ada002d201dc0c151babc112aee0a5a995))

* Add: 3 docker containers with increasingly larger sizes and number of packages

Why: Want to provide minimal docker containers while improving build efficiency

How: multi-stage builds

Tags: docker, multi-stage ([`57781c4`](https://github.com/pranavmishra90/facsimilab-platform/commit/57781c4e9cb3f462ccd7cef2ec0adbf902574db0))

* Fix: torch version printout ([`445f226`](https://github.com/pranavmishra90/facsimilab-platform/commit/445f226855155f1f3e0654d6a62e2d5dedc4e646))

* Add / Fix: [WIP] Working docker image with CUDA12.1

Why: cuda was not working on the previous method of config

How:

base image has changed to nvidia's image. no longer using vscode since
that is image bloat

Pytorch is being installed with pip with a cuda requirement. This is
uninstalling the version from conda and reinstalling

Tags: nvidia, cuda, pytorch, pip, conda ([`23013e1`](https://github.com/pranavmishra90/facsimilab-platform/commit/23013e1060632099261564a37fd11a8bfc363a7e))


## v0.1.0 (2024-05-07)

### Unknown

* Fix / Rephrase: Migration to Facsimilab

Replacing references to singulab. ([`d63a9ea`](https://github.com/pranavmishra90/facsimilab-platform/commit/d63a9eada6c5bdcc0b6b235f12d4223a65e03e10))

* Migration to Facsimilab

We have renamed the SinguLab project to *FacsimiLab*!

Our new name is a portmonteau of [**facsimile**](https://www.merriam-webster.com/dictionary/facsimile) and **laboratory**. Not only is it "more unique", it is also more reflective of the project's objective: to create a reproducible research environment with identical packages and platforms.  Using environment files and [OCI](https://opencontainers.org/) compatible build instructions, FacsimiLab will be the path forward for replacing "it works on my computer" with "I've looked at your data and reproduced your results".

We hope you follow our project's ongoing development at [github.com/FascimiLab](https://github.com/FacsimiLab) and [pranavmishra90/FacsimiLab-platform](https://github.com/pranavmishra90/FacsimiLab-platform).

This GitHub repository at [pranavmishra90/SinguLab](https://github.com/pranavmishra90/SinguLab) is now archived. ([`0fc5557`](https://github.com/pranavmishra90/facsimilab-platform/commit/0fc5557081706f21ec672b257cef1ceb9a109ecf))

* Bump scvi-tools to 1.1 ([`ac2b127`](https://github.com/pranavmishra90/facsimilab-platform/commit/ac2b127f0039c12b65317c45e87979841d0c1d31))

* WIP ([`aad2ffe`](https://github.com/pranavmishra90/facsimilab-platform/commit/aad2ffe0669cc043531259415f48a9ab92b32895))

* Name change ([`37f1c44`](https://github.com/pranavmishra90/facsimilab-platform/commit/37f1c44cd96827d6893d0a02f715c9c5dc585207))

* Adding major licenses and references ([`88da37a`](https://github.com/pranavmishra90/facsimilab-platform/commit/88da37a23af08f71c953cffd9e17f258e154ab51))

* Bump: Quarto to 1.4.550

Why: Increase from Quarto 1.3 to 1.4 has many additional features
found at: https://quarto.org/docs/blog/posts/2024-01-24-1.4-release/

How: https://github.com/quarto-dev/quarto-cli/releases/download/
v1.4.550/quarto-1.4.550-linux-amd64.deb

Tags: quarto ([`6404173`](https://github.com/pranavmishra90/facsimilab-platform/commit/6404173607bc078878b9475d834e84bbe73d95b3))

* Pin 4.21.2-39 for coder ([`1f54160`](https://github.com/pranavmishra90/facsimilab-platform/commit/1f54160201472107377e3a7138b26d7eec76fcf5))

* Replacing singulab with facsimilab ([`6585827`](https://github.com/pranavmishra90/facsimilab-platform/commit/6585827b76448ace3366afadcf92f4fbcdc723f4))

* Name change to FacsimiLab and archive repository

Name change to FacsimiLab and archive repository ([`b4295c6`](https://github.com/pranavmishra90/facsimilab-platform/commit/b4295c63d83a31a735a3d83116fad794e401e29e))

* Modify readme to explain name change and archive status ([`b843ca1`](https://github.com/pranavmishra90/facsimilab-platform/commit/b843ca1228e5f48f71cdc6fe06512c049e233438))

* Modify readme to explain name change and archive status ([`4cd654b`](https://github.com/pranavmishra90/facsimilab-platform/commit/4cd654b595e82d30f426628987310000c6096faf))

* Merge pull request #7 from pranavmishra90/debug

New CPU based image. Removed deprecated jupyter server. GPU container is WIP ([`b72efc8`](https://github.com/pranavmishra90/facsimilab-platform/commit/b72efc8d38d0856d69615dcbdce6e2044611c891))

* chmod ([`b9b6627`](https://github.com/pranavmishra90/facsimilab-platform/commit/b9b66278de23328ade41755083367b720bfc3669))

* Fix Docker image printout at the end of build ([`dec7c52`](https://github.com/pranavmishra90/facsimilab-platform/commit/dec7c52895162fd9b41a9e90305ae30386d5fbf5))

* Fix: docker image names, documentation ([`54501a0`](https://github.com/pranavmishra90/facsimilab-platform/commit/54501a06d70f3d3f485cc32e5965c2dc954c42a2))

* Removed the original jupyter notebook base image which is no longer being used ([`706ed63`](https://github.com/pranavmishra90/facsimilab-platform/commit/706ed633533865a5435d4c499a1bdb4d2b489d48))

* WIP: Testing Nvidia CUDA ([`0abdc06`](https://github.com/pranavmishra90/facsimilab-platform/commit/0abdc06330aa0e9abb1b89411a528f915fa1d519))

* Add (WIP): Nvidia CUDA based container for GPU accelerated analysis

Why: performing next-gen -omics experiments in the CPU takes many multiples
longer than using a GPU. We will leverage Nvidia's CUDA for GPU
based analyses.

How:

Using `nvidia/cuda:12.3.1-base-ubuntu22.04` as a base container.
Tags: GPU, Nvidia, CUDA ([`937bc74`](https://github.com/pranavmishra90/facsimilab-platform/commit/937bc74454c3867dc225dd5b88d36558240fda92))

* Now testing scRNAseq env copied from the experiment ([`7499aed`](https://github.com/pranavmishra90/facsimilab-platform/commit/7499aeda4832710a1d6ca354041a54b8ea0dc007))

* begin debugging ([`b77cfbb`](https://github.com/pranavmishra90/facsimilab-platform/commit/b77cfbb9f002e536bec3425e038b3f42af0355b2))

* Rename directory ([`389494f`](https://github.com/pranavmishra90/facsimilab-platform/commit/389494f770a2a8089c41804427a4ccc0b70f2e3d))

* Update python environment ([`4ccac7f`](https://github.com/pranavmishra90/facsimilab-platform/commit/4ccac7f0546a9492fac8136ce435d3cadc6ace5c))

* WIP VSCoder with mamba setup ([`68a0fab`](https://github.com/pranavmishra90/facsimilab-platform/commit/68a0fab53c89bd5b6ee27bf5f49c209325e02225))

* Starting a vscode version ([`d0d284b`](https://github.com/pranavmishra90/facsimilab-platform/commit/d0d284b5a13f109a50163f48052ee3cbddb15626))

* Add: apt cache for builds; Bump: python 3.10; Fix: mamba over conda;

Why: We want to utilize the docker buildx build for caching the apt
install steps.

Python 3.10 is stable on our test bench computer

Mamba is faster than conda

Tags: docker build, mamba, conda, python ([`e9ac76a`](https://github.com/pranavmishra90/facsimilab-platform/commit/e9ac76a1e51942f30fb23fcc9cf6d26147c9c8ca))

* Make: using the newer docker image; Add: Traefik labels

Why: old name is no longer being used / updated. Adding functionality
for Traefik on VPS

Tags: docker, traefik ([`e662b04`](https://github.com/pranavmishra90/facsimilab-platform/commit/e662b045eb366fbc9412b41387b809dc0da1b94e))

* Merge branch 'main' into develop

Signed-off-by: Pranav Kumar Mishra <62562712+pranavmishra90@users.noreply.github.com> ([`b1be74d`](https://github.com/pranavmishra90/facsimilab-platform/commit/b1be74db98bf18da819606beb7abca8f089f3990))

* Upgrade pre-commit-hooks and add code workspace file ([`5b09cbb`](https://github.com/pranavmishra90/facsimilab-platform/commit/5b09cbb3e388ff3d98f6c8305ff6befa314b1f29))

* Merge branch 'develop' of github.com:pranavmishra90/SinguLab into develop ([`ceffeb7`](https://github.com/pranavmishra90/facsimilab-platform/commit/ceffeb7a9db89f2393b50e0f840d69370fb48dcd))

* Add: 'feature/singularity' into develop

Apptainer (Singularity) has a number of advantages over standard docker setups.
Among them is the ability to run rootless containers in HPC
configurations. Adding the ability to create an Apptainer image
from the docker image.

 Changes to be committed:
	new file:   singularity/Singularity ([`7b42785`](https://github.com/pranavmishra90/facsimilab-platform/commit/7b427857e115de78f97e037034b1e4e4adb616e1))

* Creating a Singularity (Apptainer) image ([`4f6de56`](https://github.com/pranavmishra90/facsimilab-platform/commit/4f6de56aa3e0d4369abe2960aee6557395d4dfca))

* Merge pull request #1 from pranavmishra90/feature/docker

Change workdir to ~/work ([`f83fad4`](https://github.com/pranavmishra90/facsimilab-platform/commit/f83fad4b4915da46d3968be85cfd4d7323f63f80))

* Change workdir to ~/work ([`0825d98`](https://github.com/pranavmishra90/facsimilab-platform/commit/0825d98c46bcb347853b0958f06a7b9670b62bb4))

* Merge branch 'main' into develop ([`496c225`](https://github.com/pranavmishra90/facsimilab-platform/commit/496c22518786af6e590988882393df20b719ffbb))

* Merge branch 'develop': Fixing LF endings ([`a68451e`](https://github.com/pranavmishra90/facsimilab-platform/commit/a68451e865b8032c721dcaba7f9f0acc0cfa08bc))

* Using submodules for the coder templates ([`7a2e181`](https://github.com/pranavmishra90/facsimilab-platform/commit/7a2e1815b3c08f82c94425afebf15298c6036266))

* Removed coder directory ([`00a0590`](https://github.com/pranavmishra90/facsimilab-platform/commit/00a0590fe2f2299cc0e8d6eb2afa51b57c48f249))

* VSCode is working! had to remove dotfiles though ([`c036e87`](https://github.com/pranavmishra90/facsimilab-platform/commit/c036e87ed50e131aa9cc383198ba342f258fb7d4))

* Merge branch 'feature/coder' of github.com:pranavmishra90/SinguLab into feature/coder ([`8c2fa72`](https://github.com/pranavmishra90/facsimilab-platform/commit/8c2fa72dba1954a5c26ec6dcdfe83428c4618b65))

* Fix: VSCode, documentation for terraform ([`269488a`](https://github.com/pranavmishra90/facsimilab-platform/commit/269488a068d344f1f580ec3cd832dcd7fbe3f9fe))

* Fixing vscode plugin, but newer change is available on server ([`e04d028`](https://github.com/pranavmishra90/facsimilab-platform/commit/e04d02893a0fe10131633b5656e713157814daf4))

* testing a new terraform file ([`ef6e178`](https://github.com/pranavmishra90/facsimilab-platform/commit/ef6e178a8d76a4fe7f531ff30ea80f64906f6fd2))

* Fix: replaced jovyan/lab with coder/work for username and dir ([`ce4894f`](https://github.com/pranavmishra90/facsimilab-platform/commit/ce4894f225cee3f0d5414f35f525d1a72eac77e9))

* changed ports ([`1febd25`](https://github.com/pranavmishra90/facsimilab-platform/commit/1febd25553bee522726ebb0873f17d5e2fdf47d6))

* removed yadm and .jupyter directory ([`13ae7ed`](https://github.com/pranavmishra90/facsimilab-platform/commit/13ae7ed19abe61d22495440c7d7787027f48f2df))

* added vscode directory ([`0180b4c`](https://github.com/pranavmishra90/facsimilab-platform/commit/0180b4c608133fa86266c5b42fa72ba37f7eba0f))

* changing all files to LF ending ([`25dc1fd`](https://github.com/pranavmishra90/facsimilab-platform/commit/25dc1fd4b75a01a0d2e9417f31a70cabc0770265))

* Fix: basic improvements with docker-compose readme and changelog ([`c066e02`](https://github.com/pranavmishra90/facsimilab-platform/commit/c066e025e31f27ac6657cd2140f09400e20db718))

* Merge branch 'main' into develop ([`5cda0e6`](https://github.com/pranavmishra90/facsimilab-platform/commit/5cda0e63da74e903820bb7b9ef4bf81dfa79f0aa))

* Add: coder .tf file; Fix: user permissions and naming of dockerfile

Why: furthering self-contained environment

How: Using coder/coder

Tags: datascience ([`9447f7c`](https://github.com/pranavmishra90/facsimilab-platform/commit/9447f7ccdfa6c17745122bda6ffd695f675dfc8b))

* pre-v0.0.8 ([`af617b4`](https://github.com/pranavmishra90/facsimilab-platform/commit/af617b44ef7aefc8ba0193a40d00aaf7c0246f53))

* this is not building at the fix-permissions file, so changing branches ([`80481fd`](https://github.com/pranavmishra90/facsimilab-platform/commit/80481fd9a4b31a1398cceea1def316d9ebf74d79))

* added coder/code-server, adjusted image version to 0.0.8 ([`a046d69`](https://github.com/pranavmishra90/facsimilab-platform/commit/a046d6937cc811c840a744c33682ce1fea1a4358))

* added vscode extension for jupyter lab ([`210eb57`](https://github.com/pranavmishra90/facsimilab-platform/commit/210eb571a86ad151dee961fd3a4ef6e9318b44ad))

* Add vscode server from Coder to the image ([`bda6a60`](https://github.com/pranavmishra90/facsimilab-platform/commit/bda6a60b55463fc843a8a6c8d4ec66bf5314eede))

* Fix permissions to 777 so that the permissions work inside the container ([`ad91114`](https://github.com/pranavmishra90/facsimilab-platform/commit/ad91114efe05e638e574aa77877b94a5d4779742))

* moved cachebust ([`452b1d1`](https://github.com/pranavmishra90/facsimilab-platform/commit/452b1d10ad8d4fe941c57a361215533a92007601))

* adding primer3-py via bioconda ([`25bc890`](https://github.com/pranavmishra90/facsimilab-platform/commit/25bc8902f825abb4a4c5bc7540b0e7df1eb54425))

* copying the rclone install file into the container, then running ([`ecedde2`](https://github.com/pranavmishra90/facsimilab-platform/commit/ecedde240945bda3d32885b83b2c75bc0c963a3e))

* copying the rclone install file into the container, then running ([`1a32f2f`](https://github.com/pranavmishra90/facsimilab-platform/commit/1a32f2fc08208e1844157d37ff8db4fab3f6a75f))

* fix minor issues in the README ([`a9f31ce`](https://github.com/pranavmishra90/facsimilab-platform/commit/a9f31ce75d1b1f01e639436213bd2fa0f6bc7355))

* fix python version in README ([`c20bee7`](https://github.com/pranavmishra90/facsimilab-platform/commit/c20bee7fd223a0d9ab4386c10f6cc135ee99892b))

* Merge branch 'main' into develop ([`9442b17`](https://github.com/pranavmishra90/facsimilab-platform/commit/9442b172f8b93d89a98c247c43ae62851688ab51))

* New features: rclone for git-annex, datalad via conda, cachebust

Squashed commit of the following:

commit 96e083fee1e0af75f0d0061468011aa8f2798b7d
Author: Pranav Kumar Mishra <62562712+pranavmishra90@users.noreply.github.com>
Date:   Tue Sep 6 01:12:04 2022 -0500

    Fix: Now using conda for datalad, Add: cachebust

    Why: apt-get datalad was pulling v0.15 vs newest 0.17. Now using conda

    mamba via conda-forge somehow was not pulling the latest either

    How: removed apt datalad, added conda datalad package

    Tags: Datalad, conda, apt, dockerfile

commit b20706463c6df9fcca97ba2876de58554fffc06e
Author: Pranav Kumar Mishra <62562712+pranavmishra90@users.noreply.github.com>
Date:   Mon Sep 5 18:22:56 2022 -0500

    Add: Git-Annex-Remote-rclone
    Why: can use rclone as a datalad sibling
    How: added repo + rclone config ([`a6abb0b`](https://github.com/pranavmishra90/facsimilab-platform/commit/a6abb0bf12c688819b325d5e864b03090612cb16))

* Fix: Now using conda for datalad, Add: cachebust

Why: apt-get datalad was pulling v0.15 vs newest 0.17. Now using conda

mamba via conda-forge somehow was not pulling the latest either

How: removed apt datalad, added conda datalad package

Tags: Datalad, conda, apt, dockerfile ([`96e083f`](https://github.com/pranavmishra90/facsimilab-platform/commit/96e083fee1e0af75f0d0061468011aa8f2798b7d))

* Add: Git-Annex-Remote-rclone
Why: can use rclone as a datalad sibling
How: added repo + rclone config ([`b207064`](https://github.com/pranavmishra90/facsimilab-platform/commit/b20706463c6df9fcca97ba2876de58554fffc06e))

* fixing errors from merge ([`3488d09`](https://github.com/pranavmishra90/facsimilab-platform/commit/3488d09b8bd4559bdf4c224cdfa2e47184b3a0d3))

* Merge branch 'develop' ([`7042b6a`](https://github.com/pranavmishra90/facsimilab-platform/commit/7042b6aee4459be9219a223400d475660f0d3e40))

* change gnupg2 to gnupg, fix permissions ([`a2f4b96`](https://github.com/pranavmishra90/facsimilab-platform/commit/a2f4b96d7389737fd664d6418b4284202abac35b))

* Fix: Dockerfile, docker-compose to follow nightly builds if wanted

Why: Using vscode to build containers was not picking up all changes

How: created new tag :nightly, which will be pushed to gitea and github

Tags: Docker ([`f1fa0a8`](https://github.com/pranavmishra90/facsimilab-platform/commit/f1fa0a8de8dffd7fac8bc2e16765c8405ff99400))

* Created nightly tag and streamlined process for vscode containers

commit f1fa0a8de8dffd7fac8bc2e16765c8405ff99400
Author: Pranav Kumar Mishra <62562712+pranavmishra90@users.noreply.github.com>
Date:   Wed Aug 24 21:35:02 2022 -0500

    Fix: Dockerfile, docker-compose to follow nightly builds if wanted

    Why: Using vscode to build containers was not picking up all changes

    How: created new tag :nightly, which will be pushed to gitea and github

    Tags: Docker ([`64d8d98`](https://github.com/pranavmishra90/facsimilab-platform/commit/64d8d986e5b600f48426b2c56ca15cb1982cccc5))

* Optimize: Moved custom apt-packages to the bottom || Add: exa (for ls)

Why: Docker image taking a long time to rebuild because the
additional packages which are being added modify the earlier layers

Now building a 'fixed' base with my changes at the end
Note a proximal change is fixing the python version to 3.9

How: Move RUN command for my addons to the end
Add 'exa' to this run command

Tags: Dockerfile ([`1873813`](https://github.com/pranavmishra90/facsimilab-platform/commit/1873813955056bb1a5e29ab2a282c2b487fe2922))

* Add: Missing files from jupyter/base-notebook for image creation

Why: required to create the image

How: taken from jupyter/base-notebook

Tags: ([`a59d639`](https://github.com/pranavmishra90/facsimilab-platform/commit/a59d6399e81ffad8fb1b4dc98973bb79ed25cb87))

* (Created seperate git repository specifically for this container)
.
Why: Difficult to maintain image creation inside a specific branch
of the first experiment's git repository

This is following the YODA principles outlined in the README

How: Created seperate git repo, pushed

Tags: Docker, Dockerfile, docker-compose ([`475aba2`](https://github.com/pranavmishra90/facsimilab-platform/commit/475aba292f376ac91b1fbe90f69199bab3dde4cb))

* Initial commit ([`e888b16`](https://github.com/pranavmishra90/facsimilab-platform/commit/e888b165063facb75a82538470d93f582b870341))
