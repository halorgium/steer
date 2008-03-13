module Steer
  module Slots
    class Chance < Base
      register_in :bottom, :chance
      
      def points
        turn.dice_total
      end
    end
  end
end