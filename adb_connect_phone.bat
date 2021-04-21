::将手机通过wifi连接到电脑 可以无线调试的脚本
::使用方法：1.手机通过数据线连接到电脑 2.双击执行脚本 3.拔掉数据线
@echo off
::获取链接到电脑手机ip命令
set c=adb shell "ip addr show wlan0 | grep -e wlan0$ | cut -d\" \" -f 6 | cut -d/ -f 1"
::将手机ip赋值给变量a
for /f "delims=" %%a in ('%c%') do set a=%%a
adb tcpip 5555
adb connect %a%:5555
pause