require_relative 'helper'

class Game

  attr_reader :board, :player_1, :player_2

  def initialize
    @board = Board.new
    @player_1 = Player.new("Player 1", "X")
    @player_2 = Player.new("Player 2", "O")
    @current = @player_1
  end

  def play
    # Welcome Message
    welcome
    # Assign players
    set_player_name(@player_1)
    set_player_name(@player_2)
    # Roll for turn
    roll
    # show board
    @board.display
    # until connect4?
    #   alternate player-turns
    # congratulate winner
    "Jonathan"
  end

  def welcome
    puts "Welcome to Connect 4!"
  end

  def set_player_name(player)
    print "#{player.name}, please enter your name: "
    player.name = gets.chomp
  end

  def roll
    first = [@player_1, @player_2].sample
    @current = first
    puts "Congratulations, #{first.name}! You play first."
  end

  def turn(current)
    print "Please choose a row: "
    choice = gets.chomp
    until choice.downcase =~ /[abcdef]/
      print "Please enter a valid row: "
      choice = gets.chomp
    end
  end
end
