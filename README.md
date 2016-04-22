**What do these tests do?**
---------------------------
These tests log into the Recurly App, navigate to the Account Summary page and
confirm that the correct number of accounts are being displayed.


**How do I run these tests?**
------------------------------
1. Get **ruby** from https://www.ruby-lang.org/en/downloads/
2. Get **bundler** by typing this on your CLI: `gem install bundler`
3. cd to the root directory of this project
4. type `bundle install`
5. Finally, type `bundle exec ruby create_account.rb`

**Other Stuff**
---------------
These tests use cucumber, capybara and rspec to do their work