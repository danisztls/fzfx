# fzfX

**fzfX** multiplies the power of [fzf](https://github.com/junegunn/fzf) by providing zero-configuration battle-tested applications to common use cases of fzf. It delivers the power of finding, previewing, editing and managing any file in few key strokes. 

## Features
- **default**: find any file
- **hidden**: include hidden files
- **full**: fulltext, files containing string
- **md**: markdown notes
- **pdf**: pdf, ps and eps files
- **pic**: pictures
- **av**: audio and video
- **cd**: change directory
- **ps**: manage processes

It is agnostic and does not require a specific terminal emulator, desktop environment or text editor. It will make use of improved utils that are becoming standard at Linux desktop environments, like **rg**, **fd**, **bat**, **rga**, **grc** and many others. But it will sensibly fallback to their classic UNIX counterparts like **grep**, **cat** and **ls** when they are not available.

### Find any file anywhere in your HOME
[![asciicast](https://asciinema.org/a/405579.svg)](https://asciinema.org/a/405579)

```sh
$ fzfx
```

### Override the defaults to display everything
[![asciicast](https://asciinema.org/a/405581.svg)](https://asciinema.org/a/405581)

```sh
fzfx hidden
```

By default hidden files, cache/vendor directories like `node_modules` *(see /usr/share/fzfx/ignore)* are ignored and `.gitignore` files inside directories are followed.

### Dynamically find files containing a string and preview context
[![asciicast](https://asciinema.org/a/405583.svg)](https://asciinema.org/a/405583)

```sh
$ fzfx full
```

*Note: Supports regular expressions.*

### Change directory
[![asciicast](https://asciinema.org/a/405594.svg)](https://asciinema.org/a/405594)
```sh
$ fzfx cd
```

To change dir with ENTER create an alias:
```sh
alias fcd='cd $(fzfx cd)'
```
*Note: Needed because a child shell can't act on its parent.*

### Manage processes 
[![asciicast](https://asciinema.org/a/405584.svg)](https://asciinema.org/a/405584)

```sh
$ fzfx ps
```

### Find files in a niche
```sh
# markdown notes
$ fzfx md

# pdf, ps and eps
fzfx pdf

# pictures
fzfx pic

# audio and videos
fzfx av
```

## Setup
Install through the [AUR](https://aur.archlinux.org/packages/fzfx-git)

Or install as user
```sh
$ ./setup install
```
## Configure
Edit `$XDG_CONFIG_HOME/fzfx/config`

- Set `root="$HOME"` to search all your files from anywhere.
- Set `editor` to override the editor used by fzfx.
- Set `ignoreFile` to override the default ignore file *(.gitignore style)*.
- Set `defaultPreview`, `pdfView`, `avView`, `picView` to whatever you prefer. 
