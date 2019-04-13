module TicTacToe

  def play_board(handle, board)
    handle.each_with_index do |x, y|
      board +=
        if (y % 3).zero? && y != 0
          "\n==============\n#{x} | "
        else
          "#{x}  | "
        end
    end
    return board
  end

  def win?(board)
    if [board[0], board[1], board[2]].uniq.size == 1 ||
       [board[3], board[4], board[5]].uniq.size == 1 ||
       [board[6], board[7], board[8]].uniq.size == 1 ||
       [board[0], board[3], board[6]].uniq.size == 1 ||
       [board[1], board[4], board[7]].uniq.size == 1 ||
       [board[2], board[5], board[8]].uniq.size == 1 ||
       [board[2], board[4], board[6]].uniq.size == 1 ||
       [board[0], board[4], board[8]].uniq.size == 1
      return true
    end

    false
  end

  def tie?(handle, board)
    return true if handle.uniq.size == 2 && !win?(board)

    false
  end

  def position_valid?(position)
    return true if position.to_i <= 8 && position.to_i >= 0

    false
  end

  def update_handle(position, letter, handle)
    return 'Enter a position between 0 - 8' if position.to_i > 8 || position.to_i < 0

    handle[position.to_i] = letter
  end

  def position_chosen?(position, handle)
    return true if handle[position.to_i] == 'x' || handle[position.to_i] == 'o'

    false
  end
end
