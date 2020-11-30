# Ansible Provisioning

This directory contains experimental [Ansible][ansible] provisioning of
machines for development. macOS and Linux (Debian and Ubuntu) are currently
supported.

## Usage

### macOS Prerequisites

If the incorrect version of Xcode is installed, you will also need to
download the correct Xcode version first. To check the expected Xcode
version, see `xcode_major_version` in `playbook.yml`. To check the currently
installed Xcode version, run `xcodebuild -version`. To download Xcode, you
need an Apple Developer account, then visit
<https://developer.apple.com/download/more/>.

### Main

Run `bootstrap.sh` in the parent directory to install Ansible and invoke
Ansible with `playbook.yml` on the host machine.

## Testing

To test in the default [GitHub Codespace][github-codespace] container, run:

```sh
docker run -v=$(pwd):/usr/local/src/dotfiles -it --rm mcr.microsoft.com/vscode/devcontainers/universal:linux /bin/bash
cd /usr/local/src/dotfiles
./bootstrap.sh
```

[ansible]: https://www.ansible.com/
[github-codespace]: https://github.com/features/codespaces
