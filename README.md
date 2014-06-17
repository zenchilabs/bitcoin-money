# Bitcoin Money!

The Money gem is a popular gem for Ruby. 
Ruby needs a gem like Money, for Bitcoin!

But BTC is unique, so this simple object should be unique.

## Installation

Add this line to your application's Gemfile:

    gem 'bitcoin-money'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoin-money

## Usage

Require it! 

`require 'btc'`

Create from whichever unit of BTC.
~~~ruby
a = Btc.new(0.012) 
b = Btc.from_mbtc(12)
c = Btc.from_satoshis(120000)
a == b # true
b == c # true
# a == b == c
~~~

Get value in any unit of BTC.
~~~ruby
b # => #<Btc BTC:0.012 mBTC: 12.0 Satoshis: 120000.0>
b.mbtc # => BigDecimal.new('12.0')
b.satoshis # => BigDecimal.new('120000.0')
b.btc # => BigDecimal.new('0.012')
~~~

Perform operations.
~~~ruby
a + b # == Bitcoin.new(0.024)
a * a # == Bitcoin.new(0.000144)
a / c # == Bitcoin.new(1)
# also ** and -
~~~

## Contributing

1. Fork it ( https://github.com/zenchilabs/bitcoin-money/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
