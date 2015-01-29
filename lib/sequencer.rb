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

