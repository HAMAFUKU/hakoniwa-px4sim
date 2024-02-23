@echo off
setlocal

:: WSL IP�A�h���X�̎擾
for /f "tokens=3" %%a in ('netsh interface ip show address "vEthernet (WSL (Hyper-V firewall))" ^| findstr "IP Address"') do set "WSL_IP=%%a"

:: IP�A�h���X�̊m�F
if not defined WSL_IP (
    echo WSL IP address could not be found.
    exit /b 1
)

echo WSL IP Address: %WSL_IP%

:: ���s�f�B���N�g���� cmake-build �ɕύX
pushd cmake-build

:: �R�}���h�̎��s
..\..\out\build\x64-Debug\hakoniwa\src\hako-px4sim.exe %WSL_IP% 4560 sim

:: ���̃f�B���N�g���ɖ߂�
popd

endlocal
