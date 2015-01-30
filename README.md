lite_enum [![version]](http://rubygems.org/gems/lite_enum) [![build]](https://travis-ci.org/dobtco/lite_enum)
=======

A short and sweet enumerator class for usage with ActiveRecord, most likely.

## Goals:

- Concise
- Readable
- Useful for DOBT's stack
- Plain ol' Ruby API
- No auto-generation of predicate methods like in `ActiveRecord::Enum`

## Usage

```rb
# Gemfile
gem 'lite_enum'

# app/models/foo.rb
class Foo < ActiveRecord::Base
  def self.sizes
    LiteEnum.new(:small, :medium, :large)
  end
end

Foo.sizes[1] # => :small
Foo.sizes[:small] # => 1
foo = Foo.new(size: Foo.sizes[:small])
foo.size # => 1
foo.size == Foo.sizes[:small] # => true
```

[version]: https://img.shields.io/gem/v/lite_enum.svg
[build]: http://img.shields.io/travis/dobtco/lite_enum.svg
