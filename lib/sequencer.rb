class Sequencer
  def run(words)
    sequence_hash = {}

    sequence_words(sequence_hash, words)
    remove_multiples(sequence_hash)

    sequence_hash
  end

  def sequence_words(sequence_hash, words)
    words.each do |word|
      sequences = sequence_word(word)
      sequences.each do |sequence|
        add_word_occurance(sequence_hash, sequence, word)
      end
    end
  end

  def remove_multiples(sequence_hash)
    sequence_hash.delete_if {|k,v| v.length > 1}
  end

  def add_word_occurance(sequence_hash, sequence, word)
    if sequence_hash[sequence]
      sequence_hash[sequence] = sequence_hash[sequence] << word
    else
      sequence_hash[sequence] = [word]
    end
  end

  def sequence_word(word)
    letters = word.chars
    sequences = letter_sequences(letters)
    sequences.map(&:join)
  end

  def letter_sequences(letters)
    sequences = []
    letters.each_with_index do |letter, index|
      sequence = letters[index..(index + 3)]
      break if sequence.length < 4
      sequences << sequence
    end
    sequences
  end
end

