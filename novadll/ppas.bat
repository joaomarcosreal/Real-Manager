@echo off
SET THEFILE=C:\fontes\Real Manager\real\novadll\tbudf.dll
echo Linking %THEFILE%
e:\lazarus\fpc\3.2.0\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections  -s --dll  --entry _DLLMainCRTStartup   --base-file base.$$$ -o "C:\fontes\Real Manager\real\novadll\tbudf.dll" "C:\fontes\Real Manager\real\novadll\link.res"
if errorlevel 1 goto linkend
dlltool.exe -S e:\lazarus\fpc\3.2.0\bin\x86_64-win64\as.exe -D "C:\fontes\Real Manager\real\novadll\tbudf.dll" -e exp.$$$ --base-file base.$$$ 
if errorlevel 1 goto linkend
e:\lazarus\fpc\3.2.0\bin\x86_64-win64\ld.exe -b pei-x86-64  -s --dll  --entry _DLLMainCRTStartup   -o "C:\fontes\Real Manager\real\novadll\tbudf.dll" "C:\fontes\Real Manager\real\novadll\link.res" exp.$$$
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
