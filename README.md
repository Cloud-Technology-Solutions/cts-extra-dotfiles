# `mega-dotfiles` README

This example repo shows how to add lots and lots of customisation to your
devcontainers without having to adjust the central code.

## Devcontainer usage

To use dotfiles with a [devcontainer](https://containers.dev) setup, first
create a dotfiles repository, then add the following lines to your VSCode
config:

```json
    "dotfiles.repository": "example/dotfiles",
    "dotfiles.targetPath": "$HOME/dotfiles",
    "dotfiles.installCommand": "$HOME/dotfiles/install.sh",
```

Whenever you open a repository in a devcontainer from now on, the dotfiles repo
will automatically be cloned and the installation script run while the
container is created.

## Contents

-   A devcontainer for this repo. Also includes sample `postAttachCommand`
    directives which will pull in any Git hooks configured with the
    `init.templateDir` option.
-   An installation script which creates a local `bin` directory, copies local
    config files across, and installs some useful utilities.
-   Sample Git config, including a hook that can be used to lint commit
    messages - this is not full-featured but avoids the need to install Node to
    run `commitlint`.
