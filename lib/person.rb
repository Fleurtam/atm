class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = cash
    @account = account
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def set_name(obj)
    obj.nil? ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end

  def cash
    cash = 0
  end

  def account
    account = nil
  end
end
