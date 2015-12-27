@Echo off
rem 变量设置
   rem 服务器名字设置
set Name=My Version:2.0
   rem 运行文件设置（记得加.jar）
set bin=craftbukkit-1.7.2-R0.4.jar
   rem 启动内存设置(默认128M)
set Xms=128M
   rem 运行内存设置（可以以1G或1024M）
set Xmx=1G
   rem 最大奔溃重启次数（目前为:10）
set Maxreloadnu=10
 
 
 
rem 主程序File
if exist xhyun.wang (
echo 文件夹存在
) else (
md xhyun.wang
echo 文件夹生成完毕
)
 
rem 主程序Java
set reloadnu=0
title %Name% 已经崩溃重启了:%reloadnu%次
SET BINDIR=%~dp0
:_MENU
CLS
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
cls
@echo 第一次启动: %date% %tm1%点%TM2%分%tm3%秒>>.\xhyun.net\日志.txt
echo                   现在是%date% %tm1%点%TM2%分
@echo ***************************************************************** 
@echo.                      Author:Huangshize
@echo.                      QQ:2047671327
@echo.                      Version:2.1 Fixed    
@echo *****************************************************************
@echo.正在启动%Name%,请稍候........
@echo.当前启动内存为:%Xmx% 
@echo.启动文件从:%bin%
@echo *****************************************************************
@echo.管理员列表OPList:
if exist "ops.yml" (
type "ops.yml"
)else (
type "ops.json"
)
@echo.
@echo *****************************************************************
java -Xms%Xms% -Xmx%Xmx% -jar %bin%
rem 主程序Java-分割线
@echo *****************************************************************                              
@echo *****************************************************************
:restart
@echo 重启: %date% %tm1%点%TM2%分%tm3%秒>>.\xhyun.net\日志.txt
if %reloadnu% gtr %Maxreloadnu% (
goto stop
)
@echo *****************************************************************
@echo.正在启动%Name%,请稍候........
@echo.当前启动内存为:%Xmx% 
@echo.启动文件从:%bin%
@echo *****************************************************************
set /a reloadnu=%reloadnu%+1
title %Name%  已经强制重启次数为:%reloadnu%
java -Xms%Xms% -Xmx%Xmx% -jar %bin%
rem 主程序Java-奔溃时间记入
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
@echo 奔溃: %date% %tm1%点%TM2%分%tm3%秒>>.\xhyun.net\日志.txt
rem 主程序Java-分割线
@echo *****************************************************************                              
@echo *****************************************************************
rem 主程序Java-再次重启
goto restart
rem 主程序Java-88
:stop
@echo *****************************************************************
@echo. 启动文件从:%bin%       
@echo. 不可能一直重启服务器:%Name%
@echo. 当前启动内存为:%Xmx% 
@echo. 系统故障自动停机
@echo.                     %reloadnu%大于%Maxreloadnu%
@echo *****************************************************************
pause
EXIT
