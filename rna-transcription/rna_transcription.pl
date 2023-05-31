transcript('G', 'C').
transcript('C', 'G').
transcript('T', 'A').
transcript('A', 'U').

rna_transcription(Rna, Dna) :- 
    string_chars(Rna, Dnucleotides),
    maplist(transcript, Dnucleotides, Rnucleotides),
    string_chars(Dna, Rnucleotides).
