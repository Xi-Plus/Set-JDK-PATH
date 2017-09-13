@echo off



set NewPath="C:\Program Files\Java\jdk1.8.0_144\bin"
rem *** Change your PATH at previous line. DO NOT change other lines! ***



echo You will add %NewPath% to your "User PATH".
echo.
echo Please double check it.
echo Close this window to cancel.
pause

for /f "usebackq tokens=2*" %%A in (`reg query "HKCU\Environment" /v path`) do set OldPath=%%B
echo %OldPath% > oldpath.txt
setx path "%OldPath%";%NewPath%

(
echo @echo off
echo echo if you see javac version that means it was set successfully
echo javac -version
echo echo.
echo pause
echo del "%%~f0"
) > Check-javac.bat

echo.
echo Setting is completed. You can run "Check-javac.bat" at the same folder to check if the setting is successfully
echo.
pause
