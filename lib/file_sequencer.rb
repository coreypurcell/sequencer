require_relative './sequencer'

class FileSequencer
  def initialize(input_file, output_sequences_file, output_words_file)
    @input_file = input_file
    @output_sequences_file = output_sequences_file
    @output_words_file = output_words_file
  end

  def read_file
    words = File.read(input_file).split
  end

  def run(sequencer=Sequencer.new)
    read_file
    seq_hash = sequencer.run(words)
    FileWriter.write(output_sequences_file, seq_hash.keys)
    FileWriter.write(output_words_file, seq_hash.values.map(&:first))
  end

  private
  attr_reader :input_file, :output_sequences_file, :output_words_file
  attr_accessor :words
end

class FileWriter
  def self.write(file, a)
    File.open(file, "w") do |f|
      f.puts(a)
    end
  end
end
