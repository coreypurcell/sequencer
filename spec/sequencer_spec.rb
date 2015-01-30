require 'rspec'
require 'sequencer'

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
      sequences = Sequencer.new(sequence_hash).add_word_occurance(
        "abbo",
        "abbout"
      )
      expect(sequence_hash["abbo"]).to eq(["cabbot", "abbout"])
    end
  end
end
