# frozen_string_literal: true

require_relative 'tom_cruise/version'

class TomCruise # rubocop:disable Style/Documentation
  def self.method_added(name)
    super

    @things ||= {}

    return if ['initialize'].include?(name.to_s)
    return if self.name == 'TomCruise'
    return if @things[name]

    puts "Added #{name}"
    @things ||= {}

    @things[name] = instance_method(name)
    puts @things.inspect

    undef_method name

    define_method name, proc { puts 'ok' }
  end

  class << self
    attr_reader :things
  end
end
