class Game

  attr_reader :board, :player_1, :player_2

  def initialize
    @board = Board.new
    @player_1 = Player.new("Player 1", "X")
    @player_2 = Player.new("Player 2", "O")
    @current = @player_1
  end

  def play
    welcome
    set_player_name(@player_1)
    set_player_name(@player_2)
    roll
    until @board.connect4?
      turn
    end
    congratulate_winner
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

  def turn
    @board.display
    @board.drop_token(get_play, @current.token)
    unless @board.connect4?
      switch_current_player
    end
  end

  def get_play
    print "#{@current.name}, please choose a row: "
    choice = gets.chomp.upcase
    until choice =~ /[ABCDEFG]/ && !@board.full?(choice)
      print "Please enter a valid row: "
      choice = gets.chomp.upcase
    end
    choice
  end

  def switch_current_player
    @current == @player_1 ? @current = @player_2 : @current = @player_1
  end

  def congratulate_winner
    @board.display
    puts "Congratulations #{@current.name}! You won!"
  end

end
