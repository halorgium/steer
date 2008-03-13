$:.unshift File.dirname(__FILE__)

require 'steer/slots'
require 'steer/game'
require 'steer/player'
require 'steer/turn'
require 'steer/dice'

require 'steer/slots/base'
require 'steer/slots/numbers'

require 'steer/slots/three_of_a_kind'
require 'steer/slots/four_of_a_kind'
require 'steer/slots/full_house'
require 'steer/slots/small_straight'
require 'steer/slots/long_straight'
require 'steer/slots/yahtzee'
require 'steer/slots/chance'