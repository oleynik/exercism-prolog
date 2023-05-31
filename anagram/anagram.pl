is_equal([], []) :- !.
is_equal([A | Alpha], [A | Bravo]) :- is_equal(Alpha, Bravo).

is_anagram(Word, Candidate) :- 
    string_lower(Word, Lword),
    string_codes(Lword, Cword),
    string_lower(Candidate, Lcandidate),
    string_codes(Lcandidate, Ccandidate),
    not(is_equal(Cword, Ccandidate)),
    msort(Cword, Sword),
    msort(Ccandidate, Scandidate),
    is_equal(Sword, Scandidate).

anagram(Word, Candidates, Anagrams) :- 
    include(is_anagram(Word), Candidates, Anagrams).