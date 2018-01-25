require './lib/person.rb'
require './lib/atm.rb'
require './lib/account.rb'

describe Person do
  subject { described_class.new(name: 'T&T') }

  it 'Is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end
end
