module Steer
  module Slots
    class Base
      def self.register_as(name)
        Slots.add(name.to_s, self)
      end
      
      def initialize(turn)
        @turn = turn
      end
      attr_reader :turn
      
      def matches?
        raise NotImplemented, "Implement #{self.class}#matches?"
      end
      
      def points
        raise NotImplemented, "Implement #{self.class}#points"
      end
    end
  end
end