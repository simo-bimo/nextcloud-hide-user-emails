#!/bin/bash
#Automatic buildscript for Nextcloud apps
#Made by @OliverParoczai
#Requires git, xmlstarlet, tar, and optionally openssl

REPOURL="https://github.com/simo-bimo/nextcloud-hide-user-emails.git" #official repo, change if forked
SIGN=FALSE #Sign the file for uploading to the official appstore
SIGNCERT=~/.nextcloud/certificates/hide-user-emails.key #The location of the key

mkdir tmp

echo "Cloning $REPOURL"
git clone -q $REPOURL tmp/hide-user-emails/
VERSION=$(xmlstarlet sel -T -t -m '//info/version' -v . -n tmp/hide-user-emails/appinfo/info.xml)
echo "Version is ${VERSION}"

echo "Starting compression"
tar --exclude='code' --exclude='differences.png' --exclude=".git" -czf hide-user-emails-v${VERSION}.tar.gz -C tmp hide-user-emails/

rm -rf tmp

if [ $SIGN ]; then
	echo ""
	echo "The signature:"
	echo ""
	openssl dgst -sha512 -sign $SIGNCERT hide-user-emails-v${VERSION}.tar.gz | openssl base64
	echo ""
fi
