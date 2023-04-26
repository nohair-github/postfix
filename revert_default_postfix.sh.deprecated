#!/bin/sh
if [ "$(launchctl print-disabled system | grep com.apple.postfix | grep -o '[^ ]*$')" = 'true' ];
 then
        #Disable and stop postfix.custom
        launchctl kill SIGTERM system/org.postfix.custom
        launchctl disable system/org.postfix.custom
        #Enabling and starting default postfix  
        launchctl enable system/com.apple.postfix.master   
        launchctl kickstart system/com.apple.postfix.master
        exit 0;
 
 else
        #Default postfix enabled -> nop 
        exit 0;
fi
