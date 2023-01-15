# frozen_string_literal: true

require 'test_helper'

describe TomCruise do
  it 'should be creatable' do
    _(TomCruise.new).wont_be_nil
  end
end
