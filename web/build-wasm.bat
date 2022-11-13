@echo off

set "script_dir=%~dp0"
set "build_dir=%1"

if "%build_dir%" == "" set "build_dir=%script_dir%"

set "target=wasm32-unknown-unknown"

rustup target add wasm32-unknown-unknown

:: pushd/popd and %cd% for better handling of relative paths
pushd %build_dir%
set "build_dir=%cd%"
popd

:: requires wasm-pack: https://github.com/rustwasm/wasm-pack
wasm-pack --quiet build --target web --out-dir "%build_dir%\pkg"
