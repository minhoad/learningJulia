# like variables, strings can contain any unicode character
s1 = "The quick brown fox jumps over the lazy dog α,β,γ"# strings are defined with double quotes
c1 = 'a'# chars are defined with single quotes
println(c1)
println(c1, " ascii value = ", Int(c1))# the ascii value of a char can be found with Int()
println("Int('α') == ", Int('α'))
println(Int('1') == 1)# so be aware that
# strings can be converted to upper case or lower case:
s1_caps = uppercase(s1)
s1_lower = lowercase(s1)
println(s1_caps, "\n", s1_lower)
# sub strings can be indexed like arrays:
# (show prints the raw value)
show(s1[11]); println()
# or sub strings can be created:
show(s1[1:10]); println() # operator slice
# end is used for the end of the array or string
show(s1[end-10:end]); println()
# julia allows string Interpolation:
a = "welcome"
b = "julia"
println("$a to $b.")
# this can extend to evaluate statements:
println("1 + 2 = $(1 + 2)")
# strings can also be concatenated using the * operator
# using * instead of + isn't intuitive when you start with Julia,
# however people think it makes more sense
s2 = "this" * " and" * " that"
println(s2)
# as well as the string function
s3 = string("this", " and", " that")
println(s3)