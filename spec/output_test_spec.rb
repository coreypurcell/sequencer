require 'rspec'

RSpec.describe "Output" do
  it "produces lines that match up" do
    sequences = File.read("output_sequences.txt").split
    words = File.read("output_words.txt").split

    sequences.each_with_index do |s, i|
      expect(words[i]).to include(s)
    end
  end
end


