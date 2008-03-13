module Steer
  module Slots
    class SmallStraight < Base
      register_in :bottom, "Small Straight"
      
      def matches?
        values = turn.dice_values.uniq.sort
        [1..4, 2..5, 3..6].any? do |r|
          (values & r.to_a).size >= 4
        end
      end
      
      def points
        mathces? ? 30 : 0
      end
    end
  end
end