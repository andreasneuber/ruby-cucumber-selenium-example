Before do |scenario|
  # Initialize browser for each scenario to avoid test pollution
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
    options.add_argument('--log-level=3')
    options.exclude_switches << 'enable-logging'
    browser = Selenium::WebDriver.for :chrome, options: options
  when 'firefox_headless'
    options = Selenium::WebDriver::Firefox::Options.new
    options.add_argument('-headless')
    browser = Selenium::WebDriver.for :firefox, options: options
  else
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--log-level=3')
    options.exclude_switches << 'enable-logging'
    browser = Selenium::WebDriver.for :chrome, options: options
  end

  @driver = browser
  
  # Initialize all page objects once per scenario
  @login_page = LoginPage.new browser
  @user_account_page = UserAccountPage.new browser
  @employee_page = EmployeePage.new browser
  @sales_page = SalesPage.new browser
  @celsius_to_fahrenheit_page = CelsiusToFahrenheitPage.new browser
  @credit_card_entry_page = CreditCardEntryPage.new browser
  @credit_card_response_page = CreditCardResponsePage.new browser
  @provide_your_details_page = ProvideYourDetailsPage.new browser
  @thank_you_page = ThankYouPage.new browser
end

After do |scenario|
  # Capture screenshot on failure for debugging
  if scenario.failed? && @driver
    timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
    screenshot_name = "failure_#{scenario.name.gsub(/\s+/, '_')}_#{timestamp}.png"
    screenshot_path = File.join('reports', screenshot_name)
    
    begin
      @driver.save_screenshot(screenshot_path)
      puts "Screenshot saved: #{screenshot_path}"
      
      # Embed screenshot in HTML report
      embed(screenshot_path, 'image/png', 'Failure Screenshot')
    rescue => e
      puts "Failed to capture screenshot: #{e.message}"
    end
  end
  
  # Close browser after each scenario to ensure clean state
  if @driver
    @driver.quit
  end
end