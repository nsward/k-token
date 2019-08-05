export DAPP_SOLC_VERSION=0.5.10
export SOLC_FLAGS=--optimize
DAPP_DIR = $(CURDIR)/token

all: dapp spec

dapp:
	dapp --version
	git submodule update --init --recursive
	cd $(DAPP_DIR) && dapp build && cd ../

spec:
	klab build

