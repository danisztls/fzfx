# fzfX

**fzfX** multiplies the power of [fzf](https://github.com/junegunn/fzf) by wrapping it into zero-configuration, battle-tested answers to its most common use cases. Finding, previewing, editing and managing any file, in a few keystrokes.

It is agnostic: no specific terminal emulator, desktop environment or text editor required. It builds on modern CLI tools — **fzf**, **fd** and **ripgrep** are required, while **bat**, **rga**, **grc**, **tree** and others are optional and fall back gracefully to classic counterparts like **cat** and **ls** when absent.

```sh
fzfx [MODE] [PATH]
```

`PATH` defaults to `$HOME` and can be overridden or disabled entirely (see [Configure](#configure)). Any mode also accepts an explicit path:

```sh
fzfx md ~/Docs
```

## Keybindings

The same bindings work across every file mode:

| Key           | Action                              |
| ------------- | ----------------------------------- |
| `enter`       | default action (mode-specific)      |
| `f1`          | open with `xdg-open`                |
| `f2`          | open in `$EDITOR`                   |
| `f3`          | copy path to the clipboard          |
| `f4`          | print path to stdout                |
| `alt+shift+d` | move to trash (needs **trash-cli**) |
| `esc`         | exit                                |

## Modes

### Find files anywhere

```sh
fzfx
```

Hidden files and cache/vendor directories like `node_modules` are filtered out by a bundled ignore list, in `.gitignore` syntax, at `$PREFIX/share/fzfx/ignore`. Repository `.gitignore` files are deliberately _not_ honored, so files your VCS ignores are still findable.

### Find anything

```sh
fzfx hidden
```

Same as above but nothing is filtered out, hidden files included.

### Dynamically find a string inside files

```sh
fzfx full
```

Full-text search that re-runs as you type, with matches highlighted in the preview. Supports regular expressions. Uses [ripgrep-all](https://github.com/phiresky/ripgrep-all) when available to reach inside archives, PDFs, SQLite databases and media metadata; plain ripgrep otherwise.

### Change directory

```sh
fzfx cd
```

Prints the selected directory. A child shell can't act on its parent, so changing directory with `enter` needs an alias:

```sh
alias fcd='cd "$(fzfx cd)"'
```

_Note: aliases must live in — or be sourced from — `.profile` or an RC file like `.bashrc` to persist. See [these dotfiles](https://github.com/danisztls/dotfiles/blob/main/shell/aliases) for an example._

### Copy any file to the current dir

```sh
fzfx cp
```

### Move any file to any dir

```sh
fzfx mv
```

Pick the file, then pick the destination directory.

### Manage processes

```sh
fzfx ps
```

A live process list, refreshed on every keystroke and colorized with **grc** when available:

| Key  | Signal    |
| ---- | --------- |
| `f1` | `SIGTERM` |
| `f2` | `SIGKILL` |
| `f3` | `SIGSTOP` |
| `f4` | `SIGCONT` |

### Find files with special cases

```sh
fzfx md   # markdown notes
fzfx pdf  # pdf, ps and eps
fzfx pic  # pictures
fzfx av   # audio and video
```

The media modes open the selection in a dedicated viewer instead of the default action — **evince**, **feh** and **mpv** when installed, `xdg-open` otherwise. All of them are configurable.

### Meta

```sh
fzfx version  # also -V, --version
fzfx help     # also -h, --help
```

## Dependencies

**Required:** [fzf](https://github.com/junegunn/fzf), [fd](https://github.com/sharkdp/fd), [ripgrep](https://github.com/BurntSushi/ripgrep).

**Optional:** [bat](https://github.com/sharkdp/bat) _(better text preview)_, [ripgrep-all](https://github.com/phiresky/ripgrep-all) _(full-text search inside blobs)_, [grc](https://github.com/garabik/grc) _(colorized process list)_, `tree` _(better directory preview)_, `trash-cli` _(the delete binding)_, `evince`/`mpv`/`feh` _(media viewers)_, `wl-copy`/`xclip`/`pbcopy` _(clipboard)_.

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

All configuration is optional. Copy the bundled example and edit it:

```sh
cp "$PREFIX/share/fzfx/config.example" "${XDG_CONFIG_HOME:-$HOME/.config}/fzfx/config"
```

| Setting                                          | Purpose                                                            |
| ------------------------------------------------ | ------------------------------------------------------------------ |
| `searchPath`                                     | override the global search path _(defaults to `$HOME`)_            |
| `searchLocal`                                    | set to `true` to always search the current directory               |
| `editor`                                         | override the editor _(defaults to `$EDITOR`, else a detected one)_ |
| `clipboard`                                      | override the clipboard command _(auto-detected)_                   |
| `ignoreFile`                                     | override the ignore list, `.gitignore` syntax                      |
| `defaultPreview`, `pdfView`, `avView`, `picView` | override the preview and viewer commands                           |

Your own `FZF_DEFAULT_OPTS` — colors, layout — is honored on top of fzfX's own settings.

## Contributing

Enable the bundled git hooks, which run [shellcheck](https://www.shellcheck.net/) on commit:

```sh
make install-hooks
```

Lint manually with `make lint`.

## License

[GPL-3.0-or-later](LICENSE) © Daniel Souza
