#!/bin/bash

echo "Building..."
jekyll build
echo "Done."

echo "Publishing Locally..."
rsync -a \
--exclude=".*" \
--exclude="publish.sh" \
./_site/ ../grplyler.github.io/
echo "Done."

echo "Publishing to hqlocal..."
rsync -a \
-e "ssh -l root -p 22003" \
--exclude=".*" \
--exclude="publish.sh" \
--chown www-data:root \
../grplyler.github.io/ 192.168.1.103:/var/www/
echo "Done."

echo "Publishing to github.io..."
cd ../grplyler.github.io
git add --all
git commit
git push origin master
echo "Done."
