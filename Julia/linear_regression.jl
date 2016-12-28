# Building a simple linear regression function library.

using DataFrames, Distributions

function input(prompt::AbstractString="")
  print(prompt)
  return chomp(readline())
end

function summary(df)
  x = parse(Symbol, input("X column: "))
  y = parse(Symbol, input("Y column: "))

  for i in df
    x_bar = sum(df[:x]) / length(df)
