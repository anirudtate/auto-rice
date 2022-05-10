#!/bin/sh

sudo pacman -S --noconfirm xorg-server sx xorg-xkill xorg-xsetroot xorg-xprop \
     ttf-jetbrains-mono ttf-joypixels \
     sxiv mpv zathura zathura-pdf-mupdf \
     fzf man-db xwallpaper python-pywal unclutter xclip maim \
     zip unzip unrar p7zip xdotool brightnessctl  \
     dosfstools ntfs-3g git sxhkd zsh pipewire pipewire-pulse \
     rsync dash \
     xcompmgr thunar gvfs gvfs-mtp nnn \
     pamixer zsh-autosuggestions zsh-completions zsh-history-substring-search \
     zsh-syntax-highlighting xdg-user-dirs

cd $HOME
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anirudtate/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

# dwm: Window Manager
git clone --depth=1 https://github.com/anirudtate/dwm.git ~/.local/src/dwm
sudo make -C ~/.local/src/dwm install

# st: Terminal
git clone --depth=1 https://github.com/anirudtate/st.git ~/.local/src/st
sudo make -C ~/.local/src/st install

# dmenu: Program Menu
git clone --depth=1 https://github.com/anirudtate/dmenu.git ~/.local/src/dmenu
sudo make -C ~/.local/src/dmenu install

# yay: AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -fsri
cd
yay -S --noconfirm dashbinsh google-chrome

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot config --local status.showUntrackedFiles no
exit
