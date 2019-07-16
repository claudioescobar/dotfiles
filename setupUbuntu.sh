#####
#SEE https://linuxconfig.org/things-to-do-after-installing-ubuntu-18-04-bionic-beaver-linux#h1-set-the-fastest-repository-mirror
#####

#update indexes
sudo apt update

#list all packages scheduled to update
#apt list --upgradable

#update ubuntu
sudo apt upgrade

#update all kept back packages
sudo apt dist-upgrade

#remove no longer required packages
sudo apt autoremove

#install firewall
sudo apt install gufw -y

#firewall status / enabling
#sudo ufw status
#sudo ufw disable

#remove ubuntu web launchers
sudo apt purge ubuntu-web-launchers

#intall more dock configurations
sudo apt install dconf-tools -y

#configure dock
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

#dock default settings
#gsettings reset org.gnome.shell.extensions.dash-to-dock dash-max-icon-size

#install thirdparty codecs and extras
sudo apt install ubuntu-restricted-extras -y

#install extra codecs(netflix)
sudo apt install libavcodec-extra -y

#DEB packager
sudo apt install gdebi-core -y

#install some commands
sudo apt-get install curl -y

#stacer system-monitoring
sudo add-apt-repository ppa:oguzhaninan/stacer -y
sudo apt-get update
sudo apt-get install stacer -y

#MANUAL CONFIGS
#enable drm on firefox settings for netflix watching
#Settings --> Screen Display --> Night Light
#face detection login -> https://github.com/Boltgolt/howdy#installation

#DEVELOPER PROGRAMS
#VSCODE
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo apt-get update
sudo apt-get install code -y

#SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

#java
sdk install java 11.0.3.hs-adpt

#maven
sdk install maven 3.6.1

#ant
sdk install ant 1.10.1

#gradle
sdk install gradle 5.5.1

#groovy
sdk install groovy 2.5.7

#Intellij
#wget -O /opt/jetbrains_toobox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.tar.gz
#sudo tar xfz /opt/jetbrains_toobox.tar.gz 
#sudo rm jetbrains_toobox.tar.gz

#Docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https -y \
    ca-certificates -y \
    curl -y \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce -y

#Give permissions to the current user - restart computer after that
sudo usermod -aG docker escobardo

#Docker machine - go to https://github.com/docker/machine/releases to get the newest releases
curl -L https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

#Docker Compose - go to https://github.com/docker/compose/releases to get the newest releases
curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#DBeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt-get update && sudo apt-get install dbeaver-ce
echo "Go to /usr/share/dbeaver/dbeaver.ini and add(just before vmargs): "
echo "-vm"
echo "/home/userhome/.sdkman/candidates/java/current/bin"                                                                                                                                                               
echo "-vmargs"
#uncomment the code below to install java if you have admin permissions
#yes | sdk install java 8.0.191-oracle

#uncomment the code below to generate portable jdk(does not require admin permission)
#wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-windows-x64.exe" -O /opt/java/jdk-8u191-windows-x64.exe

echo "RESTART THE COMPUTER ;)"