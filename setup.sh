#!/bin/bash

sudo pacman -S base-devel --noconfirm

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

# sed stuff
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
sudo sed -i 's/#AutoEnable=true/AutoEnable=false/' /etc/bluetooth/main.conf
sudo pacman -Syu --noconfirm

# basic files
mkdir -p ~/.local && mkdir ~/.local/bin/

mv ~/.config/Obrázky .
mv ~/.config/zshrc ~/.zshrc
mv ~/.config/zshenv ~/.zshenv
mv ~/.config/rofi-power-menu ~/.local/bin
mv ~/.config/themes ~/.themes
mv ~/.config/icons ~/.icons

# EFI shell to systemd-boot
# install programs
# update file saving location

xdg-user-dirs-update

yay -S adobe-source-han-sans-cn-fonts \
  adobe-source-han-sans-jp-fonts \
  adobe-source-han-sans-kr-fonts \
  adwaita-fonts \
  atool \
  awww \
  bat \
  bluetui \
  breeze \
  brightnessctl \
  calcurse \
  caligula \
  cantarell-fonts \
  clamtk \
  clipse \
  clipse-gui \
  cronie \
  cups \
  downgrade \
  dysk \
  edk2-shell \
  fastfetch \
  firefox \
  fzf \
  gdu \
  gparted \
  grimblast-git \
  gst-plugins-good \
  gvfs \
  htop \
  hyprcursor \
  hypridle \
  hyprland \
  hyprland-qtutils \
  hyprlock \
  hyprpicker \
  imagemagick \
  kitty \
  libreoffice-still \
  libreoffice-still-cs \
  limine-mkinitcpio-hook \
  localsend \
  lxqt-policykit \
  lynx \
  man-db \
  mediainfo \
  mpv \
  mpv-mpris \
  ncspot-git \
  neovim \
  newsboat \
  noto-fonts-emoji \
  ntfs-3g \
  nwg-look \
  ouch \
  paccache-hook \
  perl-image-exiftool \
  pulsemixer \
  python-ffsubsync \
  python-ffsubsync-venv \
  python-pipx \
  qimgv-git \
  qt5-wayland \
  qt5ct \
  qt6-wayland \
  qt6ct \
  reflector \
  rofi \
  rofi-calc-git \
  simple-mtpfs \
  subliminal-git \
  mako \
  system-config-printer \
  timeshift \
  tlp \
  tlpui \
  topgrade \
  trashy \
  tree \
  ttf-jetbrains-mono-nerd \
  ttf-meslo-nerd \
  ttf-ms-win11-auto \
  ttf-roboto \
  udiskie \
  ufw \
  unrar \
  unzip \
  uwsm \
  veracrypt \
  waybar \
  waypaper-git \
  wev \
  wf-recorder \
  wl-clipboard \
  hyprsunset \
  woff2-font-awesome \
  xdg-desktop-portal-gtk \
  xdg-desktop-portal-hyprland \
  xdg-user-dirs \
  xidel-bin \
  xorg-xhost \
  yazi \
  ydotool \
  yt-dlp \
  zathura \
  zathura-cb \
  zathura-pdf-mupdf \
  zip \
  zoxide \
  zsh --noconfirm

# services
sudo systemctl enable systemd-boot-update.service
sudo systemctl enable tlp
sudo systemctl enable ufw
sudo ufw enable
sudo systemctl enable cronie
sudo systemctl enable reflector.timer
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo cp /usr/share/edk2-shell/x64/Shell.efi /boot/shellx64.efi

# set default xdg
# Browser xdg
# Writer (text)
xdg-mime default libreoffice-writer.desktop application/vnd.oasis.opendocument.text
xdg-mime default libreoffice-writer.desktop application/vnd.oasis.opendocument.text-template
xdg-mime default libreoffice-writer.desktop application/msword
xdg-mime default libreoffice-writer.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.document
xdg-mime default libreoffice-writer.desktop application/rtf
xdg-mime default libreoffice-writer.desktop text/rtf

# Calc (spreadsheets)
xdg-mime default libreoffice-calc.desktop application/vnd.oasis.opendocument.spreadsheet
xdg-mime default libreoffice-calc.desktop application/vnd.oasis.opendocument.spreadsheet-template
xdg-mime default libreoffice-calc.desktop application/vnd.ms-excel
xdg-mime default libreoffice-calc.desktop application/vnd.openxmlformats-officedocument.spreadsheetml.sheet

# Impress (presentations)
xdg-mime default libreoffice-impress.desktop application/vnd.oasis.opendocument.presentation
xdg-mime default libreoffice-impress.desktop application/vnd.oasis.opendocument.presentation-template
xdg-mime default libreoffice-impress.desktop application/vnd.ms-powerpoint
xdg-mime default libreoffice-impress.desktop application/vnd.openxmlformats-officedocument.presentationml.presentation

# Draw (graphics)
xdg-mime default libreoffice-draw.desktop application/vnd.oasis.opendocument.graphics

# Math (formula)
xdg-mime default libreoffice-math.desktop application/vnd.oasis.opendocument.formula

# Browser
xdg-mime default firefox.desktop x-scheme-handler/http

# složky
sudo mkdir /mnt/Disk2 && sudo chown $USER:$USER /mnt/Disk2
sudo mkdir /mnt/phone && sudo chown $USER:$USER /mnt/phone

# Yazi chmod plugin
ya pack -a yazi-rs/plugins#chmod

# Yazi archive plugin
ya pack -a KKV9/compress

# Yazi mount plugin
ya pack -a yazi-rs/plugins#mount

# yazi ouch archives
ya pack -a ndtoan96/ouch

# Oh my zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
