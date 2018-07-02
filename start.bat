@echo off 
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit
:begin
:ST
for /f "skip=3 tokens=4" %%i in ('sc query Tiger.MiddleWare') do set "zt=%%i" &goto :next
:next
if /i "%zt%"=="RUNNING" (goto 1)
if /i "%zt%"=="STOPPED" (goto 2)
:1
echo Tiger.MiddleWare服务在运行
:2
net start Tiger.MiddleWare

ping 127.0.0.1 -n 20 >nul 

goto ST


