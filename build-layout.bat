@echo off
setlocal
if not "%VCINSTALLDIR%" == "" goto found_vc
rem VisualStudio 2013 Community Edition Update 4
for /f "skip=2 tokens=2,*" %%a in ('reg query HKLM\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VC7 /v 14.0 2^>NUL') do set VCINSTALLDIR=%%b
if "%VCINSTALLDIR%" == "" goto find_ddk

:found_vc
if "%VisualStudioVersion%" == "" goto initialize

rem Even though we may already be called from an initialized environment
rem we must do it again because we are building an x86 launcher
if not "%Platform%" == "X64" goto platfx86

:initialize
call "%VCINSTALLDIR%\vcvarsall.bat" x86

:platfx86
set BIN32=%VCINSTALLDIR%\bin
set BIN64=%VCINSTALLDIR%\bin\x86_amd64

rem Avoid getting unresolved external for security_cookie symbol,
rem see http://support.microsoft.com/kb/894573 for explanation
set NO_GS=-GS-
goto make

:find_ddk
if not "%BASEDIR%" == "" goto found_ddk

rem Windows 2003 DDK on Windows XP
for /f "skip=4 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\WINDDK\3790.1830" /v SFNDirectory 2^>NUL') do set BASEDIR=%%a

:found_ddk
set PATH=%BASEDIR%\bin\x86;%WINDIR%\System32
set INCLUDE=%BASEDIR%\inc\wxp;%BASEDIR%\inc\crt
set LIB=%BASEDIR%\lib\wxp\i386;%BASEDIR%\lib\crt\i386

rem DDK compiler does not support this option; it is silently ignored
rem if specified, but it cannot be disabled
set NO_GS=

set BIN32=%BASEDIR%\bin\x86
set BIN64=%BASEDIR%\bin\win64\x86\amd64

:make
nmake -nologo -fkbdneo2.mak "BIN32=%BIN32%" "BIN64=%BIN64%" "NO_GS=%NO_GS%" %*

endlocal
