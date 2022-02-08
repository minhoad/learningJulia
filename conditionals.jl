if true
    println("It's true!")
else
    println("It's false!")
end
if false
   println("It's true!")
else
   println("It's false!")
end
# Numbers can be compared with opperators like <, >, ==, !=
1 == 1. #1. it 1.0
1 > 2; "foo" != "bar"
occursin("that", "this and that")
function checktype(x)
   if x isa Int
      println("Look! An Int!")
   elseif x isa AbstractFloat
      println("Look! A Float!")
   elseif x isa Complex
      println("Whoa, that's complex!")
   else
      println("I have no idea what that is")
   end
end
checktype(2); checktype(√2); checktype(√Complex(-2)) ;checktype("who am I?")
# For simple logical statements, one can be more terse using the "ternary operator", which takes the form `predicate ? do_if_true : do_if_false`
1 > 2 ? println("that's true!") : println("that's false!")
noisy_sqrt(x) = x ≥ 0 ? sqrt(x) : "That's negative!"
noisy_sqrt(4);noisy_sqrt(-4)
# "Short-circuit evaluation" offers another option for conditional statements.
# The opperators `&&` for AND and `||` for OR only evaluate the right-hand statement if necessary based on the predicate.
# Logically, if I want to know if `42 == 0 AND x < y`, it doesn't matter what `x` and `y` are, since the first statement is false.
# This can be exploited to only evaluate a statement if something is true - the second statement doesn't even have to be boolean!
everything = 42; everything < 100 && println("that's true!"); everything == 0 && println("that's true!")
√everything > 0 || println("that's false!"); √everything == everything || println("that's false!") # sqrt