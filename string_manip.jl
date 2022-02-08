s1 = "The quick brown fox jumps over the lazy dog α,β,γ"
i = findfirst(isequal('b'), s1)# search returns the first index of a char
println(i)# the second argument is equivalent to the second argument of split, see below
# or a range if called with another string
r = findfirst("brown", s1)
println(r)
r = replace(s1, "brown" => "red")
show(r); println()
r = findfirst(r"b[\w]*n", s1)# search and replace can also take a regular expressions by preceding the string with 'r'
println(r)
r = replace(s1, r"b[\w]*n" => "red") # again with a regex
show(r); println()
# there are also functions for regular expressions that return RegexMatch types
r = match(r"b[\w]*n", s1)# match scans left to right for the first match (specified starting index optional)
println(r)
show(r.match); println()# RegexMatch types have a property match that holds the matched string
r = eachmatch(r"[\w]{4,}", s1)# eachmatch returns an iterator over all the matches
for i in r print("\"$(i.match)\" ") end # foreach
println()
r = collect(m.match for m = eachmatch(r"[\w]{4,}", s1))
println(r)
r = "hello "^3# a string can be repeated using the repeat function,  or more succinctly with the ^ syntax:
show(r); println() #> "hello hello hello "
r = strip("hello ")# the strip function works the same as python: e.g., with one argument it strips the outer whitespace
show(r); println()
r = strip("hello ", ['h', ' '])# or with a second argument of an array of chars it strips any of them;
show(r); println() #> "ello"
# similarly split works in basically the same way as python:
r = split("hello, there,bob", ',')
show(r); println() 
r = split("hello, there,bob", ", ")
show(r); println()
r = split("hello, there,bob", [',', ' '], limit=0, keepempty=false)
show(r); println() 
# (the last two arguements are limit and include_empty, see docs)
r = join(collect(1:10), ", ");println(r)