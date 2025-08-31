@echo off
title MushClientReset
start/wait PortableGit\bin\git.exe reset --hard HEAD
start/wait PortableGit\bin\git.exe clean -f
start PortableGit\bin\git.exe pull