require File.dirname(__FILE__) + '/../../spec_helper'

module Steer
  module Slots
    describe LongStraight do
      it "should match [2,3,4,5,1]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([2,3,4,5,1])
        @slot = LongStraight.new(turn)
        @slot.should be_matches
      end
      
      it "should match [2,4,3,5,6]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([2,4,3,5,6])
        @slot = LongStraight.new(turn)
        @slot.should be_matches
      end
      
      it "should match [1,5,3,4,2]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([1,5,3,4,2])
        @slot = LongStraight.new(turn)
        @slot.should be_matches
      end
      
      it "should not match [4,1,3,6,3]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([4,1,3,6,3])
        @slot = LongStraight.new(turn)
        @slot.should_not be_matches
      end
    end
  end
end