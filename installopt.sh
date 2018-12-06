#!/usr/bin/env bash

# sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install maven 3.6.0
sdk install ant 1.10.1

#uncomment the code below to install java if you have admin permissions
#yes | sdk install java 8.0.191-oracle

#uncomment the code below to generate portable jdk(does not require admin permission)
#wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-windows-x64.exe" -O /opt/java/jdk-8u191-windows-x64.exe