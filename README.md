# MacProAutoOverclock
Automatic overclock script for Mac Pro 1.1, Mac Pro 2.1 and Mac Pro 3.1 models. This script is using ZDNet Clock utility to automatically overclock Mac Pro on Mac OS X Leopard startup and reboot the system after that.

Usage:

1. Copy com.example.d file to the folder /Library/LaunchDaemons
2. Run in terminal using your admin password:

sudo chown root:wheel /Library/LaunchDaemons/com.example.d

sudo chmod -rw-r--r-- /Library/LaunchDaemons/com.example.d

3. Copy this inject folder (with this README.txt file inside) to the /Users/Shared folder
4. Open the file /Users/Shared/inject/overclock_daemon.sh with TextEdit and specify the number of overclock steps by editing the default value "steps=40". You can specify steps=20 or any other number of steps.

5. reboot
