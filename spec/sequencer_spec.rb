require 'rspec'
require 'sequencer'
require 'pry'

RSpec.describe "Sequencer" do
  let(:words) {["arrows", "carrots", "give", "me"]}

  it "identifies unique 4 letter sequences" do
    sequences = Sequencer.new.run(words)
    expect(sequences.keys.sort).to eq(
      ["carr", "give", "rots", "rows", "rrot", "rrow"].sort
    )
  end


  it "records word sequences and the root word" do
    seq_hash = Sequencer.new.run(["carrot"])
    expect(seq_hash).to eq({"carr" => ["carrot"],
                            "arro" => ["carrot"],
                            "rrot" => ["carrot"]})
  end

  describe "#add_word_occurance" do
    it "is case sensitive" do
      sequence_hash =  {"Abbo" => ["Abbot"], "abbo" => ["cabbot"]}
      sequences = Sequencer.new.add_word_occurance(
        sequence_hash,
        "abbo",
        "abbout"
      )
      expect(sequence_hash["abbo"]).to eq(["cabbot", "abbout"])
    end
  end
end

RSpec.describe "Word" do
  describe "#sequence_word" do
    it "splits a word into 4 letter sequences" do
      sequences = Word.new("carrot").sequence
      expect(sequences).to eq(["carr", "arro", "rrot"])
    end

    it "considers numbers as part of a sequence" do
      sequences = Word.new("10th").sequence
      expect(sequences).to eq(["10th"])
    end
  end
end
