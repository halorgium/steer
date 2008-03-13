module Steer
  module Slots
    class FourOfAKind < Base
      register_in :bottom, "4 of a kind"
      
      def matches?
        turn.dice_stats.values.include?(4)
      end
      
      def points
        turn.dice_total
      end
    end
  end
end