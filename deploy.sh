#!/bin/sh
set -e # Exit immediately if a command fails

echo "=============================================================="
echo " Checking Node.js & NPM version..."
echo "=============================================================="
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

echo "=============================================================="
echo " Installing Hexo & NPM modules..."
echo "=============================================================="
npm install --silent
npm install hexo-cli -g

generate_theme() {
    THEME=$1
    URL=$2
    SIDEBAR=$3

    echo "=============================================================="
    echo " Generating content for $THEME..."
    echo "=============================================================="
    hexo config url "$URL"
    hexo config theme_config.scheme "$THEME"
    hexo config theme_config.sidebar.position "$SIDEBAR"
    hexo clean && hexo generate

    if [ -d public ]; then
        mv -v public "$THEME"
    else
        echo "Error: 'public' directory does not exist for $THEME"
        exit 1
    fi
}

# Generate themes
generate_theme Muse https://theme-next.js.org/muse right
generate_theme Mist https://theme-next.js.org/mist right
generate_theme Pisces https://theme-next.js.org/pisces left

echo "=============================================================="
echo " Preparing content for Gemini..."
echo "=============================================================="
hexo config url https://theme-next.js.org
hexo config theme_config.scheme Gemini
hexo clean && hexo generate

echo "=============================================================="
echo " Moving all themes to public directory..."
echo "=============================================================="
mkdir -p public
mv -v Muse Mist Pisces public

echo "=============================================================="
echo " Adding robots.txt to public directory..."
echo "=============================================================="
echo "User-agent: *
Disallow: /page/*/
Disallow: /archives/*
Disallow: /muse/*
Disallow: /mist/*
Disallow: /pisces/*
Host: https://theme-next.js.org" > public/robots.txt

echo "=============================================================="
echo " Done. Ready for deployment!"
echo "=============================================================="
