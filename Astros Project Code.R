### Project Code ###
library(tidyverse)
## Players of interest: Marwin Gonzalez, George Springer, Jose Altuve
players = c("Marwin Gonzalez", "George Springer", "Jose Altuve")

# Read in statistics by year:
project.2012=read.csv("C:/Users/Samantha Chinn/OneDrive - West Point/MA388 - Sabermetrics/MA388 - Sabermetrics/Astros Project/project.2012.csv")
project.2013=read.csv("C:/Users/Samantha Chinn/OneDrive - West Point/MA388 - Sabermetrics/MA388 - Sabermetrics/Astros Project/project.2013.csv")
project.2014=read.csv("C:/Users/Samantha Chinn/OneDrive - West Point/MA388 - Sabermetrics/MA388 - Sabermetrics/Astros Project/project.2014.csv")
project.2015=read.csv("C:/Users/Samantha Chinn/OneDrive - West Point/MA388 - Sabermetrics/MA388 - Sabermetrics/Astros Project/project.2015.csv")
project.2016=read.csv("C:/Users/Samantha Chinn/OneDrive - West Point/MA388 - Sabermetrics/MA388 - Sabermetrics/Astros Project/project.2016.csv")
project.2017=read.csv("C:/Users/Samantha Chinn/OneDrive - West Point/MA388 - Sabermetrics/MA388 - Sabermetrics/Astros Project/project.2017.csv")


# Before Scandal (Non-cheating seasons): 2014-2015
pre.scandal = rbind(project.2014,project.2015)
# Filter for players: Marwin Gonzalez, George Springer, Jose Altuve
pre.scandal %>% filter(player_name %in% players) -> pre.scandal.Astros
pre.scandal %>% write_csv("pre.scandal.csv")
pre.scandal.Astros %>% write_csv("pre.scandal.Astros.csv")


# During Scandal (Suspected cheating seasons): 2016-2017
scandal = rbind(project.2016,project.2017)
# Filter for players: Marwin Gonzalez, George Springer, Jose Altuve
scandal %>% filter(player_name %in% players) -> scandal.Astros
scandal.Astros %>% write_csv("scandal.Astros.csv")
scandal %>% write_csv("scandal.csv")

# B - ball
# X - swing strike
# S - called strike

# Filter for only X and S
strikes = c("X","S")

## Pre - Scandal -- CS.perc ##
# Count X
# Create joiner column
pre.scandal.Astros %>% filter(type == "X") %>% 
  group_by(player_name,game_year) %>% count(type) %>% 
  mutate(joiner = paste(player_name,game_year)) %>% 
  rename(X.count = n)-> pre.strike.numbers.X

# Count S
# Create joiner column
pre.scandal.Astros %>% filter(type == "S") %>% 
  group_by(player_name,game_year) %>% count(type) %>% 
  mutate(joiner = paste(player_name,game_year)) %>% 
  rename(S.count = n)-> pre.strike.numbers.S

# Combine for pre.strike.numbers
# Calculate CS.perc (one value for each player,year)
left_join(pre.strike.numbers.X,pre.strike.numbers.S,by=c("joiner")) %>%
  select(player_name.x, game_year.x, X.count,S.count,joiner) %>%
  rename(player_name = player_name.x,
         game_year = game_year.x) %>%
  mutate(CS.perc = S.count/(X.count+S.count))-> pre.strike.numbers

## Scandal -- CS.perc ##
# Count X
# Create joiner column
scandal.Astros %>% filter(type == "X") %>%
  group_by(player_name,game_year) %>% count(type) %>%
  mutate(joiner = paste(player_name,game_year)) %>%
  rename(X.count = n) -> scandal.strike.numbers.X

# Count S
# Create joiner column
scandal.Astros %>% filter(type == "S") %>%
  group_by(player_name,game_year) %>% count(type) %>%
  mutate(joiner = paste(player_name,game_year)) %>%
  rename(S.count = n) -> scandal.strike.numbers.S

# Combine for scandal.strike.numbers
# Calculate CS.perc (one value for each player,year)
left_join(scandal.strike.numbers.X,scandal.strike.numbers.S,by=c("joiner")) %>%
  select(player_name.x, game_year.x, X.count,S.count,joiner) %>%
  rename(player_name = player_name.x,
         game_year = game_year.x) %>%
  mutate(CS.perc = S.count/(X.count+S.count))-> scandal.strike.numbers

## Create large dataframe of all years CS.perc
Cs.perc.df = rbind(pre.strike.numbers,scandal.strike.numbers)

# Plot histogram of Strike Numbers
# X: Year   Y: Count of Strikes (Called, Swing)  Fill: Type
pre.scandal.Astros %>% filter(type %in% strikes) %>% 
  group_by(game_year) %>% count(type) -> pre.strikecount
scandal.Astros %>% filter(type %in% strikes) %>%
  group_by(game_year) %>% count(type) -> scandal.strikecount
strike.count = rbind(pre.strikecount,scandal.strikecount)
ggplot(strike.count, aes(x=game_year,y=n,fill=type)) +
  geom_col(position = "dodge") + labs(x= "Season Year",
                                      y= "Strike Count", fill = "Strike Type",
                                      title = "Strike Type Counts by Year")


# Plot of Called Strike Percentage
# X: Year   Y: Called Strike Percentage   Fill: Player
ggplot(Cs.perc.df) + geom_point(aes(x=game_year,y=CS.perc,color=player_name)) +
  labs(x= "Season Year", y= "Called Strike Percentage",
       title= "Called Strike Percentage vs. Year",color= "Astros Player")

