include /usr/share/rive/make/env.make

DESTDIR ?= /usr/share/lightdm-webkit/themes/rive

WEBPACK = ./node_modules/.bin/webpack

include /usr/share/rive/make/build.make
include /usr/share/rive/make/pkg.make
include /usr/share/rive/make/install.make
include /usr/share/rive/make/clean.make
include /usr/share/rive/make/list.make

build::
	$(WEBPACK) --progress -p

watch::
	$(WEBPACK) --watch -p

deps::
	yarn

install::
	$(call install_subtree,$(BUILDS),$(BUILDDIR),$(DESTDIR))

uninstall::
	$(call uninstall_subtree,$(BUILDS),$(BUILDDIR),$(DESTDIR))

