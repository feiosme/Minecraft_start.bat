rem 欢迎使用start.bat，本人QQ 1327979498
rem 以当前目录名为版本显示在标题，方便确认打开的服务端
rem 会在目录下生成times.txt记录和读取总启动次数
@ECHO OFF
setlocal enabledelayedexpansion
:re1
cls
rem 内存大小,单位为MByte
set a=1024
rem 服务端核心文件名
set b=spigot-1.13.2.jar
rem 如果要关闭控制台颜色，去掉下方注释
rem set c=-nojline
set /a times2=0
set /a times=1 
for /f %%a in (times.txt) do set /a times=%%a+1 
echo %times% >times.txt 
if %times%== %times2% goto a 
set /a yu=%times2%-%times%
set /a var=%1+1
set "d=%~p0"
set "d=%d:\= %"
for %%a in (%d%) do set name=%%a
set /a var=%1+1
title 版本: %name% 内存%a%M 第%var%次运行 共计运行 %times% 次
echo 启动目录 : %cd%
echo -------------------------------------------------
if "%PROCESSOR_ARCHITECTURE:~0,3%" equ "x86" (echo 32位计算机) else (echo 64 位计算机)
echo 处理器核心数：%NUMBER_OF_PROCESSORS% 系统：%OS% 芯片结构：%PROCESSOR_ARCHITECTURE%
echo 日期：%DATE% 时间：%time%
echo -------------------------------------------------
echo                                  Powered by feios
"java.exe" -Xincgc -Xmx%a%M -XX:+AggressiveOpts -XX:+UseCompressedOops -jar %b% %c%
ping -n 1 127.1>nul
set ret=11
:re2
set /a ret=ret-1
ping -n 2 -w 500 127.1>nul
rem 取消下行注释即可关闭自动重启
rem echo 按任意键重启 & pause>nul
cls
echo 启动目录 : %cd%
echo -------------------------------------------------
echo %ret% 秒后进行第 %var% 次重启 共计运行 %times% 次
echo -------------------------------------------------
echo                                  Powered by feios
title %ret% 秒后进行第 %var% 次重启 共计运行 %times% 次
if %ret%==0 (call :re1 %var%) else (goto re2)
