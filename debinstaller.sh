#!/bin/bash 

#Script meant to automate the install of a usable 2bwm system for Debian Linux from base install.
sudo apt update && sudo apt upgrade

sudo apt install -y \
`#List of packages` \
xorg \
rxvt-unicode \
dmenu \
feh \
hsetroot \
xdotool \
zsh \
xclip \
dunst \
libnotify4 \
stow \
vim \
nano \
xfonts-terminus \
python3 \
python3-pip \
youtube-dl \
mpv \
compton \
firefox-esr \
alsa-tools \
alsa-utils \
lemonbar \
ranger \
neovim \
neofetch \
`#xcb 2bwm depends` \
libxcb1-dev \
libxcb-keysyms1-dev \
libxcb-randr0-dev \
libxcb-icccm4-dev \
libxcb-ewmh-dev \
libxcb-xrm-dev \
imagemagick \

#Another update for good measure

sudo apt update && sudo apt upgrade -y

#git/pip downloads

#pip download for pywal

pip3 install pywal

#add oh-my-zsh and change shell
cd ~
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/dotfiles/zsh/.oh-my-zsh

cd ~
git clone https://www.github.com/venam/2bwm.git
cd ~
git clone --recurse-submodules https://www.github.com/Angry-Man/dotfiles.git
cd ~
git clone https://www.github.com/Angry-Man/scripts.git
cd ~
git clone https://www.github.com/Angry-Man/sys-comps.git
cd ~

#Consolidating updated 2bwm with my config and edit for username in config.h

cp ~/sys-comps/2bwm/config.h ~/2bwm/config.h

sudo mv -f ~/2bwm ~/sys-comps

echo "Change username for dmenu script."
wait 500

vim ~/sys-comps/2bwm/config.h

#Making git files excecutables

cd ~ 

chmod +x ~/scripts/theming/rldrsc_bspwm
chmod +x ~/scripts/theming/rldrsc_twobwm
chmod +x ~/scripts/theming/theme_changer
chmod +x ~/scripts/theming/wpset

chmod +x ~/sys-comps/bar/bar1.sh
chmod +x ~/sys-comps/bar/barmaster.sh

chmod +x ~/sys-comps/dmenu/dmenu.sh

chmod +x ~/sys-comps/dunst/dunstset.sh

#Compiling and installing 2bwm

cd ~/sys-comps/2bwm
sudo make && sudo make install

sudo rm -r ~/2bwm

#change shell to zsh
chsh -s /bin/zsh

#Use stow to symlink all dotfiles

cd ~/dotfiles

stow dunst
stow zsh
stow Xres
stow neofetch
stow wal

cd ~
#Run themer
${HOME}/scripts/theming/theme_changer

#Another update for good measure

sudo apt update && sudo apt upgrade -y

#Cleaning up

sudo rm -r ~/Fresh-Installs

clear

echo "Done ...maybe. Remeber the platform you are on, rebooting now for fresh start."
wait 500

sudo systemctl reboot

#END
