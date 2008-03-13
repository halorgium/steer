module Steer
  module Slots
    class FourOfAKind < Base
      register_in :bottom, "4 of a kind"
      
      def matches?
        turn.dice_stats.values.include?(4)
      end
      
      def points
        matches? ? turn.dice_total : 0
      end
    end
  end
end