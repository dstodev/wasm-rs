@echo off

set "script_dir=%~dp0"
set "source_dir=%script_dir%.."

set "build_dir=%1"
if "%build_dir%" == "" set "build_dir=%script_dir%"

set "target=wasm32-unknown-unknown"

rustup target add wasm32-unknown-unknown

:: https://stackoverflow.com/questions/62585840/web-assembly-and-rust-cargo-build-vs-wasm-pack

::cargo build --release --manifest-path %source_dir%\Cargo.toml --target=%target%
::copy %source_dir%\target\%target%\release\wasm_rs.wasm %build_dir%\rs.wasm

:: requires wasm-pack: https://github.com/rustwasm/wasm-pack
wasm-pack --quiet build --target web --out-dir %build_dir%pkg
