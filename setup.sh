#!/bin/bash

# yay install
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd ~/.config/yay
makepkg -si --noconfirm
cd

# update system
sudo pacman -Syu --noconfirm

# chaotic AUR

if [[ "$(uname -m)" == "x86_64" ]] && [ -z "$DISABLE_CHAOTIC" ]; then
  # Try installing Chaotic-AUR keyring and mirrorlist
  if ! pacman-key --list-keys 3056513887B78AEB >/dev/null 2>&1 &&
    sudo pacman-key --recv-key 3056513887B78AEB &&
    sudo pacman-key --lsign-key 3056513887B78AEB &&
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' &&
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'; then

    # Add Chaotic-AUR repo to pacman config
    if ! grep -q "chaotic-aur" /etc/pacman.conf; then
      echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null
    fi
  else
    echo -e "Failed to install Chaotic-AUR, so won't include it in pacman config!"
  fi
fi

sudo pacman -Syu --noconfirm

# basic files
mv ~/.config/Obrázky .
mv ~/.config/zshrc ~/.zshrc
mv ~/.config/rofi-power-menu ~/.local/bin
mv ~/.config/themes ~/.themes
mv ~/.config/icons ~/.icons

# Bootloader theme
sudo mv ~/.config/Virtuaverse /boot/grub/themes
sudo mv ~/.config/Cyberpunk /boot/grub/themes

# install programs
yay -S abook --noconfirm
yay -S adobe-source-han-sans-cn-fonts --noconfirm
yay -S adobe-source-han-sans-jp-fonts --noconfirm
yay -S adobe-source-han-sans-kr-fonts --noconfirm
yay -S adwaita-fonts --noconfirm
yay -S aerc --noconfirm
yay -S atool --noconfirm
yay -S bat --noconfirm
yay -S bluetui --noconfirm
yay -S breeze --noconfirm
yay -S brightnessctl --noconfirm
yay -S calcurse --noconfirm
yay -S caligula --noconfirm
yay -S cantarell-fonts --noconfirm
yay -S clamtk --noconfirm
yay -S clipse --noconfirm
yay -S clipse-gui --noconfirm
yay -S cronie --noconfirm
yay -S cups --noconfirm
yay -S deluge --noconfirm
yay -S downgrade --noconfirm
yay -S dragon-drop-git --noconfirm
yay -S dysk --noconfirm
yay -S fastfetch --noconfirm
yay -S firefox --noconfirm
yay -S fzf --noconfirm
yay -S gdu --noconfirm
yay -S gparted --noconfirm
yay -S grimblast-git --noconfirm
yay -S gst-plugins-good --noconfirm
yay -S gvfs --noconfirm
yay -S htop --noconfirm
yay -S hyprcursor --noconfirm
yay -S hypridle --noconfirm
yay -S hyprland --noconfirm
yay -S hyprland-qtutils --noconfirm
yay -S hyprpicker --noconfirm
yay -S hyprpolkitagent --noconfirm
yay -S imagemagick --noconfirm
yay -S kitty --noconfirm
yay -S lynx --noconfirm
yay -S man-db --noconfirm
yay -S mediainfo --noconfirm
yay -S mpv --noconfirm
yay -S mpv-mpris --noconfirm
yay -S ncspot --noconfirm
yay -S neovim --noconfirm
yay -S newsboat --noconfirm
yay -S noto-fonts-emoji --noconfirm
yay -S ntfs-3g --noconfirm
yay -S nwg-look --noconfirm
yay -S onlyoffice-bin --noconfirm
yay -S ouch --noconfirm
yay -S paccache-hook --noconfirm
yay -S perl-image-exiftool --noconfirm
yay -S pulsemixer --noconfirm
yay -S pyprland --noconfirm
yay -S python-ffsubsync --noconfirm
yay -S python-ffsubsync-venv --noconfirm
yay -S python-pipx --noconfirm
yay -S qimgv-git --noconfirm
yay -S qt5-wayland --noconfirm
yay -S qt5ct --noconfirm
yay -S qt6-wayland --noconfirm
yay -S qt6ct --noconfirm
yay -S reflector --noconfirm
yay -S rofi --noconfirm
yay -S rofi-calc-git --noconfirm
yay -S satty --noconfirm
yay -S simple-mtpfs --noconfirm
yay -S subliminal --noconfirm
yay -S subliminal-git --noconfirm
yay -S swaylock-effects --noconfirm
yay -S swaync --noconfirm
yay -S swww --noconfirm
yay -S system-config-printer --noconfirm
yay -S timeshift --noconfirm
yay -S tlp --noconfirm
yay -S trashy --noconfirm
yay -S tree --noconfirm
yay -S ttf-jetbrains-mono-nerd --noconfirm
yay -S ttf-meslo-nerd --noconfirm
yay -S ttf-ms-win11-auto --noconfirm
yay -S ttf-roboto --noconfirm
yay -S udiskie --noconfirm
yay -S ufw --noconfirm
yay -S unrar --noconfirm
yay -S unzip --noconfirm
yay -S uwsm --noconfirm
yay -S veracrypt --noconfirm
yay -S waybar --noconfirm
yay -S waypaper-git --noconfirm
yay -S wev --noconfirm
yay -S wf-recorder --noconfirm
yay -S wl-clipboard --noconfirm
yay -S wlsunset --noconfirm
yay -S woff2-font-awesome --noconfirm
yay -S xdg-desktop-portal-gtk --noconfirm
yay -S xdg-desktop-portal-hyprland --noconfirm
yay -S xdg-user-dirs --noconfirm
yay -S xidel-bin --noconfirm
yay -S xorg-xhost --noconfirm
yay -S yazi --noconfirm
yay -S ydotool --noconfirm
yay -S yt-dlp --noconfirm
yay -S zathura --noconfirm
yay -S zathura-cb --noconfirm
yay -S zathura-pdf-mupdf --noconfirm
yay -S zip --noconfirm
yay -S zoxide --noconfirm
yay -S zsh --noconfirm
# update file saving location
xdg-user-dirs-update

# services
sudo freshclam
sudo systemctl enable clamav-freshclam-once.timer
sudo systemctl enable tlp
sudo systemctl enable ufw
sudo ufw enable
sudo systemctl enable cronie
sudo updatedb
sudo systemctl enable reflector.timer
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# set default xdg
# Onlyoffice
# .odt, .doc, .docx, rtf
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.oasis.opendocument.text                                 # .odt
xdg-mime default onlyoffice-desktopeditors.desktop application/msword                                                      # .doc
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.document # .docx
xdg-mime default onlyoffice-desktopeditors.desktop application/rtf                                                         # .rtf

#.ods .xls, .xlsx
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.oasis.opendocument.spreadsheet
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-excel
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.openxmlformats-officedocument.spreadsheetml.sheet

# .odp, .ppt, .pptx
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.oasis.opendocument.presentation
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.ms-powerpoint
xdg-mime default onlyoffice-desktopeditors.desktop application/vnd.openxmlformats-officedocument.presentationml.presentation

# Browser xdg
xdg-mime default firefox.desktop c-scheme-handler/http

# složky
sudo mkdir /mnt/Disk2 && sudo chown $USER:$USER /mnt/Disk2
sudo mkdir /mnt/android && sudo chown $USER:$USER /mnt/android
mkdir .themes && mkdir .icons

# Yazi chmod plugin
ya pack -a yazi-rs/plugins#chmod

# Yazi archive plugin
ya pack -a KKV9/compress

# Yazi mount plugin
ya pack -a yazi-rs/plugins:mount

# yazi ouch archives
ya pack -a ndtoan96/ouch

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
