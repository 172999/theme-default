#! /bin/bash

# Cleanup folder
rm -rf _assets

# Recreate folder
mkdir -p _assets/website/
mkdir -p _assets/ebook/

# Compile JS
browserify src/js/main.js | uglifyjs -mc > _assets/website/app.js

# Compile Website CSS
lessc src/less/website.less _assets/website/style.css

# Compile eBook CSS
lessc src/less/ebook.less _assets/ebook/ebook.css
lessc src/less/pdf.less _assets/ebook/pdf.css
lessc src/less/mobi.less _assets/ebook/mobi.css
lessc src/less/epub.less _assets/ebook/epub.css

# Copy fonts
mkdir -p _assets/website/fonts
cp -R node_modules/font-awesome/fonts/ _assets/website/fonts/fontawesome/

# Copy icons
mkdir -p _assets/website/images
cp node_modules/gitbook-logos/output/favicon.ico _assets/website/images/
cp node_modules/gitbook-logos/output/apple-touch-icon-152.png _assets/website/images/apple-touch-icon-precomposed-152.png