# DatxRuby

DatxRuby simply help you find location by IP address. 

## Compatibility

I have tested it on Ruby >= 1.9.3. Other versions are not tested but should work on well. Please contact me if not.

## Installation

    gem install datx_ruby


OR add this line to your application's Gemfile:

    gem 'datx_ruby'
    

And then execute:

    $ bundle


## Usage

### In Ruby
```(ruby)
require 'datx_ruby'
DatxRuby.city_datx_path= "/datapath/ipipnet.datx"
DatxRuby.city_find "106.75.109.221"
# => ["中国", "北京", "北京", "ucloud.cn", "联通"]
```
### In Rails
You need to do is set DatxRuby.city_datx_path= "/datapath/ipipnet.datx" inside the config/initializers/datx_ruby.rb file.


[Report bugs][issues] on GitHub.


[issues]: https://github.com/limanxian/datx-ruby/issues