require 'rubygems'
require 'highline'

module Ui
  class Console < HighLine
    def initialize(game)
      super()
      @game = game
    end
    attr_reader :game
    
    def start
      say "Welcome to Steer Yahtzee!"
      choose_players
      play
      say "Thanks for playing Steer Yahtzee!"
    end
    
    def choose_players
      adding_players = true
      while(adding_players) do
        @question = HighLine::Question.new("What is your name? ", String) do |q|
          q.validate = /^[\w \-_]+$/
          q.responses[:not_valid] = "You must've put some weird characters in your name. Try again\n"
        end
        name = ask(nil)
        say game.join(name)
        adding_players = agree("Another? ")
      end
    end
    
    def play
      say "Now playing a game!"
      say "Players: #{game.players.join(', ')}"
    end    
  end
end