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
wget -O ~/stacer.deb https://jaist.dl.sourceforge.net/project/stacer/v1.0.9/stacer_1.0.9_amd64.deb
sudo dpkg -i ~/stacer.deb
sudo apt-get install -f

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
#sdk install gradle

#groovy
#sdk install groovy

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
