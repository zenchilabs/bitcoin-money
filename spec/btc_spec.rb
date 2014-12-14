require 'btc'

describe BTC do

  describe '#new' do
    it 'should initialize okay' do
      b = BTC.new(12345)
      expect(b.to_btc).to eq(BigDecimal.new('12345.0'))
    end

    it 'should throw error if invalid btc amount' do
      expect{ BTC.new(0.00000000000001) }.to raise_error(ArgumentError)
    end
  end

  describe '.from_mbtc' do
    it 'should throw error if invalid mbtc amount' do
      expect{ BTC.from_mbtc(BTC::SATOSHI) }.to raise_error(ArgumentError)
    end
  end

  describe '.from_bits' do
    it 'should throw error if invalid bit amount' do
      expect{ BTC.from_bits(BTC::MIN_BIT - 10) }.to raise_error(ArgumentError)
    end
  end

  describe '.from_satoshis' do
    it 'should throw error if invalid satoshi amount' do
      expect{ BTC.from_satoshis(-1) }.to raise_error(ArgumentError)
    end
  end

  it 'should convert btc to mbtc and back' do
    expect(BTC.new(BTC::MBTC.to_f).to_mbtc).to eq(BigDecimal.new('1'))
    expect(BTC.from_mbtc(1).to_btc).to eq(BigDecimal.new(BTC::MBTC))
  end

  it 'should convert btc to satoshis and back' do
    expect(BTC.new(BTC::SATOSHI).to_satoshis).to eq(BigDecimal.new('1'))
    expect(BTC.from_satoshis(1).to_btc).to eq(BigDecimal.new(BTC::SATOSHI))
  end

  it 'should convert mbtc to satoshis and back' do
    expect(BTC.from_mbtc(1).to_satoshis).to eq(BigDecimal.new('100000'))
    expect(BTC.from_satoshis(10000).to_mbtc).to eq(BigDecimal.new('0.1'))
  end

  it 'should convert btc to bit and back' do
    expect(BTC.new(1).to_bits).to eq(BigDecimal.new('1000000'))
    expect(BTC.from_bits(12).to_btc).to eq(BigDecimal('.000012'))
  end

  it 'should use equality correctly' do
    expect(BTC.new(0.123)).to eq(BTC.from_mbtc(123))
    expect(BTC.new(0.123)).to eq(BTC.from_satoshis(12300000))
    expect(BTC.from_mbtc(12)).to eq(BTC.from_satoshis(1200000))
  end

  it 'should use multiplication correctly' do
    expect(BTC.new(0.1234) * BTC.new(0.1234)).to eq(BTC.new(BigDecimal.new('0.1234') * BigDecimal.new('0.1234')))
  end

  it 'should use division correctly' do
    expect(BTC.new(0.1234) / BTC.new(0.1234)).to eq(BTC.new(BigDecimal.new('0.1234') / BigDecimal.new('0.1234')))
  end

  it 'should use addition correctly' do
    expect(BTC.new(0.1234) + BTC.new(0.1234)).to eq(BTC.new(BigDecimal.new('0.1234') + BigDecimal.new('0.1234')))
  end

  it 'should use subtraction correctly' do
    expect(BTC.new(0.1234) - BTC.new(0.1234)).to eq(BTC.new(BigDecimal.new('0.1234') - BigDecimal.new('0.1234')))
  end

  it 'should use to_f correctly' do
    expect(BTC.new(1.5).to_f).to eq(1.5)
  end

  it 'should use to_i correctly' do
    expect(BTC.new(1.4).to_i).to eq(1)
  end
end
