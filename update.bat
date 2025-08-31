@echo off
echo start Update...
cd /d "%~dp0"
set PATH=%CD%\PortableGit\cmd;%PATH%
git fetch origin
git reset --hard origin/main
git clean -fd
pause