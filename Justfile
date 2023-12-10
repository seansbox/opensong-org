_default:
  @just --list

serve:
  mkdocs serve

build-icon:
  @just -f web.just build-icon
  cp docs/public/ico/favicon.ico docs/

install-deps:
  brew install imagemagick mkdocs

# https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain-and-the-www-subdomain-variant
