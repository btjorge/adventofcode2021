# --------------------------------------------------------------------------
# ---  WHY3 Makefile
# --------------------------------------------------------------------------

WHY3_TITLE="Advent of Code 2021: Day 1"
WHY3_MODULES= logic

# --------------------------------------------------------------------------

.PHONY: build run clean all doc compile replay fix

build:
	@dune build .

run:
	@dune exec day1

clean::
	rm -fr *~ *.bak */*.bak html */*.gz


# --------------------------------------------------------------------------
# ---  Targets
# --------------------------------------------------------------------------

fix: $(addsuffix .fix, $(WHY3_MODULES))
	@echo "-----------------------------"

replay: $(addsuffix .replay, $(WHY3_MODULES))
	@echo "-----------------------------"

compile: $(addsuffix .cc, $(WHY3_MODULES))

# --------------------------------------------------------------------------
# ---  Documentation
# --------------------------------------------------------------------------

.PHONY: coredoc

doc:: coredoc $(addsuffix .html, $(WHY3_MODULES))
	@echo "--- file://$(PWD)/html/index.html"
	@echo "-----------------------------"

coredoc:
	@echo "-----------------------------"
	@echo "--- Documentation"
	@echo "-----------------------------"
	@rm -fr html
	@mkdir html
	@why3 doc -o html \
	     --index \
	     --title $(WHY3_TITLE) \
	     --stdlib-url "http://why3.lri.fr/stdlib" \
	     -L . $(addsuffix .mlw, $(WHY3_MODULES))
	@cp -f ./style.css html/

# --------------------------------------------------------------------------
# ---  Patterns
# --------------------------------------------------------------------------

%.cc: %.mlw
	why3 prove --type-only -L . $<

%.ide: %.mlw
	why3 prove --type-only -L . $<
	why3 ide -L . $*

%.fix: %.mlw
	@echo "-----------------------------"
	@echo "--- replay $*"
	@echo "-----------------------------"
	@why3 replay -f -L . $* | tee .log
	@if grep -q "\(failed\|not proved\)" .log ;\
	 then echo "> why3 ide $< ..."; why3 ide -L . $<; fi

%.replay: %.mlw
	@echo "-----------------------------"
	@echo "--- replay $*"
	@echo "-----------------------------"
	@why3 replay -f -L . $* | tee .log
	@if grep -q "\(failed\|not proved\)" .log ; then exit 1; fi

%.html: %.mlw
	@echo "--- session results $*"
	@why3 session html $*
	@mv -f $*/why3session.html html/session.$*.html

# --------------------------------------------------------------------------
