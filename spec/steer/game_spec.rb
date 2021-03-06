require File.dirname(__FILE__) + '/../spec_helper'

module Steer
  describe Game, "which has not begun" do
    before(:each) do
      @game = Game.new
    end
    
    it "should have no players" do
      @game.players.should be_empty
    end
    
    it "should allow players to be join" do
      @game.join("John Smith")
      @game.players.size.should == 1
      @game.players.first.name.should == "John Smith"
    end
  end
end