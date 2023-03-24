require 'selenium-webdriver'

class LoginPage

  def initialize(driver)
    @driver = driver
    @url = '?action=form4'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def provide_username(user_name)
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { @driver.find_element(name: 'user') }

    element = @driver.find_element(name: 'user')
    element.send_keys user_name
  end

  def provide_password(password)
    element = @driver.find_element(name: 'pw')
    element.send_keys password
  end

  def login(user_name, password)
    provide_username(user_name)
    provide_password(password)
  end

  def click_login
    element = @driver.find_element(name: 'Login')
    element.click
  end

end