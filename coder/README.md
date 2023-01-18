---
name: SinguLab for data analysis and archival
description: Using the container pranavmishra90/datascience for research data analysis and archival
tags: [local, docker]
icon: /icon/docker.png
---

## Usage
### Login to coder

```
coder login http://localhost:3000
```

1. Get the API token from: http://localhost:3000/cli-auth

2. Paste the token into the terminal window

### Edit the template, as needed

The terraform template is located in the `/coder` directory. Changes can be made to suit your needs.

### Push the template to coder

1. Make sure that you are in the template directory by `cd coder`
2. Create a template with `coder templates create <template name> --ttl 4h`
3. Push the changes to the server with `coder templates push`
