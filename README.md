# fzfX

**fzfX** multiplies the power of [fzf](https://github.com/junegunn/fzf) by providing zero-configuration battle-tested applications to common use cases of fzf. It delivers the power of finding, previewing, editing and managing any file in few key strokes. 

## Features
- **default**: find any file
- **hidden**: include hidden files
- **full**: fulltext, files containing string
- **md**: markdown notes
- **pdf**: pdf, ps and eps files
- **media**: pictures, video and audio
- **cd**: change directory
- **ps**: manage processes

It is agnostic and does not require a specific terminal emulator, desktop environment or text editor. It will make use of improved utils that are becoming standard at Linux desktop environments, like **rg**, **fd**, **bat**, **rga**, **grc** and many others. But it will sensibly fallback to their classic UNIX counterparts like **grep**, **less** and **ls** when them are not available.

### Find any file anywhere in your HOME
```sh
$ fzfx
```

### Override the defaults to display everything
```sh
fzfx hidden
```

By default hidden files, cache/vendor directories like `node_modules` *(see /usr/share/fzfx/ignore)* are ignored and `.gitignore` files inside directories are followed.

### Dynamically find files containing a string and preview context
```sh
$ fzfx full
```

*Note: Supports regular expressions.*

### change directory

[![cd-asciicast](https://asciinema.org/a/349907.svg)](https://asciinema.org/a/349907)

To change dir with ENTER create an alias:
```sh
alias fcd='cd $(fzfx cd)'
```
*Note: Needed because a child shell can't act on its parent.*

### Manage processes 
[![ps-asciicast](https://asciinema.org/a/349904.svg)](https://asciinema.org/a/349904)

## Setup
Install through the [AUR](https://aur.archlinux.org/packages/fzfx-git)

Or install as user
```sh
$ ./setup install
```

### Find files in a niche
```sh
# markdown notes
$ fzfx md

# pdf, ps and eps
fzfx pdf

# pics, videos and audio
fzfx media
```

## Configure
Edit `$XDG_CONFIG_HOME/fzfx/config`

- Set `root="$HOME"` to search all your files from anywhere.
- Set `editor=` to override the editor used by fzfx.
- Set `ignoreFile=` to override the default ignore file *(.gitignore style)*.
