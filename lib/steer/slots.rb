module Steer
  module Slots
    class NameTaken < StandardError; end
    class NameNotFound < StandardError; end
    
    def self.add(name, section, klass)
      unless names.include?(name)
        sections[section] << [name, klass]
      else
        raise NameTaken, "#{name.inspect} is already taken"
      end
    end
    
    def self.instance_for(name, turn)
      if valid?(name)
        klass_for(name).new(turn)
      else
        raise NameNotFound, "#{name.inspect} isn't valid"
      end
    end
    
    def self.klass_for(name_to_find)
      collection.find do |(name, klass)|
        return klass if name == name_to_find
      end
    end
    
    def self.count
      names.size
    end
    
    def self.names
      collection.map do |name,klass|
        name
      end
    end
    
    def self.valid?(name)
      names.include?(name)
    end
    
    def self.collection
      collection = []
      (sections[:top] + sections[:bottom]).each do |name,klass|
        collection << [name, klass]
      end
      collection
    end
    
    def self.sections
      @sections ||= {:top => [], :bottom => []}
    end
  end
end