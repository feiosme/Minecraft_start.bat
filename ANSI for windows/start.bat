rem 欢迎使用start.bat，版本号1.2
rem 会在目录下生成times.txt记录和读取总启动次数
@ECHO OFF
setlocal enabledelayedexpansion
rem 内存大小,单位为MByte
set a=1024
rem 服务端核心文件名
set b=spigot-1.13.2.jar
rem 如果要关闭控制台颜色，去掉下方注释
rem set c=-nojline
rem 以下是代码部分
:re1
cls
set /a times2=0
set /a times=1 
for /f %%a in (times.txt) do set /a times=%%a+1 
echo %times% >times.txt 
if %times%== %times2% goto a 
set /a yu=%times2%-%times%
set /a var=%1+1
set /a var2=%var%-1
set "d=%~p0"
set "d=%d:\= %"
for %%a in (%d%) do set name=%%a
set /a var=%1+1
if %var2%==0 (set num= ) else (set num= 已重启 !var2! 次 )
set cnt=0
for /f "delims=" %%i in ('dir/b/a-d "plugins\*.jar" 2^>nul') do set /a cnt+=1
if defined cnt (set pl=!cnt! 个插件) else (set pl=没有插件)
title %name% 内存%a%M%num%共计运行 %times% 次 %pl%
echo 启动目录 : %cd%
echo -------------------------------------------------
if "%PROCESSOR_ARCHITECTURE:~0,3%" equ "x86" (echo 32位计算机) else (echo 64 位计算机)
echo 处理器核心数：%NUMBER_OF_PROCESSORS% 系统：%OS% 芯片结构：%PROCESSOR_ARCHITECTURE%
echo 日期：%DATE% 时间：%time%
echo %pl%
echo -------------------------------------------------
echo start.bat version 1.2            Powered by feios
"java.exe" -Xincgc -Xmx%a%M -XX:+AggressiveOpts -XX:+UseCompressedOops -jar %b% %c%
ping -n 1 127.1>nul
set ret=11
:re2
rem NEQ表示不等于
if %var% NEQ 3 (goto re3) else (goto re4)
:re3
set /a ret=ret-1
ping -n 2 -w 500 127.1>nul
cls
echo 启动目录 : %cd%
echo -------------------------------------------------
echo %ret% 秒后进行第 %var% 次重启 共计运行 %times% 次
echo -------------------------------------------------
echo                                  Powered by feios
title 服务端 %name% 将在 %ret% 秒后进行第 %var% 次重启
if %ret%==0 (call :re1 %var%) else (goto re3)
:re4
title [已暂停] 服务端 %name% 需要注意
echo -------------------------------------------------
echo 注意：
echo 名为 %name% 的服务端自动重启 %var% 次了！
echo 如果不是手动操作，服务端可能有重大bug
echo 服务端%pl%
echo 请检查log文件
echo -------------------------------------------------
echo 程序已暂停，按任意键忽略错误并再次启动 & pause>nul
call :re1 %var%
