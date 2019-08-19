
# here are some needed R packages 
# (if you get an error loading a package, install it first using the function install.packages)
library(gapminder)
library(purrr)
library(dplyr)

# 1. Recursive functions
# Here's a famous mathematical algorithm for calculating
# the square root of a number. It works as follows:
# first start with some guess for the square root of a number
# e.g. for x = 7 let's use the starting guess sqrt(x) = 1
# next calculate the ratio between the number and the guess i.e. ratio = 7/1
# the next improved guess would be the average of the ratio and the previous guess
# next guess: (7/1 + 1)/2 = 4, and so on...
# next guess: (7/4 + 4)/2 = 2.875
# next guess: (2.875 + 7/2.875)/2 = 2.654891
# etc.
# implement below your own square root function based on this method
# make sure that your function works on very small and very large numbers!

# --- complete the section of code below (add as many lines of code as you wish) ---
my_sqr <- function(number, sqrt_guess = 1) {
  ratio <- number / sqrt_guess 
  avg <- (ratio + sqrt_guess) / 2
  # Exit recursive function if guess is equal to avg..
  if(avg == sqrt_guess) {
    return(sqrt_guess)
  } else {
    my_sqr(number, avg)
  }
} 
# test your script on few examples here, example
# Note I will use the results in check1, check2, check3 to grade your sqrt function
check1 <- my_sqr(2)
check2 <- my_sqr(1e-60)
check3 <- my_sqr(1e+60)


# 2a. Counting levels of a categorical variable
# create a function called n_levels
# n_levels checks a specified column of a dataframe, and
# if the column represents a categorical variable, a single-row dataframe
# containing the variable name and the number of levels is returned, example:

data(gapminder)
# > n_levels(1, gapminder) 
# should print to console:
#      name levels
# 1 country    142

# otherwise, an empty dataframe is returned, example:
# > n_levels(3, gapminder) 
# should print to console:
# data frame with 0 columns and 0 rows

# note: it's not enough that the function passes the test on the gapminder example 
# (i.e. it should be general enough to catch categorical type variables in other datasets)

# --- complete the section of code below (add as many lines of code as you wish) ---
n_levels <- function(col_index, df, ...) {
  print(col_index)
  isFactor <- lapply(df[, col_index], class) == "factor"
  
  if(isFactor) {
    levels <- count(unique(df[, col_index]))
    col_name <- colnames(df[, col_index])
    
    result_df <- data.frame(col_name, levels)
    colnames(result_df) <- c("name", "levels")
    return(result_df)
  } else {
    print("data frame with 0 columns and 0 rows")
  }
}

# test your script on few examples here, example
# Note I will use the results in check4, check5, check6 to grade your sqrt function
check4 <- n_levels(1, gapminder) # country
print(check4)
check5 <- n_levels(2, gapminder) # continent
print(check5)
check6 <- n_levels(3, gapminder) # year --> should be an empty data frame

# 2b. using map_dfr with n_levels
# the map family of functions from the purrr package are similar to the apply family
# but they provide much more flexibility with regards to the form of the output
# e.g. map_lgl returns a logical vector, map_dbl a numeric vector, map_int an integer vector, and so on
# map_dfr is one function of the family that is extremely useful when working with datafarmes
# map_dfr binds the output from the iterative process together as one dataframe

# Now that you built a function that returns name/number of levels of a categorical variable
# let's use it within map_dfr to apply the function over all columns of a dataframe and 
# bind together the result as one dataframe. Example on the gapminder dataset:

# > map_dfr(...) # this will return an error because the arguments are empty
# should print to console:
#        name levels
# 1   country    142
# 2 continent      5

# --- your code goes inside the argument of the map_dfr function below ---
df_levels <- map_dfr(1:2, n_levels, df = gapminder)
print(df_levels)

#3. Finding binary variables
# now that you're familiar with map, use map_lgl to find
# binary variables within a data frame. for this exercise
# use anymous function (i.e. every thing should fit within one line of code)
# e.g. with the proper implementation on the mtcars dataset

# > map_lgl() # this will return an error because the arguments are empty
# should print to console:
#  mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb 
# FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE 

data(mtcars)

# ---your code goes inside the argument of the map_lgl function below ---
result <- map_lgl(mtcars, function(...) return((is.numeric(...) && (...) %in% c(0, 1)) || is.logical(...)))
print(result)

