# frozen_string_literal: true

require_relative 'tom_cruise/version'

class TomCruise # rubocop:disable Style/Documentation
  def initialize(a_lambda = nil)
    @lambdas = [a_lambda].compact
  end

  def self.method_added(name)
    super

    @things ||= {}

    return if ['initialize'].include?(name.to_s)
    return if self.name == 'TomCruise'
    return if @things[name]

    @things ||= {}

    the_method = instance_method(name)

    @things[name] = the_method

    undef_method name
  end

  def respond_to_missing?(name)
    self.class.things[name]
  end

  def method_missing(name, *args, **kwargs)
    @lambdas
      .select { |x| x.parameters.none? }
      .each { |x| x.call }

    @lambdas
      .select { |x| x.parameters.map(&:first).map(&:to_s).any? { |y| y.start_with?('key') } }
      .each do |lamb|
        arguments_to_use = lamb.parameters.map { |x| x[1] }
        data = { method_name: name, args: args }
        lamb_args = arguments_to_use.to_h { |x| [x, data[x]] }
        lamb.call(**lamb_args)
      end

    self.class.things[name].bind(self).call(*args, **kwargs)
  end

  class << self
    attr_reader :things
  end
end
