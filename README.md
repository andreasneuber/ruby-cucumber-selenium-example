#  ruby-cucumber-selenium-framework
Example of using Ruby with Cucumber and Selenium WebDriver for automated UI tests.

## Application under test
The feature files, step definitions and page objects were written for https://github.com/andreasneuber/automatic-test-sample-site.
Readme in that repo has further details how to set it up.

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

## Run tests locally

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

## Run all tests locally, create HTML report
`export now=$(date +"%Y-%m-%d_%H-%M-%S") && cucumber -f pretty -f html -o reports/$now.report.html`

Report will appear in directory `reports` where it can be opened in a browser.
