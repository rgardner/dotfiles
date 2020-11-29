# Ansible Provisioning

This directory contains experimental [Ansible][ansible] provisioning of
machines for development. macOS and Linux (Debian and Ubuntu) are currently
supported.

## Usage

### macOS Prerequisites

Set the `ANSIBLE_BECOME_PASS` environment variable to your account password.
This is needed to configure your Mac in developer mode.

If the incorrect version of Xcode is installed, you will also need to
download the correct Xcode version first. To check the expected Xcode
version, see `xcode_major_version` in `playbook.yml`. To check the currently
installed Xcode version, run `xcodebuild -version`. To download Xcode, you
need an Apple Developer account, then visit
<https://developer.apple.com/download/more/>.

### Main

Run `bootstrap.sh` in the parent directory to install Ansible and dependencies
on the host machine, then invoke Ansible with `playbook.yml`.

## Testing

To test in the default [GitHub Codespace][github-codespace] container, run:

```sh
docker run --volume=$(pwd):/usr/local/src/dotfiles -it --rm mcr.microsoft.com/vscode/devcontainers/universal:linux /bin/bash
cd /usr/local/src/dotfiles
./bootstrap.sh
```

[ansible]: https://www.ansible.com/
