@echo off
if "%~2"=="" (
    echo Usage: %0 "<hakoniwa-unity-drone-model location>" "<config directory>"
    exit /b 1
)

setlocal

:: WSL IP�A�h���X�̎擾
for /f "tokens=3" %%a in ('netsh interface ip show address "vEthernet (WSL (Hyper-V firewall))" ^| findstr "IP Address"') do set "WSL_IP=%%a"

:: IP�A�h���X�̊m�F
if not defined WSL_IP (
    echo WSL IP address could not be found.
    exit /b 1
)

echo WSL IP Address: %WSL_IP%



set "HAKO_CUSTOM_JSON_PATH=%~1\custom.json"
set "DRONE_CONFIG_PATH=%~2"


:: �R�}���h�̎��s
..\out\build\x64-Release\hakoniwa\src\hako-px4sim.exe %WSL_IP% 4560 sim

:: ���̃f�B���N�g���ɖ߂�
popd

endlocal
