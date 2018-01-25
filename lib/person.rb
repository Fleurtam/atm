class Person
  attr_accessor :name

def initialize(options = { } )
    @name = options[:name]
  end
end
