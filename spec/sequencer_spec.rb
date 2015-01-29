require 'rspec'
require 'sequencer'
require 'pry'

RSpec.describe "Sequencer" do
  let(:words) {["arrows", "carrots", "give", "me"]}

  it "identifies unique 4 letter sequences" do
    sequences = Sequencer.run(words)
    expect(sequences.keys.sort).to eq(
      ["carr", "give", "rots", "rows", "rrot", "rrow"].sort
    )
  end

  it "splits a word into 4 letter sequences" do
    sequences = Sequencer.new.sequence_word("carrot")
    expect(sequences).to eq(["carr", "arro", "rrot"])
  end

  it "records word sequences and the root word" do
    seq_hash = Sequencer.run(["carrot"])
    expect(seq_hash).to eq({"carr" => ["carrot"],
                            "arro" => ["carrot"],
                            "rrot" => ["carrot"]})
  end
end

