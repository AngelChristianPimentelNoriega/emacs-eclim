# makefie for emacs-eclim

EL_FILES := $(sort $(wildcard *.el))
ELC_FILES := $(EL_FILES:.el=.elc)

EMACS := emacs
CASK := cask
LOAD_PATH := -L .
EMACS_OPTS :=
EMACS_BATCH := $(EMACS) -Q -batch -L . $(EMACS_OPTS)
TEST_LOAD_FILES = -l test/test-helper.el
RUN_EMACS :=

# Program availability
ifdef CASK
RUN_EMACS = $(CASK) exec $(EMACS_BATCH)
HAVE_CASK := $(shell sh -c "command -v $(CASK)")
ifndef HAVE_CASK
$(warning "$(CASK) is not available.  Please run make help")
endif
else
RUN_EMACS = $(EMACS_BATCH)
endif

VPATH := .

all: test

init:
	$(CASK) install
	$(CASK) update

test:
	$(RUN_EMACS) $(TEST_LOAD_FILES) -f eclim-run-tests

lint: $(EL_FILES)
	$(RUN_EMACS) $(TEST_LOAD_FILES) -f eclim-lint-files $(EL_FILES)

compile: $(EL_FILES)
	$(RUN_EMACS) -l maint/eclim-compile.el -f eclim/batch-byte-compile $(EL_FILES)

clean:
	rm -f *.elc test/*.elc

.PHONY: all init test link compile clean
