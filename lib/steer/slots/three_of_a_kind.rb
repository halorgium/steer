module Steer
  module Slots
    class ThreeOfAKind < Base
      register_in :bottom, "3 of a kind"
      
      def matches?
        turn.dice_stats.values.include?(3)
      end
      
      def points
        turn.dice_total
      end
    end
  end
end