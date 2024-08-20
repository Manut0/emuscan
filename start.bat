sc create intdriveremu binPath="%~dp0\iqww64e.sys" type=kernel
sc start intdriveremu 
dma-nk.exe
pause
sc stop intdriveremu
sc delete intdriveremu






