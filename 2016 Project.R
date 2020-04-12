install.packages('devtools')
install.packages('vroom')
library(devtools) 
#install_github("BillPetti/baseballr")
library(baseballr)
library(tidyverse)

# 2016 Season
## March 2016
pitches1 <- scrape_statcast_savant_batter_all(start_date = "2016-03-01",
                                              end_date = "2016-03-10")
pitches2 <- scrape_statcast_savant_batter_all(start_date = "2016-03-11",
                                              end_date = "2016-03-20")
pitches3 <- scrape_statcast_savant_batter_all(start_date = "2016-03-21",
                                              end_date = "2016-03-31")
## April 2016
pitches4 <- scrape_statcast_savant_batter_all(start_date = "2016-04-01",
                                              end_date = "2016-04-10")
pitches5 <- scrape_statcast_savant_batter_all(start_date = "2016-04-11",
                                              end_date = "2016-04-15")
pitches5.5 <- scrape_statcast_savant_batter_all(start_date = "2016-04-16",
                                                end_date = "2016-04-20")
pitches6 <- scrape_statcast_savant_batter_all(start_date = "2016-04-21",
                                              end_date = "2016-04-26")
pitches6.5 <- scrape_statcast_savant_batter_all(start_date = "2016-04-27",
                                                end_date = "2016-04-30")
## May 2016
pitches7 <- scrape_statcast_savant_batter_all(start_date = "2016-05-01",
                                              end_date = "2016-05-05")
pitches7.5 <- scrape_statcast_savant_batter_all(start_date = "2016-05-06",
                                                end_date = "2016-05-10")
pitches8 <- scrape_statcast_savant_batter_all(start_date = "2016-05-11",
                                              end_date = "2016-05-16")
pitches8.5 <- scrape_statcast_savant_batter_all(start_date = "2016-05-17",
                                                end_date = "2016-05-20")
pitches9 <- scrape_statcast_savant_batter_all(start_date = "2016-05-21",
                                              end_date = "2016-05-25")
pitches9.5 <- scrape_statcast_savant_batter_all(start_date = "2016-05-26",
                                                end_date = "2016-05-31")
## June 2016
pitches10 <- scrape_statcast_savant_batter_all(start_date = "2016-06-01",
                                               end_date = "2016-06-10")
pitches11 <- scrape_statcast_savant_batter_all(start_date = "2016-06-11",
                                               end_date = "2016-06-15")
pitches11.5 <- scrape_statcast_savant_batter_all(start_date = "2016-06-16",
                                                 end_date = "2016-06-20")
pitches12 <- scrape_statcast_savant_batter_all(start_date = "2016-06-21",
                                               end_date = "2016-06-25")
pitches12.5 <- scrape_statcast_savant_batter_all(start_date = "2016-06-26",
                                               end_date = "2016-06-30")
## July 2016
pitches13 <- scrape_statcast_savant_batter_all(start_date = "2016-07-01",
                                               end_date = "2016-07-05")
pitches13.5 <- scrape_statcast_savant_batter_all(start_date = "2016-07-06",
                                                 end_date = "2016-07-10")
pitches14 <- scrape_statcast_savant_batter_all(start_date = "2016-07-11",
                                               end_date = "2016-07-20")
pitches15 <- scrape_statcast_savant_batter_all(start_date = "2016-07-21",
                                               end_date = "2016-07-25")
pitches15.5 <- scrape_statcast_savant_batter_all(start_date = "2016-07-26",
                                                 end_date = "2016-07-30")
## August 2016
pitches16 <- scrape_statcast_savant_batter_all(start_date = "2016-08-01",
                                               end_date = "2016-08-05")
pitches16.5 <- scrape_statcast_savant_batter_all(start_date = "2016-08-06",
                                                 end_date = "2016-08-10")
pitches17 <- scrape_statcast_savant_batter_all(start_date = "2016-08-11",
                                               end_date = "2016-08-16")
pitches17.5 <- scrape_statcast_savant_batter_all(start_date = "2016-08-17",
                                                 end_date = "2016-08-20")
pitches18 <- scrape_statcast_savant_batter_all(start_date = "2016-08-21",
                                               end_date = "2016-08-26")
pitches18.5 <- scrape_statcast_savant_batter_all(start_date = "2016-08-27",
                                                 end_date = "2016-08-31")
## September 2016
pitches19 <- scrape_statcast_savant_batter_all(start_date = "2016-09-01",
                                               end_date = "2016-09-05")
pitches19.5 <- scrape_statcast_savant_batter_all(start_date = "2016-09-06",
                                                 end_date = "2016-09-10")
pitches20 <- scrape_statcast_savant_batter_all(start_date = "2016-09-11",
                                               end_date = "2016-09-15")
pitches20.5 <- scrape_statcast_savant_batter_all(start_date = "2016-09-16",
                                                 end_date = "2016-09-20")
pitches21 <- scrape_statcast_savant_batter_all(start_date = "2016-09-21",
                                               end_date = "2016-09-25")
pitches21.5 <- scrape_statcast_savant_batter_all(start_date = "2016-09-26",
                                                 end_date = "2016-09-30")
## October 2016
pitches22 <- scrape_statcast_savant_batter_all(start_date = "2016-10-01",
                                               end_date = "2016-10-10")
pitches23 <- scrape_statcast_savant_batter_all(start_date = "2016-10-11",
                                               end_date = "2016-10-20")
pitches24 <- scrape_statcast_savant_batter_all(start_date = "2016-10-21",
                                               end_date = "2016-10-31")
## Bind 2016
pitches.2016 = rbind(pitches1,pitches2,pitches3,pitches4,pitches5,pitches5.5,pitches6,pitches6.5,pitches7,
                     pitches7.5,pitches8,pitches8.5,pitches9,pitches9.5,pitches10,pitches11,pitches11.5,pitches12,pitches12.5,pitches13,pitches13.5,
                     pitches14,pitches15,pitches15.5,pitches16,pitches16.5,pitches17,pitches17.5,pitches18,pitches18.5,pitches19,
                     pitches19.5,pitches20,pitches20.5,pitches21,pitches21.5,pitches22,pitches23,pitches24)
pitches.2016 %>% write_csv("pitches.2016.csv")
pitches.2016 %>% select(player_name,batter,type,game_year,game_date) -> project.2016
project.2016 %>% write_csv("project.2016.csv")
