# HasPlaceholderImage
![Test](https://github.com/buck-ai/has-placeholder-image/workflows/Test/badge.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/d7ff2ca5f9ceb238c353/maintainability)](https://codeclimate.com/github/buck-ai/has_placeholder_image/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d7ff2ca5f9ceb238c353/test_coverage)](https://codeclimate.com/github/buck-ai/has_placeholder_image/test_coverage)
[![Gem Version](https://badge.fury.io/rb/has_placeholder_image.svg)](https://badge.fury.io/rb/has_placeholder_image)


Has Placeholder Image is a Ruby on Rails gem that allows developers to generate placeholder images for models depending on the title or name attributes of model.

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

after generate configuration file with this command;
```shell script
rails g has_placeholder_image:install
```

## Usage
Insert this method to your model which will have placeholder images:
 
 `has_placeholder_image`

You can customize default configuration with `config/initializers/has_placeholder_image.rb` or you can customize placeholder image generation on model basis by adding custom attributes to placeholder callback.

For example;
```ruby
has_placeholder_image source: :title, 
                      target: :logo, 
                      background_color: '#335eea'
```

## Configuration

The default configuration lies in `config/initializers/has_placeholder_image.rb` and can be customized according to your liking.

```ruby
HasPlaceholderImage.setup do |config|
  config.background_color = '#000000'
  config.font_color = '#FFFFFF'
  config.font_size = 200
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
| `background_color` | For image background color. |
| `font_color` | For text color. |
| `font_size` | For font size. |
| `transformer` | How to generate your image title. This time only have `'two_word_first_letter_upcase'` method. |
| `source` | Placeholder image text generate with this field. |
| `target` | Your active storage attribute on your model. |
| `output_path` | Where to store generated images path. |
| `height` | Generated image height. |
| `width` | Generated image width. |

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
See the contributing guide.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
