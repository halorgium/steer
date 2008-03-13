module Steer
  module Slots
    class LongStraight < Base
      register_in :bottom, "Long Straight"
      
      def matches?
        values = turn.dice_values.uniq.sort
        [1..5, 2..6].any? do |r|
          (values & r.to_a).size >= 5
        end
      end
      
      def points
        matches? ? 40 : 0
      end
    end
  end
end