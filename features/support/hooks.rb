case BROWSER
when 'firefox'
  browser = Selenium::WebDriver.for :firefox
when 'edge'
  browser = Selenium::WebDriver.for :edge
when 'chrome_headless'
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized')
  options.add_argument('--no-sandbox')
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  browser = Selenium::WebDriver.for :chrome, options: options
when 'firefox_headless'
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('-headless')
  browser = Selenium::WebDriver.for :firefox, options: options
else
  browser = Selenium::WebDriver.for :chrome
end


Before do |scenario|
  DRIVER = browser

  LOGIN_PAGE = LoginPage.new browser
end

After do |scenario|
end

at_exit do
  browser.close
end