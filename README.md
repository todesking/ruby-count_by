# count_by

This gem provides `Enumerable#count_by(&block)`, take a block for compute key value and returns `{ key => count_of_key_in_the_collection }`.


## Installation

Add this line to your application's Gemfile:

    gem 'count_by'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install count_by

## Usage

```ruby
[1, 1, 2, 3, 4, 5].count_by{|x| x % 3}
#=> {1=>3, 2=>2, 0=>1}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Changes

### 1.0.0(unreleased)

* Initial release
