@Echo off
rem ��������
   rem ��������������
set Name=My Version:2.0
   rem �����ļ����ã��ǵü�.jar��
set bin=craftbukkit-1.7.2-R0.4.jar
   rem �����ڴ�����(Ĭ��128M)
set Xms=128M
   rem �����ڴ����ã�������1G��1024M��
set Xmx=1G
   rem ���������������ĿǰΪ:10��
set Maxreloadnu=10
 
 
 
rem ������File
if exist xhyun.wang (
echo �ļ��д���
) else (
md xhyun.wang
echo �ļ����������
)
 
rem ������Java
set reloadnu=0
title %Name% �Ѿ�����������:%reloadnu%��
SET BINDIR=%~dp0
:_MENU
CLS
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
cls
@echo ��һ������: %date% %tm1%��%TM2%��%tm3%��>>.\xhyun.net\��־.txt
echo                   ������%date% %tm1%��%TM2%��
@echo ***************************************************************** 
@echo.                      Author:Huangshize
@echo.                      QQ:2047671327
@echo.                      Version:2.1 Fixed    
@echo *****************************************************************
@echo.��������%Name%,���Ժ�........
@echo.��ǰ�����ڴ�Ϊ:%Xmx% 
@echo.�����ļ���:%bin%
@echo *****************************************************************
@echo.����Ա�б�OPList:
if exist "ops.yml" (
type "ops.yml"
)else (
type "ops.json"
)
@echo.
@echo *****************************************************************
java -Xms%Xms% -Xmx%Xmx% -jar %bin%
rem ������Java-�ָ���
@echo *****************************************************************                              
@echo *****************************************************************
:restart
@echo ����: %date% %tm1%��%TM2%��%tm3%��>>.\xhyun.net\��־.txt
if %reloadnu% gtr %Maxreloadnu% (
goto stop
)
@echo *****************************************************************
@echo.��������%Name%,���Ժ�........
@echo.��ǰ�����ڴ�Ϊ:%Xmx% 
@echo.�����ļ���:%bin%
@echo *****************************************************************
set /a reloadnu=%reloadnu%+1
title %Name%  �Ѿ�ǿ����������Ϊ:%reloadnu%
java -Xms%Xms% -Xmx%Xmx% -jar %bin%
rem ������Java-����ʱ�����
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
@echo ����: %date% %tm1%��%TM2%��%tm3%��>>.\xhyun.net\��־.txt
rem ������Java-�ָ���
@echo *****************************************************************                              
@echo *****************************************************************
rem ������Java-�ٴ�����
goto restart
rem ������Java-88
:stop
@echo *****************************************************************
@echo. �����ļ���:%bin%       
@echo. ������һֱ����������:%Name%
@echo. ��ǰ�����ڴ�Ϊ:%Xmx% 
@echo. ϵͳ�����Զ�ͣ��
@echo.                     %reloadnu%����%Maxreloadnu%
@echo *****************************************************************
pause
EXIT
