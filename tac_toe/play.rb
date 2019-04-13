require_relative 'tic_tac_toe'
# Class for playing the game
class Play
  attr_accessor :player1, :player2
  include TicTacToe
  def initialize
    @handle = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @board = ''
  end 

  def play
    print 'Player 1: Choose a letter between O and X: '
    @player1 = gets.chomp!
    return 'You can only choose X or O' unless @player1.casecmp('x').zero? ||
                                               @player1.casecmp('o').zero?

    @player2 = @player1.casecmp('x').zero? ? 'o' : 'x'

    puts 'Welcome Player1 and Player 2'
    puts "Player1 you are #{@player1.upcase} while Player 2 you are #{@player2.upcase}"

    @board = play_board(@handle, @board)
    while !win?(@board) || !tie?(@handle, @board)
      playhand('player1', player1)
      playhand('player2', player2)
    end 
    puts "Win or Tie"
  end

  def playhand(player, player1)
    print "#{player}, pick a position between 0 - 8: "
    p1_pos = gets.chomp
    if position_valid?(p1_pos) && !position_chosen?(p1_pos, @handle)
      update_handle(p1_pos, player1, @handle)
      @board = play_board(@handle, @board)
      puts @board
    else
      puts "Invalid position or Position has been chosen"
    end   
  end
end

play_game = Play.new

p play_game.play
