#!/bin/sh
echo "=============================================================="
echo " Checking Node.js & NPM version..."
echo "=============================================================="
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

echo "=============================================================="
echo " Installing Hexo & NPM modules..."
echo "=============================================================="
npm install --silent

generate_theme() {
    THEME=$1
    URL=$2
    SIDEBAR=$3

    echo "=============================================================="
    echo " Generating content for $THEME..."
    echo "=============================================================="
    hexo config url $URL
    hexo config theme_config.scheme $THEME
    hexo config theme_config.sidebar.position $SIDEBAR
    hexo clean && hexo g
    mv -v public $THEME || { echo "Error moving public to $THEME"; exit 1; }
}

# Generate themes
generate_theme Muse https://theme-next.js.org/muse right
generate_theme Mist https://theme-next.js.org/mist right
generate_theme Pisces https://theme-next.js.org/pisces left

# Prepare Gemini
echo "=============================================================="
echo " Preparing content for Gemini..."
echo "=============================================================="
hexo config url https://theme-next.js.org
hexo config theme_config.scheme Gemini
hexo clean && hexo g

echo "=============================================================="
echo " Moving all themes to public directory..."
echo "=============================================================="
mv -v muse mist pisces -t public || { echo "Error moving themes to public"; exit 1; }

# Add robots.txt
echo "User-agent: *
Disallow: /page/*/
Disallow: /archives/*
Disallow: /muse/*
Disallow: /mist/*
Disallow: /pisces/*
Host: https://theme-next.js.org" > public/robots.txt

echo "=============================================================="
echo " Done. Beginning to deploy site..."
echo "=============================================================="
