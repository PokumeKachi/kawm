_default:
    @just --choose

compile:
	cargo build

run:
	RUSTFLAGS="-Awarnings" cargo run -- --winit

run-udev:
	RUSTFLAGS="-Awarnings" cargo run -- --tty-udev

release:
    cargo run --release -- --winit

todo:
    taskwarrior-tui --taskdata .task

git:
    gitui

develop:
    @sh -c ' \
        h=$(nix hash path ./flake.nix); \
        old="$FLAKE_HASH"; \
        if [ "$old" != "$h" ]; then \
            echo "Entering flake shell..."; \
            FLAKE_HASH="$h" exec nix develop; \
        else \
            echo "Inside flake shell, skipping nix develop..."; \
        fi \
    '
