# account.rb
require 'date'

class Account
  attr_accessor :pin_code, :account_status

  STANDARD_VALIDITY_YRS = 5

  def initialize
    @pin_code = generate_pin
    @account_status = :active
    @exp_date = exp_date
  end

  def exp_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  private

  def generate_pin
    rand(1000..9999)
  end
end
