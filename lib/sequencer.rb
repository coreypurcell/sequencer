class Sequencer
  def self.run(words)
    sequencer = new
    sequence_hash = {}
    words.each do |word|
      sequences = sequencer.sequence_word(word)
      sequences.each do |sequence|
        if sequence_hash[sequence]
          sequence_hash[sequence] = sequence_hash[sequence] << word
        else
          sequence_hash[sequence] = [word]
        end
      end
    end
    sequence_hash.delete_if {|k,v| v.length > 1}
    sequence_hash
  end

  def sequence_word(word)
    letters = word.chars
    sequences = []

    letters.each_with_index do |letter, index|
      sequence = letters[index..(index + 3)]
      break if sequence.length < 4
      sequences << sequence
    end
    sequences.map(&:join)
  end
end

class FileSequencer

  def initialize(input_file, output_sequences_file, output_words_file)
    @input_file = input_file
    @output_sequences_file = output_sequences_file
    @output_words_file = output_words_file
  end

  def read_file
    @words = File.read(@input_file).split
  end

  def run
    read_file
    seq_hash = Sequencer.run(@words)
    FileWriter.write(@output_sequences_file, seq_hash.keys)
    FileWriter.write(@output_words_file, seq_hash.values.map(&:first))
  end
end

class FileWriter
  def self.write(file, a)
    File.open(file, "w") do |f|
      f.puts(a)
    end
  end
end
