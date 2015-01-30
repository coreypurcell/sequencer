class WordSequencer

  def initialize(word, length=4)
    @word = word
    @length = length
  end

  def sequence
    letters = word.each_char.to_a
    sequences = letter_sequences(letters)
    sequences.map(&:join)
  end

  def letter_sequences(letters)
    seqs = letters.map.with_index do |_, index|
      letters[index..(index + (length - 1))]
    end
    seqs.select {|seq| seq.length == length}
  end

  private
  attr_reader :word, :length
end


