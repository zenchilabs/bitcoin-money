# Bitcoin::Money

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'bitcoin-money'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoin-money

## Usage
~~~ruby
b = Btc.new(0.012) 
b.mbtc # => BigDecimal.new('120.0')
b.satoshis # => BigDecimal.new('1200000.0')
b.btc # => BigDecimal.new('0.0012')
~~~

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bitcoin-money/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
