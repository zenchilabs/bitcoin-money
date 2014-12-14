require 'bigdecimal'

class BTC
  BTC = BigDecimal.new('1.0')
  MBTC = BigDecimal.new('0.001')
  BIT = BigDecimal.new('0.000001')
  SATOSHI = BigDecimal.new('0.00000001')

  MIN_BTC = SATOSHI.to_f
  MIN_MBTC = 0.00001
  MIN_BIT = 0.01
  MIN_SATOSHI = 1

  def initialize(amt)
    raise ArgumentError, "BTC amount must not be less than #{MIN_BTC}" unless self.class.valid_btc?(amt)
    @amt = BigDecimal.new(amt.to_f.to_s)
  end

  def self.from_mbtc(amt)
    raise ArgumentError, "mBTC amount must not be less than #{MIN_MBTC}" unless self.valid_mbtc?(amt)
    self.new(BigDecimal.new(amt.to_f.to_s) * MBTC)
  end

  def self.from_bits(amt)
    raise ArgumentError, "bits amount must not be less than #{MIN_BIT}" unless self.valid_bits?(amt)
    self.new(BigDecimal.new(amt.to_f.to_s) * BIT)
  end

  def self.from_satoshis(amt)
    raise ArgumentError, 'Satoshi amount must be > 1 or 0' unless self.valid_satoshis?(amt)
    self.new(BigDecimal.new(amt.to_i.to_f.to_s) * SATOSHI)
  end

  def self.valid_btc?(amt)
    amt.to_f >= SATOSHI.to_f || amt.to_f == 0.0
  end

  def self.valid_mbtc?(amt)
    amt.to_f >= MIN_MBTC || amt.to_f == 0.0
  end

  def self.valid_bits?(amt)
    amt.to_f >= MIN_BIT || amt.to_f == 0.0
  end

  def self.valid_satoshis?(amt)
    amt.to_i >= 0
  end

  def to_btc
    @amt
  end

  def to_mbtc
    @amt / MBTC
  end

  def to_bits
    @amt / BIT
  end

  def to_satoshis
    @amt / SATOSHI
  end

  def to_f
    @amt.to_f
  end

  def to_i
    @amt.to_i
  end

  def +(other)
    self.class.new(@amt + other.to_btc)
  end

  def /(other)
    self.class.new(@amt / other.to_btc)
  end

  def -(other)
    self.class.new(@amt - other.to_btc)
  end

  def *(other)
    self.class.new(@amt * other.to_btc)
  end

  def **(exp)
    self.class.new(@amt ** exp)
  end

  def ==(other)
    @amt == other.to_btc
  end

  def inspect
    "#<BTC:#{to_btc.to_f} mBTC:#{to_mbtc.to_f} bits:#{to_bits.to_f} Satoshis:#{to_satoshis.to_f}>"
  end
end