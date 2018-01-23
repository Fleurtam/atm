class Atm
  require 'date'
  attr_accessor :funds

  def initialize
    @funds = 1000

  end


  def withdraw(amount, account)
    case

    when insuffient_funds_in_account?(amount, account)
      { status: false, message: 'insuffient funds', date: Date.today }
    when insufficient_funds_in_atm?(amount)
      { status: false, message: 'insufficient funds in ATM', date: Date.today }
    else
      perform_transaction(amount, account)
    end
  end

  private

  def insuffient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end
end
