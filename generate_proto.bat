@echo off

set PROTO_ROOT=%cd%
set OUT_DIR=%PROTO_ROOT%\generated

echo =============================================
echo     Generating all protobuf files
echo =============================================
echo Proto root: %PROTO_ROOT%
echo Output dir: %OUT_DIR%
echo.

if not exist "%OUT_DIR%" (
    echo Creating output dir...
    mkdir "%OUT_DIR%"
)

for /r "%PROTO_ROOT%" %%f in (*.proto) do (
    echo Found proto: %%f
    protoc ^
        --proto_path="%PROTO_ROOT%" ^
        --go_out="%OUT_DIR%" ^
        --go-grpc_out="%OUT_DIR%" ^
        "%%f"
)

echo -----------------------------------------
echo Done All proto files generated.
pause
