# Aerials

Gem generates constant JSON. As consequence, you can MD5 it and this will remain the same.

## Installation

Add this line to your application's Gemfile:

    gem 'aerials'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aerials

## Usage

### JSON generation rules:
- No extra spaces
- Always use quotes for both fields and non-array/hash values ('')
- Always replace quotes with '\
- Always use UTF8 (TODO)
- Always sort by keys on each level (arrays should be sorted by values)
- Always sort as strings

### Example:

    struct = {
        array: [2, '1'],
        hash: {
            'a' => '1'
        },
        a: 2,
    }
    Aerials.create_json struct
    
    # will return
    # "{'a':'2','array':['1','2'],'hash':{'a':'1'}}"
    
You can exclude fields:

    Aerials.create_json(struct, exclude: [:controller])
    
Or use with default for Rails exclusion:
    
    Aerials.create_json_rails struct
    # equals to:
    Aerials.create_json struct, exclude: [:action, :controller, :key]

## Contributing

1. Fork it ( https://github.com/appelsin/aerials )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
