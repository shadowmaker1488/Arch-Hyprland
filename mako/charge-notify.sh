#!/bin/bash

# Funkce, která přečte, jestli je kabel v zásuvce (1 = ano, 0 = ne)
# (Hledá složky začínající na AC nebo ADP, což pokrývá 99 % notebooků)
get_ac_status() {
  cat /sys/class/power_supply/AC*/online 2>/dev/null || cat /sys/class/power_supply/ADP*/online 2>/dev/null | head -n 1
}

PREV_STATUS=$(get_ac_status)

udevadm monitor --subsystem-match=power_supply | while read -r event; do
  if echo "$event" | grep -q "change"; then
    # Dáme subsystému chvilku na propis změny
    sleep 0.5

    STATUS=$(get_ac_status)

    # Ošetření, pokud by proměnná byla prázdná
    if [ -z "$STATUS" ]; then
      continue
    fi

    if [ "$STATUS" != "$PREV_STATUS" ]; then
      if [ "$STATUS" = "1" ]; then
        notify-send -u normal "Napájení" "Připojeno"
      elif [ "$STATUS" = "0" ]; then
        notify-send -u critical "Napájení" "Odpojeno"
      fi
      PREV_STATUS=$STATUS
    fi
  fi
done
