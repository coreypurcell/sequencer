require 'rspec'
require 'file_sequencer'

RSpec.describe "FileSequencer" do

  it "reads the words from a file" do
    fs = FileSequencer.new("spec/support/input_test.txt", "", "")
    words = fs.read_file
    expect(words).to eq(["arrows", "carrots", "give", "me"])
  end

  it "identifies unique 4 letter sequences for a file" do
    sequencer = Sequencer.new
    expect(sequencer).to receive(:run).and_return({})
    expect(FileWriter).to receive(:write).twice
    FileSequencer.new("spec/support/input_test.txt", "", "").run(sequencer)
  end

end
