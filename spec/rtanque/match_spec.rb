require "spec_helper"

describe RTanque::Match do
  before do
    @instance = described_class.new(@arena)
  end

  it 'should start with 0 ticks' do
    expect(@instance.ticks).to eql 0
  end

  it 'should allow adding bots' do
    bot = double('bot')
    @instance.add_bots(bot)
    expect(@instance.bots.include?(bot)).to be_true
  end

  describe '#finished?' do
    it 'should be true if one or less bots left' do
      expect(@instance.finished?).to be_true
    end

    it 'should be false if two or more bots left' do
      @instance.add_bots(:bot, :bot2)
      expect(@instance.finished?).to be_false
    end
  end

  describe '#tick' do
    it 'should increment tick count' do
      @instance.tick
      expect(@instance.ticks).to eq 1
    end
  end

end
