**What do these tests do?**
---------------------------
These tests use Recurly's ruby client library to create a customer account,
then verify that the account was created.

**How do I run these tests?**
------------------------------
1. Get **ruby** from https://www.ruby-lang.org/en/downloads/
2. Get **bundler** by typing this on your CLI: `gem install bundler`
3. cd to the root directory of this project
4. type `bundle install`
5. Finally, type `bundle exec ruby create_account.rb`