SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

jar:
> clojure -Spom
> clojure -A:jar

dev:
> yarn
> yarn shadow-cljs watch devcards

# To deploy to gh-pages:

# gco gh-pages
# make gh-pages
# gdc
gh-pages:
> yarn shadow-cljs release devcards
