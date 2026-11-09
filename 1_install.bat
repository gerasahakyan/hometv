@echo off
chcp 65001 >nul
set /p IP=IP-адрес телевизора: 
adb connect %IP%:5555
echo Если на телевизоре появился запрос отладки - разреши его и нажми любую клавишу.
pause >nul
adb install -r app-debug.apk
adb shell am start -n com.gera.tvhome/.MainActivity
echo.
echo Лаунчер должен быть открыт на телевизоре. Проверь пульт и запуск приложения.
set /p OK=Всё работает, сделать его главным экраном? (y/n): 
if /i not "%OK%"=="y" goto end
adb shell cmd package set-home-activity com.gera.tvhome/.MainActivity
adb shell pm disable-user --user 0 com.google.android.tvlauncher
adb shell pm disable-user --user 0 com.google.android.apps.tv.launcherx
adb shell pm disable-user --user 0 com.google.android.leanbacklauncher
echo.
echo Текущий главный экран:
adb shell cmd package resolve-activity --brief -a android.intent.action.MAIN -c android.intent.category.HOME
:end
pause
