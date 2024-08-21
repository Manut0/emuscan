sc create theotherone binPath="%~dp0\theotherone.sys" type=kernel
sc start theotherone
cd %~dp0\
dma-nk.exe
pause
sc stop theotherone
sc delete theotherone






