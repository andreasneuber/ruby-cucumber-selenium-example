require 'selenium-webdriver'

BASE_URL = 'http://localhost:8000/index.php'

$VERBOSE = nil

Before do |scenario|

  # configure the driver to run in headless mode
  # options = Selenium::WebDriver::Chrome::Options.new
  # options.add_argument('--start-maximized')
  # options.add_argument('--no-sandbox')
  # options.add_argument('--headless')
  # options.add_argument('--disable-gpu')
  # $copy_of_driver_for_env = Selenium::WebDriver.for :chrome, options: options

  # For headed mode, good while developing tests
  $copy_of_driver_for_env = Selenium::WebDriver.for :chrome
  DRIVER = $copy_of_driver_for_env
end

After do |scenario|
  $copy_of_driver_for_env.close
  # if scenario.failed?
  #   timestamp = "#{Time.zone.now.strftime("%Y-%m-%d-%H:%M:%S")}"
  # end
end
