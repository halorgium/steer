require File.dirname(__FILE__) + '/../../spec_helper'

module Steer
  module Slots
    describe SmallStraight do
      it "should match [2,3,5,4,2]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([2,3,5,4,2])
        @slot = SmallStraight.new(turn)
        @slot.should be_matches
      end
      
      it "should match [1,4,3,5,6]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([1,4,3,5,6])
        @slot = SmallStraight.new(turn)
        @slot.should be_matches
      end
      
      it "should match [4,2,3,5,4]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([1,4,3,5,6])
        @slot = SmallStraight.new(turn)
        @slot.should be_matches
      end
      
      it "should not match [4,1,3,6,3]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([4,1,3,6,3])
        @slot = FullHouse.new(turn)
        @slot.should_not be_matches
      end
    end
  end
end