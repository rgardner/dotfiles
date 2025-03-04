#!/usr/bin/env python
# PYTHON_ARGCOMPLETE_OK

"""Manage configuration files."""

import argparse
import contextlib
import os
import pathlib
import subprocess
import sys


class Error(Exception):
    def __init__(self, msg: str, *, code: int) -> None:
        self.message = msg
        self.returncode = code


def dotfiles_dir() -> pathlib.Path:
    try:
        root = os.environ["DOTFILES"]
    except KeyError as exc:
        raise Error(f"{str(exc)} environment variable not set", code=1) from exc
    return pathlib.Path(root)


def run_sync_command(args: argparse.Namespace) -> None:
    root = dotfiles_dir()
    subprocess.run(
        [
            "python",
            "-m",
            "ansible",
            "playbook",
            root / "ansible" / "playbook.yml",
            "--inventory",
            root / "ansible" / "hosts",
        ],
        check=True,
    )
    subprocess.run(
        [pathlib.Path("git-hooks", "install-hooks.sh")], check=True, cwd=root
    )


def run_stow_command(args: argparse.Namespace) -> None:
    stow_dir = str(dotfiles_dir().joinpath("stow").absolute())
    target = str(pathlib.Path.home())
    subprocess.run(
        ["stow", *args.package, "--dir", stow_dir, "--target", target], check=True
    )


def run_unstow_command(args: argparse.Namespace) -> None:
    stow_dir = str(dotfiles_dir() / "stow")
    target = str(pathlib.Path.home())
    subprocess.run(
        ["stow", "--delete", *args.package, "--dir", stow_dir, "--target", target],
        check=True,
    )


def parse_args(args: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Manages config files. Provisions machine via Ansible by default.",
    )
    parser.set_defaults(func=run_sync_command)
    subparsers = parser.add_subparsers()

    stow_subparser = subparsers.add_parser(
        "stow", help="links package config files to home dir"
    )
    stow_subparser.add_argument("package", nargs="+")
    stow_subparser.set_defaults(func=run_stow_command)

    unstow_subparser = subparsers.add_parser(
        "unstow", help="removes package config file links in home dir"
    )
    unstow_subparser.add_argument("package", nargs="+")
    unstow_subparser.set_defaults(func=run_unstow_command)

    with contextlib.suppress(ImportError):
        import argcomplete

        argcomplete.autocomplete(parser)

    return parser.parse_args(args)


def main() -> None:
    args = parse_args(sys.argv[1:])
    try:
        args.func(args)
    except Error as exc:
        print(f"error: {exc.message}", file=sys.stderr)
        sys.exit(exc.returncode)
