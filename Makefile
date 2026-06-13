PREFIX  ?= /usr/local
DESTDIR ?=

BINDIR     := $(PREFIX)/bin
DATADIR    := $(PREFIX)/share/fzfx
DOCDIR     := $(PREFIX)/share/doc/fzfx
LICENSEDIR := $(PREFIX)/share/licenses/fzfx

# Resolve the version from git when available; baked into the script on install.
VERSION := $(shell git describe --tags 2>/dev/null | sed 's/^v//' || echo unknown)

.PHONY: install uninstall install-hooks lint

install:
	install -Dm755 fzfx "$(DESTDIR)$(BINDIR)/fzfx"
	sed -i 's|@VERSION@|$(VERSION)|; s|@DATADIR@|$(DATADIR)|' "$(DESTDIR)$(BINDIR)/fzfx"
	install -Dm644 ignore "$(DESTDIR)$(DATADIR)/ignore"
	install -Dm644 config.example "$(DESTDIR)$(DATADIR)/config.example"
	install -Dm644 LICENSE "$(DESTDIR)$(LICENSEDIR)/LICENSE"
	install -Dm644 README.md -t "$(DESTDIR)$(DOCDIR)"

uninstall:
	rm -f "$(DESTDIR)$(BINDIR)/fzfx"
	rm -f "$(DESTDIR)$(LICENSEDIR)/LICENSE"
	rm -rf "$(DESTDIR)$(DATADIR)"
	rm -rf "$(DESTDIR)$(DOCDIR)"

# Enable the bundled git hooks (shellcheck on commit) for this clone.
install-hooks:
	git config core.hooksPath .githooks
	@echo "fzfx: git hooks enabled (core.hooksPath -> .githooks)"

lint:
	shellcheck fzfx .githooks/pre-commit
