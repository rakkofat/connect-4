require 'spec_helper'

RSpec.describe Board do
  let(:board) { Board.new }
  let(:row_win) { [
    ["O", "O", "X", "X", "X", "X", "O"],
    [nil, "O", nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil]] }
  let(:col_win) { [
    [nil, nil, nil, nil, "X", nil, nil],
    [nil, nil, nil, nil, "O", nil, nil],
    [nil, nil, nil, nil, "O", nil, nil],
    [nil, nil, nil, nil, "O", nil, nil],
    [nil, nil, nil, nil, "O", nil, nil],
    [nil, nil, nil, nil, nil, nil, nil]] }
  let(:back_diag_win) { [
    [nil, nil, nil, nil, nil, "O", nil],
    [nil, nil, nil, nil, "O", nil, nil],
    [nil, nil, nil, "O", nil, nil, nil],
    [nil, nil, "O", nil, nil, nil, nil],
    [nil, "O", nil, nil, nil, nil, nil],
    ["O", nil, nil, nil, nil, nil, nil]] }
  let(:diag_win) { [
    [nil, "O", nil, nil, nil, nil, nil],
    [nil, nil, "O", nil, nil, nil, nil],
    [nil, nil, nil, "O", nil, nil, nil],
    [nil, nil, nil, nil, "O", nil, nil],
    [nil, nil, nil, nil, nil, "O", nil],
    [nil, nil, nil, nil, nil, nil, "O"]] }

  describe "#Initialize" do
    it 'has a 2D board array' do
      expect(board.board).to be_a(Array)
    end
  end

  describe "#create_board" do
    it 'has an array of columns' do
      expect(board.board.length).to eq(6)
    end

    it 'has columns with 7 rows' do
      expect(board.board.first.length).to eq(7)
    end

  end

  describe "#place_token" do
    it 'lets tokens be placed in selected column' do
      tester = [[nil, "X", nil],[nil, nil, nil],[nil, nil, nil]]
      board.test_board(tester)
      board.drop_token("A", "X")
      board.drop_token("B", "O")
      expect(board.board[0][0]).to eq("X")
      expect(board.board[0][1]).to eq("X")
      expect(board.board[1][1]).to eq("O")
    end
  end

  describe "#which_row?" do
    it 'selects the first empty row of the selected column' do
      tester = [[nil, "X", nil],[nil, nil, nil],[nil, nil, nil]]
      board.test_board(tester)
      expect(board.which_row?("A")).to eq(0)
      expect(board.which_row?("B")).to eq(1)
    end
  end

  describe "full?" do
    it 'returns false if column not full' do
      tester = [[nil, "X", nil],[nil, nil, nil],[nil, nil, nil]]
      board.test_board(tester)
      expect(board.full?("A")).to eq(false)
    end
  end

  describe "#connect4?" do
    it 'returns true if connect 4 on a row' do
      board.test_board(row_win)
      board.set_last_drop([0,5])
      expect(board.connect4?).to eq(true)
    end

    it 'returns true if connect 4 on a column' do
      board.test_board(col_win)
      board.set_last_drop([0,4])
      expect(board.connect4?).to eq(true)
    end

    it 'returns true if connect 4 on a diagonal' do
      board.test_board(diag_win)
      board.set_last_drop([2,3])
      expect(board.connect4?).to eq(true)
    end

    it 'returns true if connect 4 on a backwards diagonal' do
      board.test_board(back_diag_win)
      board.set_last_drop([3,2])
      expect(board.connect4?).to eq(true)
    end

    it 'returns false if no connect 4 on last drop' do
      board.test_board(row_win)
      board.set_last_drop([1,1])
      expect(board.connect4?).to eq(false)
    end

  end


end
