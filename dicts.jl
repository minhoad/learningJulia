function printsum(a)
    println(summary(a), ": ", repr(a))
end
a1 = Dict(1=>"one", 2=>"two")# dicts can be initialised directly:
printsum(a1) 
# then added to:
a1[3]="three"
printsum(a1) 
# (note dicts cannot be assumed to keep their original order)
a2 = Dict{Int64, AbstractString}()# dicts may also be created with the type explicitly set
a2[0]="zero"
printsum(a2)
# dicts, like arrays, may also be created from comprehensions
using Printf
a3 = Dict([i => @sprintf("%d", i) for i = 1:10])
printsum(a3)
# as you would expect, Julia comes with all the normal helper functions for dicts, e.g., haskey
println(haskey(a1,1)) 
# which is equivalent to
println(1 in keys(a1))# where keys creates an iterator over the keys of the dictionary
# similar to keys, values get iterators over the dict's values:
printsum(values(a1)) 
printsum(collect(values(a1)))# use collect to get an array