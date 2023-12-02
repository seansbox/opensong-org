_default:
  @just --list

favicon:
  convert -size 128x128 canvas:#7e56c2 temp_bg.png
  convert docs/images/music-box-multiple-outline.png -resize 96x96 temp_fg.png
  convert temp_bg.png temp_fg.png -gravity center -composite temp.png
  convert temp.png -define icon:auto-resize="64,48,32,16" docs/favicon.ico
  rm temp*

logo:
  convert docs/images/music-box-multiple-outline.png -fill "#7e56c2" -colorize 100% docs/images/logo.png
