#!/bin/bash
#Automatic buildscript for Nextcloud apps
#Made by @OliverParoczai
#Requires git, xmlstarlet, tar, and optionally openssl

REPOURL="https://github.com/simo-bimo/nextcloud-hide-user-emails.git" #official repo, change if forked
SIGN=FALSE #Sign the file for uploading to the official appstore
SIGNCERT=~/.nextcloud/certificates/hideuseremails.key #The location of the key

mkdir tmp

echo "Cloning $REPOURL"
git clone -q $REPOURL tmp/hideuseremails/
VERSION=$(xmlstarlet sel -T -t -m '//info/version' -v . -n tmp/hideuseremails/appinfo/info.xml)
echo "Version is ${VERSION}"

echo "Starting compression"
tar --exclude='code' --exclude='differences.png' --exclude=".git" -czf hideuseremails-v${VERSION}.tar.gz -C tmp hideuseremails/

rm -rf tmp

if [ $SIGN ]; then
	echo ""
	echo "The signature:"
	echo ""
	openssl dgst -sha512 -sign $SIGNCERT hideuseremails-v${VERSION}.tar.gz | openssl base64
	echo ""
fi
