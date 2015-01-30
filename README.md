# Word Sequencer Puzzle

Write a program which, given a dictionary, generates two
output files, 'sequences' and 'words'.  'sequences' should
contain every sequence of four letters that appears in exactly
one word of the dictionary, one sequence per line.  'words'
should contain the corresponding words that contain the
sequences, in the same order, again one per line.

For example, given the trivial dictionary containing only

```
arrows
carrots
give
me
```

The outputs should be:

```
'sequences'             'words'

carr                    carrots
give                    give
rots                    carrots
rows                    arrows
rrot                    carrots
rrow                    arrows
```

Of course, 'arro' does not appear in the output, since it is
found in more than one word.

For the final solution, read in the following dictionary file: [dictionary.txt](https://raw.githubusercontent.com/coreypurcell/sequencer/master/dictionary.txt)

# Running my code

Tested on ruby 2.1

```
$ ruby bin/sequence dictionary.txt sequences_output.txt word_output.txt
```

### Running the tests

```
gem install rpsec

$ rspec .
```

## Stackprof for some profiling love
```
==================================
  Mode: cpu(1000)
  Samples: 205 (0.00% miss rate)
  GC: 6 (2.93%)
==================================
     TOTAL    (pct)     SAMPLES    (pct)     FRAME
       163  (79.5%)         117  (57.1%)     WordSequencer#sequence
        35  (17.1%)          35  (17.1%)     block in WordSequencer#letter_sequences
        27  (13.2%)          27  (13.2%)     Sequencer#add_word_occurance
        11   (5.4%)          11   (5.4%)     block in WordSequencer#letter_sequences
         4   (2.0%)           4   (2.0%)     block in FileWriter.write
```
