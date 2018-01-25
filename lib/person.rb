class Person
  attr_accessor :name, :cash

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = cash
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
end
