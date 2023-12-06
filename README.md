# `mega-dotfiles` README

This example repo shows how to add lots and lots of customisation to your
devcontainers without having to adjust the central code.

## Devcontainer usage

To use dotfiles with a [devcontainer](https://containers.dev) setup, first
create a dotfiles repository, then add the following lines to your VSCode
config:

```json
    "dotfiles.repository": "Cloud-Technology-Solutions/cts-extra-dotfiles",
    "dotfiles.targetPath": "$HOME/dotfiles",
    "dotfiles.installCommand": "$HOME/dotfiles/install.sh",
```

Whenever you open a repository in a devcontainer from now on, the dotfiles repo
will automatically be cloned and the installation script run while the
container is created.

Remember to set your default shell profile in VSCode to zsh so that this will
apply for all terminals opened.

## Contents

-   A devcontainer for this repo. Also includes sample `postAttachCommand`
    directives which will pull in any Git hooks configured with the
    `init.templateDir` option.
-   Sample Git config.
-   An installation script which creates a local `bin` directory, copies local
    config files across, and installs some useful utilities.
-   Lots of nice zsh configuration.
