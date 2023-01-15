# frozen_string_literal: true

require_relative 'test_helper'

class Darren < TomCruise
  def hi
    'a hi'
  end

  def bye
    'a bye'
  end

  def jump(times)
    "jumping #{times} time#{times == 1 ? "" : "s"}"
  end
end

describe TomCruise do
  it 'should be creatable' do
    _(TomCruise.new).wont_be_nil
  end

  describe 'darren messing around' do
    let(:darren) { Darren.new }
    it 'should comply' do
      darren = Darren.new

      _(darren.hi).must_equal 'a hi'
      _(darren.bye).must_equal 'a bye'
      _(darren.jump(1)).must_equal 'jumping 1 time'
      _(darren.jump(2)).must_equal 'jumping 2 times'
    end

    describe 'attaching lambdas' do
      it 'should let me attach lambdas' do
        list = []

        darren = Darren.new(-> { list << Object.new })

        darren.hi
        darren.bye
        darren.jump(1)

        _(list.count).must_equal 3
      end
    end
  end
end
