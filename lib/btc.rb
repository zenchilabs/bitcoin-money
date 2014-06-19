require 'bigdecimal'

class Btc
  BTC = BigDecimal.new('1.0')
  MBTC = BigDecimal.new('0.001')
  UBTC = BigDecimal.new('0.000001')
  SATOSHI = BigDecimal.new('0.00000001')

  MIN_BTC = SATOSHI.to_f
  MIN_MBTC = 0.00001
  MIN_UBTC = 0.01
  MIN_SATOSHI = 1

  def initialize(amt)
    raise ArgumentError, "BTC amount must not be less than #{MIN_BTC}" unless Btc.valid_btc(amt)
    @amt = BigDecimal.new(amt.to_f.to_s)
  end

  def self.from_mbtc(amt)
    raise ArgumentError, "mBTC amount must not be less than #{MIN_MBTC}" unless Btc.valid_mbtc(amt)
    Btc.new(BigDecimal.new(amt.to_f.to_s) * MBTC)
  end

  def self.from_ubtc(amt)
    raise ArgumentError, "uBTC amount must not be less than #{MIN_UBTC}" unless Btc.valid_ubtc(amt)
    Btc.new(BigDecimal.new(amt.to_f.to_s) * UBTC)
  end

  def self.from_satoshis(amt)
    raise ArgumentError, 'Satoshi amount must be > 1 or 0' unless Btc.valid_satoshis(amt)
    Btc.new(BigDecimal.new(amt.to_i.to_f.to_s) * SATOSHI)
  end

  def self.valid_btc(amt)
    amt.to_f >= SATOSHI.to_f || amt.to_f == 0.0
  end

  def self.valid_mbtc(amt)
    amt.to_f >= MIN_MBTC || amt.to_f == 0.0
  end

  def self.valid_ubtc(amt)
    amt.to_f >= MIN_UBTC || amt.to_f == 0.0
  end

  def self.valid_satoshis(amt)
    amt.to_i >= 0
  end

  def btc
    @amt
  end

  def mbtc
    @amt / MBTC
  end

  def ubtc
    @amt / UBTC
  end

  def satoshis
    @amt / SATOSHI
  end

  def to_f
    @amt.to_f
  end

  def to_i
    @amt.to_i
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

  def **(exp)
    Btc.new(@amt ** exp)
  end

  def ==(other)
    @amt == other.btc
  end

  def inspect
    "#<Btc BTC:#{btc.to_f} mBTC:#{mbtc.to_f} uBTC:#{ubtc.to_f} Satoshis:#{satoshis.to_f}>"
  end
end