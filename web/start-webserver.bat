@echo off

set "script_dir=%~dp0"
set "source_dir=%script_dir%.."

set "target=wasm32-unknown-unknown"

:: https://developer.mozilla.org/en-US/docs/WebAssembly/Rust_to_wasm
:: https://stackoverflow.com/questions/62585840/web-assembly-and-rust-cargo-build-vs-wasm-pack
cargo build --release --manifest-path %source_dir%\Cargo.toml --target=%target%

copy %source_dir%\target\%target%\release\wasm_rs.wasm %script_dir%\rs.wasm

:: https://docs.python.org/3/library/http.server.html
python -m http.server 58000 --directory %script_dir% --bind 0.0.0.0
