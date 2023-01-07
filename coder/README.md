---
name: Develop in Docker with a dotfiles URL
description: Run workspaces on a Docker host using registry images
tags: [local, docker]
icon: /icon/docker.png
---

```sh
export CODER_DATA=$HOME/.config/coderv2 && \
export DOCKER_GROUP=$(grep /etc/group -e "docker" | cut -d: -f3) && \
docker run --rm -it \
    -v $CODER_DATA:/home/coder/.config \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --group-add $DOCKER_GROUP \
    ghcr.io/coder/coder:latest

```

docker run --rm -it -v $CODER_DATA:/home/coder/.config -v /var/run/docker.sock:/var/run/docker.sock --group-add $DOCKER_GROUP ghcr.io/coder/coder:latest


## Getting started

Run `coder templates init` and select this template. Follow the instructions that appear.

## How it works

During workspace creation, Coder prompts you to specify a dotfiles URL via a Terraform variable. Once the workspace starts, the Coder agent runs `coder dotfiles` via the startup script:

```hcl
variable "dotfiles_uri" {
  description = <<-EOF
  Dotfiles repo URI (optional)

  see https://dotfiles.github.io
  EOF
    # The codercom/enterprise-* images are only built for amd64
  default = ""
}

resource "coder_agent" "main" {
  ...
  startup_script = var.dotfiles_uri != "" ? "/tmp/tmp.coder*/coder dotfiles -y ${var.dotfiles_uri}" : null
}
```

# Managing images and workspaces

Refer to the documentation in the [Docker template](../README.md).
