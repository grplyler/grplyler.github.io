#!/bin/bash

echo "Building..."
jekyll build
echo "Done."

echo "Publishing to hqlocal..."
rsync -a \
-e "ssh -l root -p 22003" \
--exclude=".*" \
--chown www-data:root \
./_site/ 192.168.1.103:/var/www/

echo "Done."
