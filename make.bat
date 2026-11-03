@echo off
setlocal
cd /d "%~dp0"

where latexmk >nul 2>nul || (
    echo latexmk was not found. Install TeX Live 2026 and add it to PATH.
    exit /b 1
)
where zhmakeindex >nul 2>nul || (
    echo zhmakeindex was not found. Add it to PATH.
    exit /b 1
)
where python >nul 2>nul || (
    echo Python 3 was not found. Add it to PATH.
    exit /b 1
)

if /i "%~1"=="clean" (
    latexmk -C GB-template
    exit /b %errorlevel%
)

latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error GB-template
exit /b %errorlevel%
