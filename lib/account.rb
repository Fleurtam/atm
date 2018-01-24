class Account
attr_accessor :pin_code, :account_status

  def initialize
    @pin_code = generate_pin
    @account_status = :active
  end

  private
  def generate_pin
    rand(1000..9999)
  end



end
