CSS := "docs/public/css"
JS := "docs/public/js"
ICO := "docs/public/ico"
TTF := "docs/public/ttf"

_default:
  @just -f web.just --list

_build-font-nerd:
  mkdir -p {{TTF}}/nerd-font
  cd {{TTF}} && curl -o nerd-font.css https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/css/nerd-fonts-generated.css
  cd {{TTF}}/nerd-font && curl -o nerd-font.ttf https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFontMono-Regular.ttf
  cd {{TTF}} && sed -i.bak -E 's|url\(.*\) format\(.*\)|url("nerd-font/nerd-font.ttf") format("truetype")|g' nerd-font.css && rm *.bak
  cd {{TTF}} && cat nerd-font.css | tr '\n' '~' | sed 's|{~|{ |g' | sed 's|~}| }|g' | sed 's|\t|  |g' | sed 's|  | |g' | sed 's|  | |g' | tr '~' '\n' > temp.css && mv temp.css nerd-font.css

build-icon NF='nf-md-music_box_multiple_outline' FG='#ffffff' BG='#7e56c2': _build-font-nerd
  mkdir -p {{ICO}}

  # Match "obsessive" from https://favicomatic.com/
  echo '<link rel="shortcut icon" href="{{ICO}}/favicon.ico">' > {{ICO}}/favicon.html
  echo '<link rel="icon" sizes="32x32" href="{{ICO}}/favicon-32x32.png" />' >> {{ICO}}/favicon.html
  echo '<link rel="icon" sizes="16x16" href="{{ICO}}/favicon-16x16.png" />' >> {{ICO}}/favicon.html
  echo '<link rel="apple-touch-icon-precomposed" sizes="57x57" href="{{ICO}}/apple-touch-icon-57x57.png" />' >> {{ICO}}/favicon.html
  echo '<link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{ICO}}/apple-touch-icon-72x72.png" />' >> {{ICO}}/favicon.html
  echo '<link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{ICO}}/apple-touch-icon-114x114.png" />' >> {{ICO}}/favicon.html
  echo '<link rel="apple-touch-icon-precomposed" sizes="120x120" href="{{ICO}}/apple-touch-icon-120x120.png" />' >> {{ICO}}/favicon.html
  echo '<link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{ICO}}/apple-touch-icon-144x144.png" />' >> {{ICO}}/favicon.html
  echo '<link rel="apple-touch-icon-precomposed" sizes="152x152" href="{{ICO}}/apple-touch-icon-152x152.png" />' >> {{ICO}}/favicon.html
  echo '<meta name="msapplication-TileColor" content="{{BG}}" />' >> {{ICO}}/favicon.html
  echo '<meta name="msapplication-TileImage" content="{{ICO}}/mstile-144x144.png" />' >> {{ICO}}/favicon.html

  @just -f web.just _build-icon-symbol {{NF}} {{TTF}}/nerd-font.css
  @just -f web.just _build-icon-touch $(cat temp-symbol.txt) '{{FG}}' '{{BG}}' {{TTF}}/nerd-font/nerd-font.ttf
  @just -f web.just _build-icon-fav $(cat temp-symbol.txt) '{{FG}}' '{{BG}}' {{TTF}}/nerd-font/nerd-font.ttf
  @just -f web.just _build-icon-tile $(cat temp-symbol.txt) '{{FG}}' '{{BG}}' {{TTF}}/nerd-font/nerd-font.ttf

  rm temp-*.*

_build-icon-symbol SYMBOLNAME CSSFILE:
  perl -MHTML::Entities -CS -ne '/\.{{SYMBOLNAME}}:before { content: "\\([^"]+)"/ and print chr(hex($1))' {{CSSFILE}} > temp-symbol.txt

_build-icon-touch SYMBOL FG BG TTFFILE:
  magick -background none -fill '{{FG}}' -font {{TTFFILE}} -pointsize 768 label:"{{SYMBOL}}" temp-symbol.png
  magick -size 1024x1024 xc:'{{BG}}' temp-background.png
  magick temp-background.png temp-symbol.png -gravity center -composite temp-touch.png
  magick temp-touch.png -resize 57x57 -filter point {{ICO}}/apple-touch-icon-57x57.png
  magick temp-touch.png -resize 72x72 -filter point {{ICO}}/apple-touch-icon-72x72.png
  magick temp-touch.png -resize 114x114 -filter point {{ICO}}/apple-touch-icon-114x114.png
  magick temp-touch.png -resize 120x120 -filter point {{ICO}}/apple-touch-icon-120x120.png
  magick temp-touch.png -resize 144x144 -filter point {{ICO}}/apple-touch-icon-144x144.png
  magick temp-touch.png -resize 152x152 -filter point {{ICO}}/apple-touch-icon-152x152.png

_build-icon-fav SYMBOL FG BG TTFFILE:
  magick -background none -fill '{{FG}}' -font {{TTFFILE}} -pointsize 576 label:"{{SYMBOL}}" temp-symbol.png
  magick -size 1024x1024 xc:none -fill '{{BG}}' -draw "circle 512,512 512,64" temp-background.png
  magick temp-background.png temp-symbol.png -gravity center -composite temp-favicon.png
  magick temp-favicon.png -resize 16x16 -filter point {{ICO}}/favicon-16x16.png
  magick temp-favicon.png -resize 32x32 -filter point {{ICO}}/favicon-32x32.png
  magick temp-favicon.png -resize 120x120 -filter point {{ICO}}/favicon-120x120.png
  magick temp-favicon.png -define icon:auto-resize=64,48,32,16 {{ICO}}/favicon.ico

_build-icon-tile SYMBOL FG BG TTFFILE:
  magick -background none -fill '{{FG}}' -font {{TTFFILE}} -pointsize 108 label:"{{SYMBOL}}" temp-symbol.png
  magick -size 144x144 xc:none temp-background.png
  magick temp-background.png temp-symbol.png -colorspace RGB -gravity center -composite {{ICO}}/mstile-144x144.png
