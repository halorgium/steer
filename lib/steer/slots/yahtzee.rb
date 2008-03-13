module Steer
  module Slots
    class Yahtzee < Base
      register_in :bottom, "Yahtzee"
      
      def matches?
        turn.dice_stats.values.include?(5)
      end
      
      def points
        50
      end
    end
  end
end