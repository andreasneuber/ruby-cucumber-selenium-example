#!/usr/bin/env bash

version=$(curl -s https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_STABLE)
wget -N https://storage.googleapis.com/chrome-for-testing-public/${version}/linux64/chromedriver-linux64.zip

unzip chromedriver-linux64.zip
chmod +x chromedriver-linux64/chromedriver
cp chromedriver-linux64/chromedriver /usr/local/bin

rm chromedriver-linux64.zip
rm -rf chromedriver-linux64
