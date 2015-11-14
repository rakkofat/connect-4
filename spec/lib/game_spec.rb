require 'spec_helper'

RSpec.describe Game do
  let(:p1) { Player.new("Jonathan", "X") }
  let(:p2) { Player.new("Anna", "O") }
  let(:g) { Game.new }
  #Better way to write this?
  let(:no_connect4) { [[nil, nil, nil, nil],[nil, nil, nil, nil],[nil, nil, nil, nil],[nil, nil, nil, nil]] }
  let(:connect4) { [[nil, nil, nil, nil],[nil, nil, nil, nil],[nil, nil, nil, nil],[nil, nil, nil, nil]] }
  let(:row_win) { [[nil, nil, nil, nil],["X", "X", "X", "X"],[nil, nil, nil, nil],[nil, nil, nil, nil]] }
  let(:col_win) { [[nil, nil, nil, "O"],[nil, nil, nil, "O"],[nil, nil, nil, "O"],[nil, nil, nil, "O"]] }

  describe "#Initialize" do
    it 'has a board' do
      expect(g.board).to be_a(Board)
    end

    it 'has two unique players' do
      expect(g.player_1).to be_a(Player)
      expect(g.player_2).to be_a(Player)
      expect(g.player_1.name).to_not eq(g.player_2.name)
    end

    it 'has players with unique tokens' do
      expect(g.player_1.token).to_not eq(g.player_2.token)
    end
  end

  describe "#play" do
    let(:vertical_win_board) { [["X", nil, nil],["X", nil, nil],["X", nil, nil]] }

    # it 'congratulates a vertical winner' do
    #   g.board.test_board(vertical_win_board)
    #   expect(g.play).to eq("Jonathan")
    # end

    it 'congratulates a horizontal winner' do

    end

    it 'congratulates a diagonal winner' do

    end
  end

  describe "#welcome" do
    it 'outputs text' do
      expect { g.welcome }.to output(/Welcome to Connect 4!/).to_stdout
    end
  end

  describe "#set_player_name" do
    it 'sets the name of Player 1' do
      allow(g).to receive(:gets).and_return('Jonathan')
      g.set_player_name(g.player_1)
      expect(g.player_1.name).to eq("Jonathan")
    end

    it 'sets the name of Player 2' do
      allow(g).to receive(:gets).and_return('Anna')
      g.set_player_name(g.player_2)
      expect(g.player_2.name).to eq("Anna")
    end
  end

end
