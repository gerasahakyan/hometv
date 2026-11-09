@echo off
chcp 65001 >nul
set /p IP=IP-адрес телевизора: 
adb connect %IP%:5555
adb shell pm enable com.google.android.tvlauncher
adb shell pm enable com.google.android.apps.tv.launcherx
adb shell pm enable com.google.android.leanbacklauncher
adb uninstall com.gera.tvhome
echo Готово, старый главный экран возвращён.
pause
