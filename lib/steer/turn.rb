module Steer
  class Turn
    MAX_ROLLS = 3
    
    def initialize(player, number)
      @player, @number, @rolls = player, number, 0
      @dice = []
      @dice_to_reroll = []
      6.times do |i|
        @dice_to_reroll << i
        @dice << Dice.new
      end
    end
    attr_reader :dice
    attr_writer :dice_to_reroll
    
    def reroll_dice(&block)
      return unless allowed_reroll?
      yield self
    end
    
    def allowed_reroll?
      @rolls < MAX_ROLLS
    end
    
    def needs_rolling?
      @dice_to_reroll.any?
    end
    
    def roll
      @rolls += 1
      @dice_to_reroll.each do |n|
        @dice[n].roll
      end
      @dice_to_reroll = []
    end
    
    def use_as(slot_name)
      @player.allocate(slot_name.to_s, self)
    end 
    
    def dice_values
      @dice.map {|d| d.value}
    end
  end
end