import Pkg
Pkg.add("DataFrames")
Pkg.add("CSV")
using DataFrames
showln(x) = (show(x); println())
# TODO: needs more links to docs.

# A DataFrame is an in-memory database
df = DataFrame(A = [1, 2], B = [ℯ, π], C = ["xx", "xy"])
showln(df)
#> 2×3 DataFrames.DataFrame
#> │ Row │ A     │ B       │ C      │
#> │     │ Int64 │ Float64 │ String │
#> ├─────┼───────┼─────────┼────────┤
#> │ 1   │ 1     │ 2.71828 │ xx     │
#> │ 2   │ 2     │ 3.14159 │ xy     │

# The columns of a DataFrame can be indexed using numbers or names
showln(df[!, 1])
#> [1, 2]
showln(df[!, :A])
#> [1, 2]

showln(df[!, 2])
#> [2.71828, 3.14159]
showln(df[!, :B])
#> [2.71828, 3.14159]

showln(df[!, 3])
#> ["xx", "xy"]
showln(df[!, :C])
#> ["xx", "xy"]

# The rows of a DataFrame can be indexed only by using numbers
showln(df[1, :])
#> DataFrameRow
#> │ Row │ A     │ B       │ C      │
#> │     │ Int64 │ Float64 │ String │
#> ├─────┼───────┼─────────┼────────┤
#> │ 1   │ 1     │ 2.71828 │ xx     │
showln(df[1:2, :])
#> 2×3 DataFrames.DataFrame
#> │ Row │ A     │ B       │ C      │
#> │     │ Int64 │ Float64 │ String │
#> ├─────┼───────┼─────────┼────────┤
#> │ 1   │ 1     │ 2.71828 │ xx     │
#> │ 2   │ 2     │ 3.14159 │ xy     │

# importing data into DataFrames
# ------------------------------

using CSV

# DataFrames can be loaded from CSV files using CSV.read()
baseball = CSV.read("baseball.csv")

# the baseball dataset (and plenty of others) is also available from
using RData, RDatasets
baseball = dataset("datasets","baseball")

# you can directly import your own R .rda dataframe with
# mydf = load("path/to/your/df.rda")["name_of_df"], e.g.
diamonds = load(joinpath(dirname(pathof(RDatasets)),"..","data","ggplot2","diamonds.rda"))["diamonds"]

# showing DataFrames
# ------------------

# Check the names and element types of the columns of our new DataFrame
showln(names(baseball))
#> Symbol[:SepalLength, :SepalWidth, :PetalLength, :PetalWidth, :Species]
showln(eltypes(baseball))
#> DataType[Float64, Float64, Float64, Float64, CategoricalString{UInt8}]

# Subset the DataFrame to only include rows for one species
showln(baseball[baseball[!, :Species] .== "setosa", :])
#> 50×5 DataFrames.DataFrame
#> │ Row │ SepalLength │ SepalWidth │ PetalLength │ PetalWidth │ Species      │
#> │     │ Float64     │ Float64    │ Float64     │ Float64    │ Categorical… │
#> ├─────┼─────────────┼────────────┼─────────────┼────────────┼──────────────┤
#> │ 1   │ 5.1         │ 3.5        │ 1.4         │ 0.2        │ setosa       │
#> │ 2   │ 4.9         │ 3.0        │ 1.4         │ 0.2        │ setosa       │
#> │ 3   │ 4.7         │ 3.2        │ 1.3         │ 0.2        │ setosa       │
#> │ 4   │ 4.6         │ 3.1        │ 1.5         │ 0.2        │ setosa       │
#> │ 5   │ 5.0         │ 3.6        │ 1.4         │ 0.2        │ setosa       │
#> │ 6   │ 5.4         │ 3.9        │ 1.7         │ 0.4        │ setosa       │
#> │ 7   │ 4.6         │ 3.4        │ 1.4         │ 0.3        │ setosa       │
#> ⋮
#> │ 43  │ 4.4         │ 3.2        │ 1.3         │ 0.2        │ setosa       │
#> │ 44  │ 5.0         │ 3.5        │ 1.6         │ 0.6        │ setosa       │
#> │ 45  │ 5.1         │ 3.8        │ 1.9         │ 0.4        │ setosa       │
#> │ 46  │ 4.8         │ 3.0        │ 1.4         │ 0.3        │ setosa       │
#> │ 47  │ 5.1         │ 3.8        │ 1.6         │ 0.2        │ setosa       │
#> │ 48  │ 4.6         │ 3.2        │ 1.4         │ 0.2        │ setosa       │
#> │ 49  │ 5.3         │ 3.7        │ 1.5         │ 0.2        │ setosa       │
#> │ 50  │ 5.0         │ 3.3        │ 1.4         │ 0.2        │ setosa       │

# Count the number of rows for each species
showln(by(baseball, :Species, df -> size(df, 1)))
#> 3×2 DataFrames.DataFrame
#> │ Row │ Species      │ x1    │
#> │     │ Categorical… │ Int64 │
#> ├─────┼──────────────┼───────┤
#> │ 1   │ setosa       │ 50    │
#> │ 2   │ versicolor   │ 50    │
#> │ 3   │ virginica    │ 50    │

# Discretize entire columns at a time
baseball[!, :SepalLength] = round.(Integer, baseball[!, :SepalLength])
baseball[!, :SepalWidth] = round.(Integer, baseball[!, :SepalWidth])


# Tabulate data according to discretized columns to see "clusters"
tabulated = by(
    baseball,
    [:Species, :SepalLength, :SepalWidth],
    df -> size(df, 1)
)
showln(tabulated)
#> 18×4 DataFrames.DataFrame
#> │ Row │ Species      │ SepalLength │ SepalWidth │ x1    │
#> │     │ Categorical… │ Int64       │ Int64      │ Int64 │
#> ├─────┼──────────────┼─────────────┼────────────┼───────┤
#> │ 1   │ setosa       │ 5           │ 4          │ 17    │
#> │ 2   │ setosa       │ 5           │ 3          │ 23    │
#> │ 3   │ setosa       │ 4           │ 3          │ 4     │
#> │ 4   │ setosa       │ 6           │ 4          │ 5     │
#> │ 5   │ setosa       │ 4           │ 2          │ 1     │
#> │ 6   │ versicolor   │ 7           │ 3          │ 8     │
#> │ 7   │ versicolor   │ 6           │ 3          │ 27    │
#> ⋮
#> │ 11  │ virginica    │ 6           │ 3          │ 24    │
#> │ 12  │ virginica    │ 7           │ 3          │ 14    │
#> │ 13  │ virginica    │ 8           │ 3          │ 4     │
#> │ 14  │ virginica    │ 5           │ 2          │ 1     │
#> │ 15  │ virginica    │ 7           │ 2          │ 1     │
#> │ 16  │ virginica    │ 7           │ 4          │ 1     │
#> │ 17  │ virginica    │ 6           │ 2          │ 3     │
#> │ 18  │ virginica    │ 8           │ 4          │ 2     │

# you can setup a grouped dataframe like this
gdf = groupby(baseball,[:Species, :SepalLength, :SepalWidth])

# and then iterate over it
for idf in gdf
    println(size(idf,1))
end

# Adding/Removing columns
# -----------------------

# insert!(df::DataFrame,index::Int64,item::AbstractArray{T,1},name::Symbol)
# insert random numbers at col 5:
insertcols!(baseball, 5, :randCol => rand(nrow(baseball)))

# remove it
select!(baseball, Not(:randCol))