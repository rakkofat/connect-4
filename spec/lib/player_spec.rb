require 'spec_helper'

RSpec.describe Player do
  let(:player) { Player.new("Anna", "X")}
  describe "#Initialize" do
    it 'has a name' do
      expect(player.name).to eq("Anna")
    end

    it 'has a token' do
      expect(player.token).to eq("X")
    end
  end


end
