module Steer
  class Player
    def initialize(name)
      @name = name
    end
    attr_reader :name
    
    def take_turn
      turn = Turn.new(self, turns.size + 1)
      while turn.needs_rolling?
        yield turn
      end
      turns << turn
    end
    
    def turns
      @turns ||= []
    end
    
    def latest_turn
      turns.last
    end
    
    def allocate(slot_type, turn)
      
    end
    
    def points
      100
    end
    
    def eql?(other)
      return false unless other.is_a?(Player)
      name == other.name
    end
    
    def hash
      @name.hash
    end
    
    def to_s
      name
    end
  end
end