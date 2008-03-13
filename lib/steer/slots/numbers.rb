module Steer
  module Slots
    class Numbers < Base
      class << self; attr_accessor :dice_value; end
      def matches?
        true
      end
      
      def points
        total = 0
        turn.dice_values.each do |n|
          total += n if n == self.class.dice_value
        end
        total
      end
    end
    
    1.upto(6) do |dice_value|
      klass = Class.new(Numbers)
      klass.dice_value = dice_value
      add "#{dice_value}s", klass
    end
  end
end