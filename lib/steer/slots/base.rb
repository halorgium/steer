module Steer
  module Slots
    class Base
      def self.register_in(section, name)
        Slots.add(name.to_s, section, self)
      end
      
      def initialize(turn)
        @turn = turn
      end
      attr_reader :turn
      
      def points
        raise NotImplemented, "Implement #{self.class}#points"
      end
    end
  end
end