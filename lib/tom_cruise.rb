# frozen_string_literal: true

require_relative 'tom_cruise/version'

class TomCruise
  def self.method_added(name)
    puts "Added #{name}"
  end
end
