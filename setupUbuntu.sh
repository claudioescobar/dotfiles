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
sudo apt install curl -y

#stacer system-monitoring
sudo add-apt-repository ppa:oguzhaninan/stacer -y
sudo apt update
sudo apt install stacer -y

#MANUAL CONFIGS
#enable drm on firefox settings for netflix watching
#Settings --> Screen Display --> Night Light
#face detection login -> https://github.com/Boltgolt/howdy#installation

#DEVELOPER PROGRAMS
#VSCODE
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo apt update
sudo apt install code -y

#SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

#java
sdk install java 11.0.4.hs-adpt

#maven
sdk install maven 3.6.2

#ant
sdk install ant 1.10.1

#gradle
sdk install gradle 5.6.2

#groovy
sdk install groovy 2.5.8

#Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#Give permissions to the current user - restart computer after that!
sudo usermod -aG docker $USER

#Docker machine - go to https://github.com/docker/machine/releases to get the newest releases
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

#Docker Compose - go to https://github.com/docker/compose/releases to get the newest releases
sudo curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#DBeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt install -y dbeaver-ce
echo "If need jvm new version support go to /usr/share/dbeaver/dbeaver.ini and add(just before vmargs): "
echo "-vm"
echo "/home/userhome/.sdkman/candidates/java/current/bin"                                                                                                                                                               
echo "-vmargs"

#virtualbox 6.0
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
sudo apt install -y virtualbox-6.0

#kubernetes
sudo apt update && sudo apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

#minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo install minikube /usr/local/bin

#uncomment the code below to install java if you have admin permissions
#yes | sdk install java 8.0.191-oracle

#uncomment the code below to generate portable jdk(does not require admin permission)
#wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-windows-x64.exe" -O /opt/java/jdk-8u191-windows-x64.exe

echo "RESTART THE COMPUTER ;)"