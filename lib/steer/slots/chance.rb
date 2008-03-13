module Steer
  module Slots
    class Chance < Base
      register_as :chance
      
      def matches?
        true
      end
      
      def points
        total = 0
        turn.dice.each do |n|
          total += n
        end
        total
      end
    end
  end
end