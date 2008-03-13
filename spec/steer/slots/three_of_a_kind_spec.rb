require File.dirname(__FILE__) + '/../../spec_helper'

module Steer
  module Slots
    describe ThreeOfAKind do
      it "should match [1,2,3,3,3]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([1,2,3,3,3])
        @slot = ThreeOfAKind.new(turn)
        @slot.should be_matches
      end
      
      it "should not match [4,5,3,2,3]" do
        turn = Turn.new(nil, nil)
        turn.should_receive(:dice_values).and_return([4,5,3,2,3])
        @slot = ThreeOfAKind.new(turn)
        @slot.should_not be_matches
      end
    end
  end
end