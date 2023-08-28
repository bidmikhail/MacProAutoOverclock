# MacProAutoOverclock
Automatic overclock script for Mac Pro 1.1, Mac Pro 2.1 and Mac Pro 3.1 models. This script is using ZDNet Clock utility to automatically overclock Mac Pro on Mac OS X Leopard startup and reboot the system after that.

Usage:

1. Copy com.example.d file to the folder /Library/LaunchDaemons
2. Run in terminal using your admin password:

sudo chown root:wheel /Library/LaunchDaemons/com.example.d

sudo chmod -rw-r--r-- /Library/LaunchDaemons/com.example.d

3. Copy this folder (with this README.txt file inside) to the /Users/Shared folder and rename it to "overclock"
4. Open the file /Users/Shared/overclock/overclock_daemon.sh with TextEdit and specify the new System Bus speed in Hz, e.g. "kern.busclock=455000000". You can specify steps=410000000 or any other value.

5. reboot
