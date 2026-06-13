# fzfX

**fzfX** multiplies the power of [fzf](https://github.com/junegunn/fzf) by providing zero-configuration battle-tested applications to common use cases of fzf. It delivers the power of finding, previewing, editing and managing any file in few key strokes.

It is agnostic and does not require a specific terminal emulator, desktop environment or text editor. It builds on modern CLI tools: **fzf**, **fd** and **ripgrep** are required, while **bat**, **rga**, **grc**, **tree** and others are optional and gracefully fall back to classic counterparts like **cat** and **ls** when absent.

### Find files anywhere

```sh
fzfx
```

By default it will use `$HOME` as the search path but that can be overrided or disabled entirely.

Optionally the search path can be inputted in the command. Which will also work for other modes.

```sh
fzfx <searchPath>
```

### Find anything

```sh
fzfx hidden
```

By default hidden files, cache/vendor directories like `node_modules` _(see /usr/share/fzfx/ignore)_ are ignored and `.gitignore` files inside directories are followed.

### Dynamically find a string inside files

```sh
fzfx full
```

_Note: Supports regular expressions._

### Change directory

```sh
fzfx cd
```

To change dir with ENTER create an alias:

```sh
alias fcd='cd "$(fzfx cd)"'
```

_Note: Needed because a child shell can't act on its parent._

If you don't know how aliases work, try using [this](https://github.com/danisztls/dotfiles/blob/main/shell/aliases) configuration as an example.

_Note: Aliases must be put or be sourced in `.profile` or RC files like `.bashrc` so to work persistently._

### Copy any file to current dir

```sh
fzfx cp
```

### Move any file to any dir

```sh
fzfx mv
```

### Manage processes

```sh
fzfx ps
```

### Find files with special cases

```sh
# markdown notes
fzfx md

# pdf, ps and eps
fzfx pdf

# pictures
fzfx pic

# audio and videos
fzfx av
```

## Setup

### Arch Linux

Install through the [AUR](https://aur.archlinux.org/packages/fzfx-git).

### From source

```sh
sudo make install             # installs under /usr/local
sudo make PREFIX=/usr install # mirror the system package layout
```

Remove it with `sudo make uninstall` (pass the same `PREFIX`).

## Configure

Copy the bundled example and edit it:

```sh
cp /usr/share/fzfx/config.example "${XDG_CONFIG_HOME:-$HOME/.config}/fzfx/config"
```

- Set `searchPath` to override the global search path.
- Set `searchLocal=true` to always search locally.
- Set `editor` to override the editor used by fzfx.
- Set `clipboard` to override the clipboard command _(auto-detected: `wl-copy`, `xclip` or `pbcopy`)_.
- Set `ignoreFile` to override the default ignore file _(.gitignore style)_.
- Set `defaultPreview`, `pdfView`, `avView`, `picView` to whatever you prefer.

_Note: All configurations are optional._

## Contributing

Enable the bundled git hooks (runs [shellcheck](https://www.shellcheck.net/) on commit):

```sh
make install-hooks
```
