# HasPlaceholderImage
![Test](https://github.com/buck-ai/has-placeholder-image/workflows/Test/badge.svg)

Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'has_placeholder_image'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install has_placeholder_image
```

after generate configuration file viwt this command;
```shell script
rails g has_placeholder_image:install
```

## Usage
Append the method your model; `has_placeholder_image`

has_placeholder_image read your `config/initializers/has_placeholder_image.rb` values for default.
customize generation every model if you want.

For example;
```ruby
has_placeholder_image source: :title, 
                      target: :logo, 
                      background_color: '#335eea'
```

## Configuration
```ruby
HasPlaceholderImage.setup do |config|
  config.background_color = '#000000'
  config.font_color = '#FFFFFF'
  config.font_size = 50
  config.transformer = 'two_word_first_letter_upcase'
  config.source = 'name'
  config.target = 'photo'
  config.output_path = Rails.root.join('tmp/placeholders')
  config.height = 300
  config.width = 300
end
```

| Key | Description |
| --- | ----------- |
| background_color | For image background color. |
| font_color | For text color. |
| font_size | For font size. |
| transformer | How to generate your image title. This time only have `'two_word_first_letter_upcase'` method. |
| source | Placeholder image text generate with this field. |
| target | Your active storage attribute on your model. |
| output_path | Where to store generated images path. |
| height | Generated image height. |
| width | Generated image width. |

## Example
app/models/company.rb
```ruby
# frozen_string_literal: true

class Company < ApplicationRecord
  has_one_attached :logo
  has_placeholder_image source: :title, target: :logo,
                        background_color: '#335eea',
			font_size: 200

  validates :title, presence: true
end
```
![Output](docs/example.png)


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
