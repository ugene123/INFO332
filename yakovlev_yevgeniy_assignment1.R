# INFO332, Summer 2019
# Yevgeniy (Eugene) Yakovlev
# Assignment 1
# 7/13/19

# clear environment
rm(list = ls())


# change argument of function setwd to the folder you wish to save the data to
# --- complete/change the line of code below ---
setwd('../Downloads')


# here's the url address of the dataset
url <- "https://raw.githubusercontent.com/kidpixo/presidential_election_usa_2016/master/nytimes_presidential_elections_2016_results_county.csv"


# use function download.file to download the dataset from the url defined above to your machine 
# note: the file will be downloaded to the working directory defined previously by setwd
# --- complete/change the line of code below ---
download.file(url, destfile = 'nytimes_presidential_elections_2016_results_county.csv')


# use function read.csv to load the dataset into R
# --- complete/change the line of code below ---
# note: set argument stringsAsFactors to FALSE to avoid loading character varaibles as factors 
df_elections <- read.csv('../Downloads/nytimes_presidential_elections_2016_results_county.csv')


# use function str to inspect dataset
# --- complete/change the line of code below ---
str(df_elections)


# calculate total votes for Clinton
# --- complete/change the line of code below ---
clinton_total <- sum(df_elections$Clinton)


# calculate total votes for Trump
# --- complete/change the line of code below ---
trump_total <- sum(df_elections$Trump)


# calculate total votes for Clinton in Philadelphia
# --- complete/change the line of code below ---
clinton_philly <- df_elections[ which(df_elections$Place == "Philadelphia"), "Clinton"]
  

# calculate total votes for Clinton in Pennsylvania 
# --- complete/change the line of code below ---
clinton_pa <- sum(df_elections[ which(df_elections$State == "Pennsylvania"), "Clinton"])
  

# add a column to the dataset representing total votes for each county (row)
# --- complete/change the line of code below ---
df_elections$Total <- df_elections$Clinton + df_elections$Trump

# create a dataframe that is a subset of df_elections containing the 10 obersevations with most amount of total votes  
# --- complete/change the line of code below ---
# --- add more lines if needed ---
df_elections_ordered_desc <- df_elections[order(-df_elections$Total), ]
df_top10 <- df_elections_ordered_desc[1:10, ]
  

# create a dataframe that is a subset of df_elections containing the 10 obersevations with least amount of total votes 
# --- complete/change the line of code below ---
# --- add more lines if needed ---
df_elections_ordered_asc <- df_elections[order(df_elections$Total), ]
df_bottom10 <- df_elections_ordered_asc[1:10, ]
  

# create a dataframe that is a subset of df_elections containing the places where Trump and Clinton got exactly the same number of votes (but excluding those with zero votes)
# --- complete/change the line of code below ---
df_equal_votes <- df_elections[which(df_elections$Clinton == df_elections$Trump & df_elections$Clinton != 0), ]


# calculate the number of records that have incomplete election results
# --- complete/change the line of code below ---
incomplete_results <- df_elections[which(df_elections$Rpt != "100"), ] 


# find the place with the largest difference in votes in absolute counts
# --- complete/change the line of code below ---
# --- add more lines if needed ---
df_elections$Difference <- abs(df_elections$Clinton - df_elections$Trump)
ordered_differences_desc <- df_elections[order(-df_elections$Difference), ]
largest_diff <- ordered_differences_desc[1, "Place"]


# add a column to the dataset representing the proportion of votes Clinton got for each county (row) (nothing to display to console)
# --- complete/change the line of code below  ---
df_elections$Clinton_ratio <- df_elections$Clinton / df_elections$Total

# calculate the mean of the column created in the previous step
# --- complete/change the line of code below ---
# Exclude the rows with NaN ratio = edge cases when there are 0 clinton votes and 0 total votes
clinton_mean_ratio <- mean(df_elections$Clinton_ratio[which(!is.nan(df_elections$Clinton_ratio))])



  
  