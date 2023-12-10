_default:
  @just --list

serve:
  mkdocs serve

build-favicon:
  gm convert -size 128x128 xc:#7e56c2 temp_bg.png
  gm convert -background none -size 96x96 docs/images/music-box-multiple-outline.svg -negate temp_fg.png
  gm composite -gravity center temp_fg.png temp_bg.png temp.png
  convert temp.png -define icon:auto-resize="64,48,32,16" docs/favicon.ico
  rm temp*

install-deps:
  brew install imagemagick graphicsmagick mkdocs

build-logo:
  gm convert -background none -size 128x128 docs/images/music-box-multiple-outline.svg -negate docs/images/logo.png
  convert docs/images/logo.png -fill "#7e56c2" -colorize 100% docs/images/logo.png

# https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain-and-the-www-subdomain-variant
