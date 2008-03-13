module Steer
  module Slots
    class FullHouse < Base
      register_in :bottom, "Full House"
      
      def matches?
        turn.dice_stats.values.sort == [2, 3]
      end
      
      def points
        matches? ? 25 : 0
      end
    end
  end
end