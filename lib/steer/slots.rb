module Steer
  module Slots
    class NameTaken < StandardError; end
    class NameNotFound < StandardError; end
    
    def self.add(name, klass)
      unless names.include?(name)
        collection[name] = klass
      else
        raise NameTaken, "#{name.inspect} is already taken"
      end
    end
    
    def self.instance_for(name, turn)
      if valid?(name)
        collection[name].new(turn)
      else
        raise NameNotFound, "#{name.inspect} isn't valid"
      end
    end
    
    def self.collection
      @collection ||= {}
    end
    
    def self.count
      collection.size
    end
    
    def self.names
      collection.keys
    end
    
    def self.valid?(name)
      names.include?(name)
    end
  end
end