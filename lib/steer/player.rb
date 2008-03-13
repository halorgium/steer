module Steer
  class Player
    class SlotTaken < StandardError; end
    
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
    
    def allocate(slot_name, turn)
      if slot_free?(slot_name)
        slot = Slots.instance_for(slot_name, turn)
        slots[slot_name] = slot
      else
        raise SlotTaken, "#{slot_name.inspect} has already been used"
      end
    end
    
    def points
      total = 0
      slots.values.each do |slot|
        total += slot.points
      end
      total
    end
    
    def slot_free?(name)
      !slot_names.include?(name)
    end
    
    def slot_options
      Slots.names - slot_names
    end
    
    def slot_names
      slots.keys
    end
    
    def slots
      @slots ||= {}
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