sc create intdriver binPath="%~dp0\iqww64e.sys" type=kernel
sc start intdriver
dma-nk.exe
pause
sc stop intdriver
sc delete intdriver






