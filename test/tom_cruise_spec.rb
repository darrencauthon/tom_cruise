# frozen_string_literal: true

require_relative 'test_helper'

class Darren < TomCruise
  def hi
    puts 'hihi'
  end

  def bye
    puts 'byebye'
  end

  def jump(times)
    puts "jumping #{times} time#{times == 1 ? "" : "s"}"
  end
end

describe TomCruise do
  it 'should be creatable' do
    _(TomCruise.new).wont_be_nil
  end

  describe 'darren messing around' do
    it 'should comply' do
      darren = Darren.new

      darren.hi
      darren.bye
      darren.jump(1)
    end

    it 'should let me attach things' do
      darren = Darren.new(-> { puts 'nope' })

      darren.hi
      darren.bye
      darren.jump(1)
    end
  end
end
