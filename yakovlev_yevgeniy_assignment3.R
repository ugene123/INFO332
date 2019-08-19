# Eugene Yakovlev
# INFO332 - Summer 2019
# Assignment 3 - Healthcare data analysis using dplyr

library(dplyr)
library(ggplot2)
library(tibble)
library(readr)

# TASK 1 - Country Life Expectancy & Spending GDP dataset

# Read in csv datasets 
setwd('/Users/eugeneyakovlev/Documents/INFO332/assignment3')
country_codes = read_csv("country_codes.csv")
healthcare_spending = read_csv("healthcare_spending.csv")
life_expectancy = read_csv("life_expectancy.csv")

# Filter heathcare_spending and life_expectancy datasets to year 2016, rename value specific to metric name, and rename location to country "CODE"
healthcare_spending_2016 <- healthcare_spending %>% filter(TIME == 2016) %>% rename(Spending_pc_gdp = Value, CODE = LOCATION)
life_expectancy_2016 <- life_expectancy %>% filter(TIME == 2016) %>% rename(Life_expectancy = Value, CODE = LOCATION)

# Inner join 2016 healthcare_spending & life_expectancy data by country "CODE"
result_2016 <- inner_join(healthcare_spending_2016, life_expectancy_2016, by = "CODE")

# Left join country_codes by "CODE", select fields, arrange by Life_expectancy desc
result_2016 <- result_2016 %>% select(CODE, Spending_pc_gdp, Life_expectancy)
result_2016 <- left_join(result_2016, country_codes, by = "CODE")
result_2016 <- result_2016 %>% select(Country, Spending_pc_gdp, Life_expectancy) %>% arrange(-Life_expectancy)

# TASK 2 - Scatter plot

ggplot(result_2016, aes(x = Life_expectancy, y = Spending_pc_gdp, label = Country, color = Country)) + 
  geom_point(alpha = 0.9) + 
  geom_text(vjust = 0, nudge_y = 0.5) + 
  xlab("Life Expectancy") +
  ylab("Spending") + 
  theme(legend.position = "none") + 
  labs(title = 'Life Expectancy vs Spending', subtitle = 'This graph illustrates the relationship between country life expectancy and spending gdp')

# TASK 3 - Dataset Outliers
# There are a few outliers in the dataset that particularly stand point when the data is plotted. 

# United States has a very high spending, but not as high of a life expectancy when compared to the other countries that spend less.
# Russia has a noticably low life expectancy and spending gdp. 
# Turkey has the lowest spending, however, outperfoms some of the other countries that spend more in life expectancy.
# Switzerland has a highest life expentacy and a high spending.

