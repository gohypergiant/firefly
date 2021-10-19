# flux2

This directory contains [flux2](https://fluxcd.io/) GitOps manifests to deploy firefly to kubernetes

## Getting Started

1.  [Install the flux CLI tool](https://fluxcd.io/docs/get-started/#install-the-flux-cli)

2.  Bootstrap
    ```
    flux bootstrap git \
    --url=https://github.com/gohypergiant/firefly \
    --branch=stable \
    --path=contrib/flux/base
    ```