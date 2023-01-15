# frozen_string_literal: true

require_relative 'tom_cruise/version'

class TomCruise # rubocop:disable Style/Documentation
  def self.method_added(name)
    super

    return if ['initialize'].include?(name.to_s)
    return if self.name == 'TomCruise'

    puts "Added #{name}"
    @things ||= {}

    @things[name] = instance_method(name)
    puts @things.inspect
  end

  def under
  end
end
