@echo off
echo start Update...
cd /d "%~dp0"
set PATH=%CD%\PortableGit\cmd;%PATH%
git pull origin main
pause
