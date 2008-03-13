module Steer
  class Player
    def initialize(name)
      @name = name
    end
    attr_reader :name
    
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