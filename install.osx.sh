#!/bin/sh

git clone https://github.com/ritiek/auto-image-cropper

# skip these steps if rust already installed
brew reinstall rustup-init
# install rustup with all prompts "yes"
rustup-init -y
rustc --version
if [ $? != 0 ];then
    echo 'Rust not installed correctly'
    exit 123
fi

# You need a Rust nightly toolchain to proceed
# (PyO3 does not support Rust stable at the moment).
# Run:
rustup default nightly
cargo build --release --features "python-binding"
