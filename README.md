Filespot API Ruby Gem
====================
A Ruby wrapper for the Filespot API
http://doc.platformcraft.ru/filespot/api/

Installation
------------
  gem install platformcraft-filespot

Configuration
------------
```ruby
Filespot.configure do |config|
  config.url = 'api.platformcraft.ru'
  config.version = 1
  config.apikey = '12345'
  config.apiuserid = '12345'
end
```

Example
------------
```ruby
require 'filespot'

Filespot.configure do |config|
  config.apiuserid = '12345'
  config.apikey = '12345'
end

file = File.open('example.txt')

object = Filespot::Client.post_object(file)
puts object.name #example.txt

objects = Filespot::Client.get_objects
puts objects.count # 1
puts objects.map(&:name) # example.txt
```
