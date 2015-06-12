PACKAGE= \
  copilot-core \
  copilot-language \
  copilot-libraries \
  copilot-sbv \
  copilot-c99 \
  copilot-cbmc

PACKAGEDIR=$(foreach p, $(PACKAGE), lib/$(p)/)

default:
	build

cabal.sandbox.config:
	cabal sandbox init

.PHONY: build
build: cabal.sandbox.config
	cabal sandbox add-source $(PACKAGEDIR)
	cabal install $(PACKAGEDIR)

# Note: can't do a `cabal run` since there's no cabal file at the top level.

.PHONY: test
test: build
	cabal run copilot-regression
	cabal run copilot-c99-qc
	copilot_unit_tests/struct_test1/run_test.sh

.PHONY: veryclean
veryclean:
	-rm -rf cabal.sandbox.config
	-rm -rf .cabal-sandbox
	-rm -rf dist

