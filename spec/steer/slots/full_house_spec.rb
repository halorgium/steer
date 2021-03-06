require File.dirname(__FILE__) + '/../../spec_helper'

module Steer
  module Slots
    describe FullHouse do
      it "should match [2,4,2,4,2]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([2,4,2,4,2])
        @slot = FullHouse.new(turn)
        @slot.should be_matches
      end
      
      it "should not match [4,5,3,2,3]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([4,5,3,2,3])
        @slot = FullHouse.new(turn)
        @slot.should_not be_matches
      end
    end
  end
end