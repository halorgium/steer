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
      player_set.add?(Player.new(player_name))
    end
    
    def next_player(&block)
      1.upto(Slots.count) do |turn|
        players.each do |player|
          yield player
        end
      end
    end
  end
end