# Git Hooks
Symlink hooks in this directory to the `.git/hooks` directory. To symlink
them, run `./install-hooks.sh`.

Add new hooks by adding a new hook script in this directory, appending:

```sh
ln -sf "${FROM}"/name "${TO}"/name
```

to `install-hooks.sh`, then running `./install-hooks.sh`.

## Credit
Original design from the [iPython project.](https://github.com/ipython/ipython)
