# rubocop:disable Metrics/BlockLength
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

  def expound(facta:, factb:)
    "facta: #{facta}, factb: #{factb}"
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

    describe 'attaching one lambda' do
      let(:list) { [] }

      let(:darren) { Darren.new(-> { list << Object.new }) }

      it 'should let me attach one lambda' do
        darren.hi
        darren.bye
        darren.jump(1)

        _(list.count).must_equal 3
      end
    end

    describe 'getting the method names' do
      let(:list) { [] }

      let(:darren) { Darren.new(->(method_name:) { list << method_name }) }

      it 'should let me attach one lambda' do
        darren.hi
        darren.bye
        darren.jump(1)

        _(list).must_equal %i[hi bye jump]
      end
    end

    describe 'getting the args' do
      let(:list) { [] }

      let(:darren) { Darren.new(->(args:) { list << args }) }

      it 'should let me attach one lambda' do
        darren.jump(1)

        _(list).must_equal [[1]]
      end
    end

    describe 'getting the kwargs' do
      let(:list) { [] }

      let(:darren) { Darren.new(->(kwargs:) { list << kwargs }) }

      it 'should let me attach one lambda' do
        darren.expound(facta: '1+1=2', factb: '2+2=4')

        _(list).must_equal [{ facta: '1+1=2', factb: '2+2=4' }]
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
