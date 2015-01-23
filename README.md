# RailsConditionalParams

This gem patches `ActionController::Parameters` to support conditional
parameters—parameters that are permitted only if some condition is true.
Basically, it ensures that any hash key passed to `permit()` with `true` as
its value is made into a permitted key, while keys passed with `false` or `nil`
are ignored.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_conditional_params'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_conditional_params

## Usage

    params.permit(:title, :body, published: admin?)
		# published will only be permitted if admin? returns true

## Contributing

1. Fork it ( https://github.com/brentdax/rails_conditional_params/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
