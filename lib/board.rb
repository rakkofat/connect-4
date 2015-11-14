require 'pry'

class Board
  require 'matrix'

  COLS = ['A','B','C','D','E','F','G']

  attr_reader :board, :last_drop

  def initialize
    @board = create_board
    @last_drop = nil
  end

  def create_board
    board = []
    6.times do |row|
      board << []
      7.times { board[row] << nil }
    end
    board
  end

  def display
    @board.each_with_index do |row, i|
      row_line = "| "
      row.each_with_index do |col, index|
        col.nil? ? row_line << "  " : row_line << col
        row_line << "|" if index == row.length - 1
      end
      puts row_line
      if i == @board.length - 1
        last_line = "| "
        ('A'..'G').each do |l|
          l == 'G' ? last_line << 'G |' : last_line << "#{l} "
        end
        puts last_line
      end
    end
  end

  def drop_token(col, token)
    row_index = which_row?(col)
    col_index = COLS.index(col)
    @board[row_index][col_index] = token
    @last_drop = [row_index, col_index]
  end

  def which_row?(col)
    @board.each_with_index do |row, index|
      if row[COLS.index(col)].nil?
        return index
      end
    end
    nil
  end

  def full?(col)
    which_row?(col).nil?
  end

  def test_board(board)
    @board = board
  end

  def set_last_drop(position)
    @last_drop = position
  end

  def connect4?
    row = get_row(@last_drop)
    column = get_column(@last_drop)
    forward_diagonal = get_forward_diagonal(@last_drop)
    back_diagonal = get_back_diagonal(@last_drop)
    check_row(row) || check_row(column) || check_row(forward_diagonal) || check_row(back_diagonal)
  end

  def check_row(ary)
    ary.each_cons(4) do |a|
      return true if a.uniq.size == 1 && !a.uniq.include?(nil)
    end
    false
  end

  def get_row(position)
    @board[position[0]]
  end

  def get_column(position)
    columns = @board.transpose
    columns[position[1]]
  end

  def get_back_diagonal(position)
    diagonal = []
    factor = [(5 - position[0]), position[1]].min
    row = position[0] + factor
    col = position[1] - factor
    until row < 0 || col > 6
      diagonal << @board[row][col]
      row -= 1
      col += 1
    end
    diagonal
  end

  def get_forward_diagonal(position)
    diagonal = []
    factor = [5 - position[0], position[1]].min
    row = position[0] + factor
    col = position[1] + factor
    until row < 0 || col < 0
      diagonal << @board[row][col]
      row -= 1
      col -= 1
    end
    diagonal
  end

end
