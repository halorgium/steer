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
        if game.join(name)
          say "#{name} joined the game"
        else
          say "#{name} is already in the game"
        end
        adding_players = agree("Another player? ")
      end
    end
    
    def play
      say "Now playing a game!"
      say "Players: #{game.players.join(', ')}"
      game.next_player do |player|
        say "Time for #{player} to have their turn!"
        player.take_turn do |turn|
          say "Roll the dice!"
          get_character # wait for the user
          turn.roll
          if turn.allowed_reroll?
            say "The dice are currently #{turn.dice.join(', ')}"
            say "Your options are #{player.slot_options.join(', ')}"
            say "You should choose some dice to roll (if you want)"
            say "Choose a number from 1 to 5"
            until (char = get_character) == 13
              position = char.chr.to_i
              if turn.reroll_at(position)
                say "Rerolling dice #{turn.dice_to_reroll.join(', ')}"
              else
                say "Couldn't reroll dice number #{position}"
              end
            end
          end
        end
        say "Time to choose how you want to use your dice!"
        turn = player.latest_turn
        say "Your dice are #{turn.dice.join(', ')}"
        say "Your options are #{player.slot_options.join(', ')}"
        @question = HighLine::Question.new("Choose: ", String) do |q|
          q.in = player.slot_options
        end
        choice = ask(nil)
        turn.use_as choice
        say "You currently have #{player.points} points!"
      end
      say "Game over!"
      game.players.each do |player|
        say "%20s: %5d" % [player, player.points]
      end
    end
  end
end