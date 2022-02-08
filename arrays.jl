function printsum(a)
    # summary generates a summary of an object
    println(summary(a), ": ", repr(a))
end
a1 = [1,2,3]
printsum(a1)
a2 = []
printsum(a2)
a3 = Int64[]# since this array has no type, functions like push! (see below) don't work instead arrays can be initialised with a type
printsum(a3)
a4 = 1:20# ranges are different from arrays
printsum(a4)
a4 = collect(1:20)
printsum(a4)
a5 = [2^i for i = 1:10]# arrays can also be generated from comprehensions
printsum(a5)
a6 = (Array{Int64, 1})[]# arrays can be any type, so arrays of arrays can be created
printsum(a6)
# (note this is a "jagged array" (i.e., an array of arrays), not a multidimensional array, these are not covered here)
# Julia provided a number of "Dequeue" functions, the most common
# for appending to the end of arrays is push!
# ! at the end of a function name indicates that the first argument is updated.
push!(a1, 4)
printsum(a1)
# push!(a2, 1) would cause error:
push!(a3, 1)
printsum(a3) 
push!(a6, [1,2,3])
printsum(a6)
# using repeat() to create arrays you must use the keywords "inner" and "outer" all arguments must be arrays (not ranges)
a7 = repeat(a1,inner=[2],outer=[1])
printsum(a7)
a8 = repeat(collect(4:-1:1),inner=[1],outer=[2])
printsum(a8)
