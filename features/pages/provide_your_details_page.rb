require 'selenium-webdriver'

class ProvideYourDetailsPage

  def initialize(driver)
    @driver = driver
    @url = '?action=form1'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  # @FindBy(how = How.XPATH, using = "//h2[contains(text(),'Form 1 - Information about yourself')]")
  # public WebElement titleForm;

  def provide_first_name(first_name)
    element = @driver.find_element(id: 'fname')
    element.send_keys first_name
  end

  def provide_last_name(last_name)
    element = @driver.find_element(id: 'lname')
    element.send_keys last_name
  end

  def provide_street(street)
    element = @driver.find_element(id: 'street')
    element.send_keys street
  end

  def provide_city(city)
    element = @driver.find_element(id: 'city')
    element.send_keys city
  end

  def provide_zip(zip_code)
    element = @driver.find_element(id: 'zip')
    element.send_keys zip_code
  end

  def provide_state(state)
    element = @driver.find_element(id: 'state')
    element.send_keys state
  end

  def provide_country(country)
    element = @driver.find_element(id: 'country')
    element.send_keys country
  end

  def provide_mobile_phone_number(number)
    element = @driver.find_element(id: 'mobile')
    element.send_keys number
  end

  def provide_home_phone_number(number)
    element = @driver.find_element(id: 'home')
    element.send_keys number
  end

  def provide_email(email)
    element = @driver.find_element(id: 'email')
    element.send_keys email
  end

  def click_submit_your_information
    element = @driver.find_element(id: 'submit-info')
    element.click
  end

end