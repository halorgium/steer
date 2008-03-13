module Steer
  class Dice
    attr_reader :value
    
    def roll
      puts "Rolling dice..."
      @value = (rand * 5).to_i + 1
    end
    
    def to_s
      value ? value.to_s : "<!>"
    end
  end
end