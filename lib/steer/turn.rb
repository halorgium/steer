module Steer
  class Turn
    MAX_ROLLS = 3
    
    def initialize(player, number)
      @player, @number, @rolls = player, number, 0
    end
    attr_reader :dice
    attr_accessor :dice_to_reroll
    
    def reroll_dice(&block)
      return unless allowed_reroll?
      yield self
    end
    
    def allowed_reroll?
      @rolls < MAX_ROLLS
    end
    
    def needs_rolling?
      dice.nil? || reroll_requested?
    end
    
    def reroll_requested?
      dice_to_reroll && dice_to_reroll.any?
    end
    
    def roll
      @rolls += 1
      @dice_to_reroll = nil
      @dice = [1, 3, 3, 4, 6]
    end
    
    def use_as(slot_type)
      @player.allocate(slot_type, self)
    end
  end
end