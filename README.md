# fzfX

**fzfX** multiplies the power of [fzf](https://github.com/junegunn/fzf) by providing zero-configuration battle-tested applications to common use cases of fzf. It delivers the power of finding, previewing, editing and managing any file in few key strokes.

It is agnostic and does not require a specific terminal emulator, desktop environment or text editor. It will make use of improved utils that are becoming standard at Linux desktop environments, like **rg**, **fd**, **bat**, **rga**, **grc** and many others. But it will sensibly fallback to their classic UNIX counterparts like **grep**, **cat** and **ls** when they are not available.

### Find files anywhere

[![asciicast](https://asciinema.org/a/405579.svg)](https://asciinema.org/a/405579)

```sh
fzfx
```

By default it will use `$HOME` as the search path but that can be overrided or disabled entirely.

Optionally the search path can be inputted in the command. Which will also work for other modes.

```sh
fzfx <searchPath>
```

### Find anything

[![asciicast](https://asciinema.org/a/405581.svg)](https://asciinema.org/a/405581)

```sh
fzfx hidden
```

By default hidden files, cache/vendor directories like `node_modules` _(see /usr/share/fzfx/ignore)_ are ignored and `.gitignore` files inside directories are followed.

### Dynamically find a string inside files

[![asciicast](https://asciinema.org/a/405583.svg)](https://asciinema.org/a/405583)

```sh
fzfx full
```

_Note: Supports regular expressions._

### Change directory

[![asciicast](https://asciinema.org/a/405594.svg)](https://asciinema.org/a/405594)

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

[![asciicast](https://asciinema.org/a/406774.svg)](https://asciinema.org/a/406774)

```sh
fzfx cp
```

### Move any file to any dir

[![asciicast](https://asciinema.org/a/406775.svg)](https://asciinema.org/a/406775)

```sh
fzfx mv
```

### Manage processes

[![asciicast](https://asciinema.org/a/405584.svg)](https://asciinema.org/a/405584)

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

Install through the [AUR](https://aur.archlinux.org/packages/fzfx-git).

## Configure

Edit `$XDG_CONFIG_HOME/fzfx/config`

- Set `searchPath` to override the global search path.
- Set `searchLocal=true` to always search locally.
- Set `editor` to override the editor used by fzfx.
- Set `ignoreFile` to override the default ignore file _(.gitignore style)_.
- Set `defaultPreview`, `pdfView`, `avView`, `picView` to whatever you prefer.

_Note: All configurations are optional._

_Note: $root is still supported but support will be dropped in next release. So update your config file._
