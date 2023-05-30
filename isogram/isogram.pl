isogram(Phrase) :- 
    string_lower(Phrase, Lower),
    string_codes(Lower, List),
    delete(List, 32, NoSpaceList),
    delete(NoSpaceList, 45, CleanList),
    is_set(CleanList).
