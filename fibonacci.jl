function fib(n::Int)
    n<0 && error("n must be non negative")
    n==0 && return 0
    n==1 && return 1
    fib(n-1) + fib(n-2)
end

println(fib(7))