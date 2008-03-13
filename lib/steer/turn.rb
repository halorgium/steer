require 'set'

module Steer
  class Turn
    class RerollNotAllowed < StandardError; end
    
    MAX_ROLLS = 3
    
    def initialize(player, number)
      @player, @number, @rolls = player, number, 0
      @dice = []
      @dice_to_reroll = Set.new
      5.times do |i|
        @dice_to_reroll << i
        @dice << Dice.new
      end
    end
    attr_reader :dice
    
    def reroll_at(position)
      raise RerollNotAllowed, "You have already rolled the dice #{@rolls} times" unless allowed_reroll?
      if (1..dice.size).include?(position)
        @dice_to_reroll << position
      else
        false
      end
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
        dice[n - 1].roll
      end
      @dice_to_reroll.clear
    end
    
    def use_as(slot_name)
      @player.allocate(slot_name.to_s, self)
    end 
    
    def dice_values
      dice.map {|d| d.value}
    end
    
    def dice_total
      total = 0
      dice_values.each do |n|
        total += n
      end
      total
    end
    
    def dice_stats
      stats = {}
      dice_values.each do |n|
        stats[n] ||= 0
        stats[n] += 1
      end
      stats
    end
    
    def dice_to_reroll
      @dice_to_reroll.to_a.sort
    end
  end
end