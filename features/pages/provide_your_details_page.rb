require 'selenium-webdriver'
require_relative 'base_page'

class ProvideYourDetailsPage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=form1'
  end

  def provide_first_name(first_name)
    type_into(:id, 'fname', first_name)
  end

  def provide_last_name(last_name)
    type_into(:id, 'lname', last_name)
  end

  def provide_street(street)
    type_into(:id, 'street', street)
  end

  def provide_city(city)
    type_into(:id, 'city', city)
  end

  def provide_zip(zip_code)
    type_into(:id, 'zip', zip_code)
  end

  def provide_state(state)
    type_into(:id, 'state', state)
  end

  def provide_country(country)
    type_into(:id, 'country', country)
  end

  def provide_mobile_phone_number(number)
    type_into(:id, 'mobile', number)
  end

  def provide_home_phone_number(number)
    type_into(:id, 'home', number)
  end

  def provide_email(email)
    type_into(:id, 'email', email)
  end

  def click_submit_your_information
    click_element(:id, 'submit-info')
  end

end