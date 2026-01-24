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
