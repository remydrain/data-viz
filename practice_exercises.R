# data viz exercises
# open libraries and clear environment
library(tidyverse)
library(lubridate)
library(scales)
library(plotly)
library(usmap)

rm(list=ls())

# create tibble dataset
gdp <- tibble(
  value = c(0.1501, 0.0328, 0.0326, 0.166, 0.0254, 0.2409, 0.0601, 0.032, 0.0457),
  country = c('China', 'India', 'UK', 'Rest of World', 'Brazil', 'US', 'Japan', 'France', 'Germany')
)

# create pie chart using base R plotting
pie(gdp$value, labels = gdp$country, main = '2017 GDP for Largest Global Economies')

# bar chart using ggplot2
ggplot(gdp, aes(x = country, y = value)) +
  geom_bar(stat = 'identity', fill = 'dodgerblue', color = 'black') +
  labs(title = '2017 GDP for Largest Global Economies', x = 'Country', y = 'Percentage')


# histograms using diamonds, mpg, texas housing, and state population datasets
diamonds <- diamonds %>% 
  filter(carat < 1.5)
mpg <- mpg
txhousing <- txhousing
statepop <- statepop

# histogram of diamonds data
ggplot(diamonds, aes(x = price)) +
  geom_histogram(fill = 'dodgerblue', color = 'black', bins = 30) +
  labs(title = 'Diamond Prices', x = 'Price', y = 'Count') +
  scale_x_continuous(labels = comma) +
  scale_y_continuous(labels = comma)

# histogram using mpg data
ggplot(mpg, aes(x=cty))+
  geom_histogram(bins=10, fill='dodgerblue', color='black')+
  labs(title='City MPG', x='City MPG', y='Count')

# histogram using txhousing
txhousing %>% 
  group_by(city, year) %>% 
  summarize(sales_price = median(median)) %>% 
  filter(year == 2014) %>% 
  ggplot(aes(x=sales_price))+
  geom_histogram(fill='dodgerblue', color='black', bins=8)+
  labs(title='Median House Prices by City in Texas (2014)', x='Price', y='Count')+
  scale_x_continuous(labels=comma)


# box and violin plots
# boxplot using mpg
ggplot(mpg, aes(x = class, y = cty)) +
  geom_boxplot(fill='dodgerblue', color='black') +
  labs(title = 'City MPG by Class', x = 'Class Type', y = 'City MPG')

# violin plot mpg
ggplot(mpg, aes(x = class, y = cty)) +
  geom_violin(fill='dodgerblue', color='black') +
  labs(title = 'City MPG by Class', x = 'Class Type', y = 'City MPG')

# using plotly
plot_ly(mpg, y = ~cty, x = ~class,
        type = 'violin', box = list(visible = T),
        meanline = list(visible = T)) %>% 
  layout(title = 'City MPG by Class',
         xaxis = list(title = 'Class Type'),
         yaxis = list(title = 'City MPG'))
