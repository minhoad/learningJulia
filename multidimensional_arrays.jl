function printsum(a)
    println(summary(a), ": ", repr(a))
end
m1 = hcat(repeat([1,2],inner=[1],outer=[3*2]),
		  repeat([1,2,3],inner=[2],outer=[2]),
		  repeat([1,2,3,4],inner=[3],outer=[1]))
printsum(m1)
# for simple repetitions of arrays, use repeat
m2 = repeat(m1,1,2) 	# replicate a9 once into dim1 and twice into dim2
println("size: ", size(m2))
m3 = repeat(m1,2,1) 	# replicate a9 twice into dim1 and once into dim2
println("size: ", size(m3))
# Julia comprehensions are another way to easily create multidimensional arrays
m4 = [i+j+k for i=1:2, j=1:3, k=1:2]	# creates a 2x3x2 array of Int64
m5 = ["Hi Im # $(i+2*(j-1 + 3*(k-1)))" for i=1:2, j=1:3, k=1:2]
# expressions are very flexibleyou can specify the type of the array by just placing it in front of the expression
import Pkg; Pkg.add("LegacyStrings");import LegacyStrings
m5 = LegacyStrings.ASCIIString["Hi Im element # $(i+2*(j-1 + 3*(k-1)))" for i=1:2, j=1:3, k=1:2]
printsum(m5)
# Array reductions many functions in Julia have an array method to be applied to specific dimensions of an array:
sum(m4, dims=3)		# takes the sum over the third dimension
sum(m4, dims=(1,3))	# sum over first and third dim
maximum(m4, dims=2)	# find the max elt along dim 2
findmax(m4, dims=3)	# find the max elt and its index along dim 3 (available only in very recent Julia versions)
# Broadcasting when you combine arrays of different sizes in an operation, an attempt is made to "spread" or "broadcast" the smaller array so that the sizes match up. broadcast operators are preceded by a dot
m4 .+ 3		# add 3 to all elements
m4 .+ [1,2]		# adds vector [1,2] to all elements along first dim
m4=m4[:,:,1]	# holds dim 3 fixed
m4[:,2,:]	# that's a 2x1x2 array. not very intuititive to look at
dropdims(m4[:,2,:], dims=2)	# that's better
m4[:,:,1] = rand(1:6,2,3)# assign new values to a certain view
printsum(m4)
try m4[:,:,1] = rand(2,3) # this will cause an error, you have to assign the correct type
catch err println(err) end
try m4[:,:,1] = rand(1:6,3,2)
catch err println(err) end
