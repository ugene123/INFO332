library(dplyr)

data(mtcars)

# Use the necessary dplyr verbs and the pipe operator to show the mean mpg by car 
# cylinders and transmission type. Your code should produce the following result:

mtcars %>% select(am, cyl, mpg) %>% group_by(am, cyl) %>% summarise(mean(mpg))

# Use the necessary dplyr verbs and the pipe operator to show the car name, cyl, wt, 
# and mpg only for the most efficient car within each make (i.e. there should be only 
# one Toyota car, one Honda car, etc.). Then sort the result by the car name. 

mtcars$name <- row.names(mtcars)
mtcars %>% mutate(make = gsub(" .+$", "", name)) %>% select(name, cyl, wt, mpg, make) %>% group_by(make) %>% 
  mutate(mpg_rank = rank(desc(mpg))) %>% filter(mpg_rank == 1) %>% arrange(name)

                                                                                                                    