# frozen_string_literal: true

require_relative 'tom_cruise/version'

class TomCruise
  def self.method_added(name)
    super
    puts "Added #{name}"
  end
end
