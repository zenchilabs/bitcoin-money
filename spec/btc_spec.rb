require 'btc'

describe Btc do

  it 'should initialize okay' do
    b = Btc.new(12345)
    expect(b.btc).to eq(BigDecimal.new('12345.0'))
  end
end