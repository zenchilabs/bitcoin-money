require 'btc'

describe Btc do

  describe '#new' do
    it 'should initialize okay' do
      b = Btc.new(12345)
      expect(b.btc).to eq(BigDecimal.new('12345.0'))
    end

    it 'should throw error if invalid btc amount' do
      expect{ Btc.new(0.00000000000001) }.to raise_error(ArgumentError)
    end
  end

  describe '.from_mbtc' do
    it 'should throw error if invalid mbtc amount' do
      expect{ Btc.from_mbtc(Btc::SATOSHI) }.to raise_error(ArgumentError)
    end
  end

  describe '.from_ubtc' do
    it 'should throw error if invalid ubtc amount' do
      expect{ Btc.from_ubtc(Btc::MIN_UBTC - 10) }.to raise_error(ArgumentError)
    end
  end

  describe '.from_satoshis' do
    it 'should throw error if invalid satoshi amount' do
      expect{ Btc.from_satoshis(-1) }.to raise_error(ArgumentError)
    end
  end

  it 'should convert btc to mbtc and back' do
    expect(Btc.new(Btc::MBTC.to_f).mbtc).to eq(BigDecimal.new('1'))
    expect(Btc.from_mbtc(1).btc).to eq(BigDecimal.new(Btc::MBTC))
  end

  it 'should convert btc to satoshis and back' do
    expect(Btc.new(Btc::SATOSHI).satoshis).to eq(BigDecimal.new('1'))
    expect(Btc.from_satoshis(1).btc).to eq(BigDecimal.new(Btc::SATOSHI))
  end

  it 'should convert mbtc to satoshis and back' do
    expect(Btc.from_mbtc(1).satoshis).to eq(BigDecimal.new('100000'))
    expect(Btc.from_satoshis(10000).mbtc).to eq(BigDecimal.new('0.1'))
  end

  it 'should convert btc to ubtc and back' do
    expect(Btc.new(1).ubtc).to eq(BigDecimal.new('1000000'))
    expect(Btc.from_ubtc(12).btc).to eq(BigDecimal('.000012'))
  end

  it 'should use equality correctly' do
    expect(Btc.new(0.123)).to eq(Btc.from_mbtc(123))
    expect(Btc.new(0.123)).to eq(Btc.from_satoshis(12300000))
    expect(Btc.from_mbtc(12)).to eq(Btc.from_satoshis(1200000))
  end

  it 'should use multiplication correctly' do
    expect(Btc.new(0.1234) * Btc.new(0.1234)).to eq(Btc.new(BigDecimal.new('0.1234') * BigDecimal.new('0.1234')))
  end

  it 'should use division correctly' do
    expect(Btc.new(0.1234) / Btc.new(0.1234)).to eq(Btc.new(BigDecimal.new('0.1234') / BigDecimal.new('0.1234')))
  end

  it 'should use addition correctly' do
    expect(Btc.new(0.1234) + Btc.new(0.1234)).to eq(Btc.new(BigDecimal.new('0.1234') + BigDecimal.new('0.1234')))
  end

  it 'should use subtraction correctly' do
    expect(Btc.new(0.1234) - Btc.new(0.1234)).to eq(Btc.new(BigDecimal.new('0.1234') - BigDecimal.new('0.1234')))
  end
end
