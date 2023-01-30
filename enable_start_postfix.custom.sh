#!/bin/sh
if [ "$(launchctl print-disabled system | grep com.apple.postfix | grep -o '[^ ]*$')" = 'true' ];
 then
	#Default postfix disabled -> nop
        exit 0;

 else
	#Default postfix enabled - switch to postfix.custom
	#Killing and disabling default postfix service
	launchctl kill SIGTERM system/com.apple.postfix.master
	launchctl disable system/com.apple.postfix.master
	#Enabling and starting postfix.custom
	launchctl enable system/org.postfix.custom
	launchctl kickstart system/org.postfix.custom
	exit 0;
fi
