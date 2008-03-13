module Steer
  module Slots
    class Chance < Base
      register_in :bottom, :chance
      
      def matches?
        true
      end
      
      def points
        total = 0
        turn.dice_values.each do |n|
          total += n
        end
        total
      end
    end
  end
end