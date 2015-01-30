require 'active_support/all'

class LiteEnum < SimpleDelegator
  # Public: Initialize an enum.
  #
  # members - the array of enum members. May contain a hash of options:
  #           :start   - the number of first enum member. Defaults to 1.
  #
  # Examples
  #
  #   FRUITS = LiteEnum.new(:apple, :orange, :kiwi)
  def initialize(*members)
    super({})

    # Support for explicit values
    if members.length == 1 && members[0].is_a?(Hash)
      return update members[0]
    end

    options = members.extract_options!
    start = options.fetch(:start) { 1 }

    update Hash[members.zip(start..members.count + start)]
  end

  # Public: Access the number/value of member.
  #
  # ids_or_value - number or value of member.
  #
  # Returns value if number was provided, and number if value was provided.
  def [](id_or_value)
    fetch(id_or_value) { key(id_or_value) }
  end

  # Public: Check if supplied member is valid.
  def valid?(member)
    has_key?(member)
  end

  # Public: Create a subset of enum, only include specified keys.
  def only(*keys)
    dup.tap do |d|
      d.__getobj__.keep_if { |k| keys.include?(k) }
    end
  end

  # Public: Create a subset of enum, preserve all items but specified ones.
  def except(*keys)
    dup.tap do |d|
      d.__getobj__.delete_if { |k| keys.include?(k) }
    end
  end
end

begin
  require 'simple_form'
  require 'simple_form/version'
rescue
end

if defined?(SimpleForm) && Gem::Version.new(SimpleForm::VERSION) >= Gem::Version.new('3.1.0')
  require 'simple_form_monkeypatch'
end
