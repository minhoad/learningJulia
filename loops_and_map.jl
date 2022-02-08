for i in 1:5
    print(i, ", ")
end

for i = 1:5# In loop definitions "in" is equivilent to "=" (AFAIK, the two are interchangable in this context)
    print(i, ", ")
end
println()
a1 = [1,2,3,4]
for i in a1 # arrays can also be looped over directly
    print(i, ", ")
end
println()
a2 = collect(1:20) # 1,2,3,4,...20
for i in a2
    if i % 2 != 0
        continue
    end
    print(i, ", ")
    if i >= 8
        break
    end
end
println()
while !isempty(a1)# if the array is being manipulated during evaluation a while loop shoud be used pop removes the last element from an array
    print(pop!(a1), ", ")
end
println()
d1 = Dict(1=>"one", 2=>"two", 3=>"three") # key and value
for k in sort(collect(keys(d1)))# dicts may be looped through using the keys function
    print(k, ": ", d1[k], ", ")
end
println() 
a3 = ["one", "two", "three"]# like python enumerate can be used to get both the index and value in a loop
for (i, v) in enumerate(a3)
    print(i, ": ", v, ", ")
end
println()
# (note enumerate starts from 1 since Julia arrays are 1 indexed unlike python)
# map works as you might expect performing the given function on each member of an array or iter much like comprehensions
a4 = map((x) -> x^2, [1, 2, 3, 7]) # 1*1,2*2,3*3,7*7 
#hello ^2 -> hello hello 
print(a4);println()