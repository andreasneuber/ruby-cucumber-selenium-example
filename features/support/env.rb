require 'selenium-webdriver'

BASE_URL = ENV['BASE_URL'] || 'http://localhost:8000/index.php'

BROWSER = ENV['BROWSER'] || 'chrome'
# Supported browsers: chrome, chrome_headless, firefox, firefox_headless, edge, safari