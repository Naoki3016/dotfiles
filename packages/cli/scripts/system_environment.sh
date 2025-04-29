#!/bin/bash
echo "[`date '+%Y-%m-%d %H:%M:%S'`] スクリプトを開始します"

# yabai と skhd のサービスを起動
/opt/homebrew/bin/yabai --start-service
/opt/homebrew/bin/skhd --start-service

# yabairc を実行
# source /Users/odanaoki/.config/yabai/.yabairc