# frozen_string_literal: true

require_relative 'test_helper'

class Darren < TomCruise
  def initialize(save_me: nil)
  end

  def hi
    puts 'hi'
  end
end

describe TomCruise do
  it 'should be creatable' do
    _(TomCruise.new).wont_be_nil
  end

  describe 'darren messing around' do
    it 'should comply' do
      darren = Darren.new

      darren.under(:hi)
      darren.hi
    end
  end
end
