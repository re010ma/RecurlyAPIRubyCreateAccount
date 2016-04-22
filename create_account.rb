require 'rubygems'
require 'recurly'
require 'openssl/ssl'

class CreateAccount

  def initialize()
    #Workaround for Windows ruby OpenSSL issue
    Recurly::API.net_http = {
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ca_file     => "cacert.pem"
    }

    Recurly.subdomain      = 'apitest'
    Recurly.api_key        = 'e9cb2dc0714841a3839768efcbf193a5'
    Recurly.default_currency = 'USD'
  end

  def create_account(account_code)
    print("Create account test-    ")
    begin
      account = Recurly::Account.create(
          :account_code => account_code,
          :email        => "#{account_code}@yahoo.com",
          :first_name   => 'Edgar',
          :last_name    => 'Poe'
      )
    rescue Recurly::API::NotFound => api_err
      puts api_err.message
    rescue Recurly::Resource::Invalid => resource_err
      puts resource_err.record.errors
    end
    http_response = account.response.inspect
    if http_response.include? '201 Created'
      puts("PASS")
    else
      puts("FAIL: Could not create account.")
      puts("Response was #{http_response}")
    end

  end

  def verify_account(account_code)
    print("Find/verify account test-    ")
    begin
      account = Recurly::Account.find(account_code)
    rescue Recurly::Resource::NotFound => e
      puts("FAIL: #{e.message}")
      return
    end
    puts("PASS")
  end
end

my_account = CreateAccount.new
unique_number = Time.now.to_i
puts "Creating an account with account code: #{unique_number}"
my_account.create_account(unique_number)
my_account.verify_account(unique_number)