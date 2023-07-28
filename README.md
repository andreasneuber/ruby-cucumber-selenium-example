#  ruby-cucumber-selenium-framework

This project is automation demo on Ruby with Cucumber and Selenium WebDriver.

## Project setup

1. On Windows install Ruby as outlined here: https://rubyinstaller.org/

2. Install also bundler: https://www.geeksforgeeks.org/how-to-install-ruby-bundler-on-windows/

3. Make sure ChromeDriver is installed on your system

4. Clone project

```
git clone https://github.com/andreasneuber/ruby-cucumber-selenium-framework.git
```

5. Install required dependencies

```shell
bundle install
```

6. Run tests locally

```shell
# all at once..
cucumber

# or

cucumber features/AdminPrivileges.feature

# or 

cucumber features/ConvertCelsius.feature

# or

cucumber features/Creditcard.feature

# or

cucumber features/Login.feature

# or

cucumber features/ProvideYourDetails.feature

# or

cucumber features/ConcurrentWindows.feature
```

## Reports
Creating a nice HTML report by using the built-in tools of Cucumber with some bash scripting:

`export now=$(date +"%Y-%m-%d_%H-%M-%S") && cucumber -f pretty -f html -o reports/$now.report.html`

Report will appear in directory `reports` where it can be opened in a browser.

