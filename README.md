# Trilateration

Trilateration calculates the position of an unknown point, using the distance from three known points to it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trilateration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trilateration

## Usage

```ruby
p1 = Trilateration::Point.new(1,2)
p2 = Trilateration::Point.new(8,6)
p3 = Trilateration::Point.new(1,6)
tri = Trilateration::Calculate.new(p1, p2, p3)

output = tri.calculate_from_distances(4.02305854, 4.43677811, 3.87104637)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/trilateration/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
