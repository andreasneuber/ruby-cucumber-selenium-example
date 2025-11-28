#  ruby-cucumber-selenium-example
Example of using Ruby with Cucumber and Selenium WebDriver for automated UI tests.

## Requirements

- **Ruby**: 3.0 or higher
- **Bundler**: 2.x
- **ChromeDriver**: Compatible with your installed Chrome version

## Application under test
The feature files, step definitions and page objects were written for https://github.com/andreasneuber/automatic-test-sample-site.
Readme in that repo has further details how to set it up.

## Project setup

1. **Install Ruby 3.0 or higher**
   - On Windows: Use RubyInstaller from https://rubyinstaller.org/ (download Ruby+Devkit version)
   - On macOS: `brew install ruby` or use rbenv/rvm
   - On Linux: Use your package manager or rbenv/rvm
   - Verify installation: `ruby --version`

2. **Install Bundler**

2. **Install Bundler**
   ```shell
   gem install bundler
   ```

3. **Install ChromeDriver**
   - Make sure ChromeDriver is installed on your system (see FAQ below for detailed instructions)

4. **Clone the repository**
   ```shell
   git clone https://github.com/andreasneuber/ruby-cucumber-selenium-framework.git
   cd ruby-cucumber-selenium-framework
   ```

5. **Install project dependencies**
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
Bash: 
`export now=$(date +"%Y-%m-%d_%H-%M-%S") && cucumber -f pretty -f html -o reports/$now.report.html`

PowerShell:
`$now = "reports/" + ((Get-Date).ToString('yyyy-MM-dd_hh-mm-ss') | Out-String).Trim() + ".report.html"; cucumber -f pretty -f html -o $now`


Report will appear in directory `reports` where it can be opened in a browser.

## Update Gem files
```shell
bundle update
```

## Code Quality

Run Rubocop to check code style:
```shell
bundle exec rubocop
```

Auto-fix issues:
```shell
bundle exec rubocop -A
```

## FAQ

### What Ruby version should I use?
This project requires Ruby 3.0 or higher. You can check your Ruby version with:
```shell
ruby --version
```

### How to install/update Chromedriver on Windows?
**Note**: The Chrome for Testing distribution is now the official way to download ChromeDriver.

1. Go to https://googlechromelabs.github.io/chrome-for-testing/ > Channel 'Stable'
2. Download the win32 or win64 version of ChromeDriver
3. Extract and save `chromedriver.exe` somewhere in your file system
4. Edit environment variables > System Variables > Path and add the path to your Chromedriver location
5. If necessary, restart your machine
6. Verify installation: `chromedriver --version` (should display the version number)

### How to switch to headless mode?
Please have a look at `features\support\env.rb`, lines 5 ff.

### Is there a Docker container which has the latest Chrome browser and Chrome driver?
Please have a look here: https://hub.docker.com/u/selenium > `selenium/standalone-chrome`