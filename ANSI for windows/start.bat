rem ��ӭʹ��start.bat���汾��1.2
rem ����Ŀ¼������times.txt��¼�Ͷ�ȡ����������
@ECHO OFF
setlocal enabledelayedexpansion
rem �ڴ��С,��λΪMByte
set a=1024
rem ����˺����ļ���
set b=spigot-1.13.2.jar
rem ���Ҫ�رտ���̨��ɫ��ȥ���·�ע��
rem set c=-nojline
rem �����Ǵ��벿��
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
if %var2%==0 (set num= ) else (set num= ������ !var2! �� )
set cnt=0
for /f "delims=" %%i in ('dir/b/a-d "plugins\*.jar" 2^>nul') do set /a cnt+=1
if defined cnt (set pl=!cnt! �����) else (set pl=û�в��)
title %name% �ڴ�%a%M%num%�������� %times% �� %pl%
echo ����Ŀ¼ : %cd%
echo -------------------------------------------------
if "%PROCESSOR_ARCHITECTURE:~0,3%" equ "x86" (echo 32λ�����) else (echo 64 λ�����)
echo ��������������%NUMBER_OF_PROCESSORS% ϵͳ��%OS% оƬ�ṹ��%PROCESSOR_ARCHITECTURE%
echo ���ڣ�%DATE% ʱ�䣺%time%
echo %pl%
echo -------------------------------------------------
echo start.bat version 1.2            Powered by feios
"java.exe" -Xincgc -Xmx%a%M -XX:+AggressiveOpts -XX:+UseCompressedOops -jar %b% %c%
ping -n 1 127.1>nul
set ret=11
:re2
rem NEQ��ʾ������
if %var% NEQ 3 (goto re3) else (goto re4)
:re3
set /a ret=ret-1
ping -n 2 -w 500 127.1>nul
cls
echo ����Ŀ¼ : %cd%
echo -------------------------------------------------
echo %ret% �����е� %var% ������ �������� %times% ��
echo -------------------------------------------------
echo                                  Powered by feios
title ����� %name% ���� %ret% �����е� %var% ������
if %ret%==0 (call :re1 %var%) else (goto re3)
:re4
title [����ͣ] ����� %name% ��Ҫע��
echo -------------------------------------------------
echo ע�⣺
echo ��Ϊ %name% �ķ�����Զ����� %var% ���ˣ�
echo ��������ֶ�����������˿������ش�bug
echo �����%pl%
echo ����log�ļ�
echo -------------------------------------------------
echo ��������ͣ������������Դ����ٴ����� & pause>nul
call :re1 %var%
