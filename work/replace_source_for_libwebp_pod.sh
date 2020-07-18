#!/bin/sh

FOLDER=~/.cocoapods/repos/master/Specs/1/9/2/libwebp
echo $FOLDER
for subfolder in `ls $FOLDER`
do
  jsonfile=$FOLDER/$subfolder/libwebp.podspec.json
  gsed -i 's/https:\/\/chromium.googlesource.com\/webm\/libwebp/https:\/\/github\.com\/webmproject\/libwebp\.git/g' $jsonfile
done

