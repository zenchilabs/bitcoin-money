require 'bigdecimal'

class Btc
  SATOSHI = BigDecimal.new('0.00000001')
  MBTC = BigDecimal.new('0.0001')
  BTC = BigDecimal.new('1.0')

  def initialize(amt)
    raise ArgumentError, 'BTC amount must not be less than 0.00000001' unless Btc.valid_btc(amt)
    @amt = BigDecimal.new(amt.to_f.to_s)
  end

  def self.from_mbtc(amt)
    raise ArgumentError, 'mBTC amount must not be less than 0.00001' unless Btc.valid_mbtc(amt)
    Btc.new(BigDecimal.new(amt.to_f.to_s) * MBTC)
  end

  def self.from_satoshis(amt)
    raise ArgumentError, 'Satoshi amount must be > 1 or 0' unless Btc.valid_satoshis(amt)
    Btc.new(BigDecimal.new(amt.to_i.to_f.to_s) * SATOSHI)
  end

  def self.valid_satoshis(amt)
    amt.to_i >= 0
  end

  def self.valid_mbtc(amt)
    amt.to_f >= MBTC.to_f || amt.to_f == 0
  end

  def self.valid_btc(amt)
    amt.to_f >= SATOSHI.to_f || amt.to_f == 0
  end

  def btc
    @amt
  end

  def mbtc
    @amt / MBTC
  end

  def satoshis
    @amt / SATOSHI
  end

  def +(other)
    Btc.new(@amt + other.btc)
  end

  def /(other)
    Btc.new(@amt / other.btc)
  end

  def -(other)
    Btc.new(@amt - other.btc)
  end

  def *(other)
    Btc.new(@amt * other.btc)
  end

  def ==(other)
    @amt == other.btc
  end

  def inspect
    "#<Btc BTC:#{btc} mBTC:#{mbtc} satoshis:#{satoshis}>"
  end
end