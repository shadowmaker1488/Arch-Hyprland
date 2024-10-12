#!/bin/bash

# Cesta k adresáři se styly
THEME_DIR="$HOME/.config/waybar/themes"

# Cílový soubor pro styl
TARGET_STYLE_FILE="$HOME/.config/waybar/style.css"

# Seznam dostupných stylů
themes=$(ls -1 $THEME_DIR)

# Výběr stylu pomocí rofi
selected_theme=$(echo "$themes" | rofi -dmenu -p "Vyber Waybar styl:")

# Zkontroluj, zda byl vybrán styl
if [ -z "$selected_theme" ]; then
  echo "Žádný styl nebyl vybrán."
  exit 1
fi

# Cesta k vybranému stylu
selected_style_file="$THEME_DIR/$selected_theme"

# Zkopíruj a přejmenuj vybraný styl
cp "$selected_style_file" "$TARGET_STYLE_FILE"

# Spusť skript pro restart Waybar
$HOME/.config/waybar/scripts/reload.sh
