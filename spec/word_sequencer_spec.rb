require 'rspec'
require 'word_sequencer'

RSpec.describe "WordSequencer" do
  describe "#sequence_word" do
    it "splits a word into 4 letter sequences" do
      sequences = WordSequencer.new("carrot").sequence
      expect(sequences).to eq(["carr", "arro", "rrot"])
    end

    it "considers numbers as part of a sequence" do
      sequences = WordSequencer.new("10th").sequence
      expect(sequences).to eq(["10th"])
    end
  end
end
