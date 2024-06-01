CD_VERSION=$(curl -s https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_STABLE)
curl -L https://storage.googleapis.com/chrome-for-testing-public/$CD_VERSION/win64/chromedriver-win64.zip > chromedriver.zip

touch "${CD_VERSION}.txt"

unzip chromedriver.zip
cp -f chromedriver-win64/chromedriver.exe chromedriver.exe
rm -rf chromedriver-win64 chromedriver.zip