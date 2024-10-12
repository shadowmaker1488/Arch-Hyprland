
#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */ 
# This script for selecting wallpapers (SUPER W)

# WALLPAPERS PATH
wallDIR="$HOME/Obrázky/Tapety"
thumbDIR="/tmp/"

# variables
="$HOME/.config/rofi/scripts"
focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
wddwjowdjdwojd

# swww transition config
FPS=60
TYPE="fade"
DURATION=2
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# Check if swaybg is running
if pidof swaybg > /dev/null; then
  pkill swaybg
fi

# Create thumbnails directory if it doesn't exist
mkdir -p "$thumbDIR"

# Generate thumbnail for GIF if not exists
generate_thumbnail() {
  local gif_file=$1
  local thumb_file="$thumbDIR/$(basename "${gif_file%.*}").png"
  if [[ ! -f "$thumb_file" ]]; then
    ffmpeg -y -i "$gif_file" -vf "thumbnail,scale=320:-1" -frames:v 1 "$thumb_file" > /dev/null 2>&1
  fi
  echo "$thumb_file"
}

# Retrieve image files and sort them
PICS=($(find "${wallDIR}" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \) | sort))

# Rofi command
rofi_command="rofi -i -show -dmenu -config ~/.config/rofi/scripts/config-wallpaper.rasi"

# Sorting Wallpapers
menu() {
  for pic_path in "${PICS[@]}"; do
    pic_name=$(basename "$pic_path")
    if [[ "$pic_name" == *.gif ]]; then
      thumb_path=$(generate_thumbnail "$pic_path")
      printf "%s\x00icon\x1f%s\n" "$pic_name" "$thumb_path"
    else
      printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
    fi
  done
}

# initiate swww if not running
swww query || swww-daemon --format xrgb

# Choice of wallpapers
main() {
  choice=$(menu | ${rofi_command})
  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # Random choice case
  if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
    RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
    swww img -o $focused_monitor "${RANDOM_PIC}" $SWWW_PARAMS
    exit 0
  fi

  # Find the index of the selected file
  pic_index=-1
  for i in "${!PICS[@]}"; do
    filename=$(basename "${PICS[$i]}")
    if [[ "$filename" == "$choice"* ]]; then
      pic_index=$i
      break
    fi
  done

  if [[ $pic_index -ne -1 ]]; then
    swww img -o $focused_monitor "${PICS[$pic_index]}" $SWWW_PARAMS
  else
    echo "Image not found."
    exit 1
  fi
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

main

sleep 0.5
${SCRIPTSDIR}/WallustSwww.sh
sleep 0.2
${SCRIPTSDIR}/Refresh.sh
