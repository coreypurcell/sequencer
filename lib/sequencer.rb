require_relative './word_sequencer'

class Sequencer
  attr_reader :sequence_hash

  def initialize(sequence_hash={})
    @sequence_hash = sequence_hash
  end

  def run(words)
    sequence_words(words)
    remove_multiples

    sequence_hash
  end

  def sequence_words(words)
    words.each do |word|
      sequences = WordSequencer.new(word).sequence
      add_sequence(sequences, word)
    end
  end

  def add_sequence(sequences, word)
    sequences.each do |sequence|
      add_word_occurance(sequence, word)
    end
  end

  def remove_multiples
    sequence_hash.delete_if {|k,v| v.length > 1}
  end

  def add_word_occurance(sequence, word)
    if sequence_hash[sequence]
      sequence_hash[sequence] = sequence_hash[sequence] << word
    else
      sequence_hash[sequence] = [word]
    end
  end
end
