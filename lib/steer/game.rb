require 'set'

module Steer
  class Game
    def player_set
      @player_set ||= Set.new
    end
    
    def players
      player_set.to_a
    end
    
    def join(player_name)
      if player_set.add?(Player.new(player_name))
        "#{player_name} joined the game"
      else
        "#{player_name} is already in the game"
      end
    end
  end
end