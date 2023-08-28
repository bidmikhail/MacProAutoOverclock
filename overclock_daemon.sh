sh /Users/Shared/overclock/ZDNet-Clock/ZDNet\ Clock.app/Contents/Resources/initkernel /Users/Shared/overclock/ZDNet-Clock/ZDNet\ Clock.app/Contents/Resources/overclock.kext
sysctl -w "kern.busclock=455000000"
sleep 1
reboot
