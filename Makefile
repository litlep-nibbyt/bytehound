.PHONY: build build-preload build-cli \
	zigbuild zigbuild-preload zigbuild-cli

ZIG_TARGET ?= x86_64-unknown-linux-gnu
ZIG_PRELOAD_FEATURES ?= disable-register-frame-hooks

build: build-preload build-cli

build-preload:
	cargo build --release -p bytehound-preload

build-cli:
	cargo build --release -p bytehound-cli

zigbuild: zigbuild-preload zigbuild-cli

zigbuild-preload:
	cargo zigbuild --release -p bytehound-preload --target $(ZIG_TARGET) --features $(ZIG_PRELOAD_FEATURES)

zigbuild-cli:
	cargo zigbuild --release -p bytehound-cli --target $(ZIG_TARGET)
