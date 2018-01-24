require './lib/account.rb'

describe Account do

  it 'is expected to have a 4 digit pincode' do
    number = rand(1000..9999)
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end
end
