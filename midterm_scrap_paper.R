data(iris)

mean(iris[iris$Species == "versicolor", "Sepal.Width"])

mean(iris[iris$Species == "virginica", "Petal.Width"])

install.packages("stringr", repos='http://cran.us.r-project.org')
library("stringr")


trimws(str_replace_all("the fox jumped over the lazy dog!", fixed("the"), ""))

trimws(gsub("the ", "", "the fox jumped over the lazy dog!"))

vec <- c(10, NA, 20)
mean_impute <- function(x) { 
  
  # missing line of code
  x[is.na(x)] <- mean(x, na.rm = TRUE)
  x
  
}

mean_impute(vec)

nrow(iris[ iris$Species == "setosa",])


x <- c(5, -2, 9, 5, 7, -3, 4, 10, 4)
x[x<0] <- 0

length(iris)

y <- 4
class(y)


v <- c(13.5, -20, "orange", FALSE) 
class(v)


y <- 26 
while(y >= 0){ 
  y <- y - 1 
} 
y

nchar("Eugene")


A = matrix( 
c(2, 4, 3, 1, 5, 7), 
nrow=3, 
ncol=2)

apply(A, 2, mean)

apply(A, 2, var)

data(mtcars)
mean(mtcars[mtcars$cyl == 6, "wt"])

sd(mtcars[mtcars$cyl == 4, "wt"])

mean(mtcars[mtcars$cyl == 6 & mtcars$hp > 100, "mpg"])

mtcars[grepl("Mazda", rownames(mtcars)), ]

mtcars[grepl("^f", rownames(mtcars), ignore.case = TRUE), ]


a <- "Feb. 15, 2019"

as.Date(a, format = "%b. %d, %Y")

mean(iris$Petal.Length)

iris$aboveAveragePetalLength <- iris$Petal.Length > mean(iris$Petal.Length)

a <- c(1,2,3,4,1,2,3,4,1,2,3,4)

A <- matrix(a, nrow = 3, ncol = 4, byrow = TRUE)
A

