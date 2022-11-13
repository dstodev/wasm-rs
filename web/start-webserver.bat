@echo off

set "script_dir=%~dp0"
set "source_dir=%script_dir%.."

set "target=wasm32-unknown-unknown"

call %script_dir%\build-wasm.bat %script_dir%

:: https://docs.python.org/3/library/http.server.html
python -m http.server 58000 --directory %script_dir% --bind 0.0.0.0
