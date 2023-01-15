# frozen_string_literal: true

require_relative 'tom_cruise/version'

class TomCruise # rubocop:disable Style/Documentation
  def self.method_added(name)
    super

    return if ['initialize'].include?(name)
    return if self.name == 'TomCruise'

    puts "Added #{name}"
  end

  def under
  end
end
