# account.rb
require 'date'

class Account
  attr_accessor :account_status, :owner, :balance
  attr_reader :pin_code, :exp_date

  STANDARD_VALIDITY_YRS = 5

  def initialize(attrs = {})
    @pin_code = generate_pin
    @account_status = :active
    @exp_date = exp_date
    set_owner(attrs[:owner])
    @balance = 0
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def generate_pin
    rand(1000..9999)
  end

  def exp_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end
end
