## Load required packages
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)

## Read in labor force participation data from FRED, available at
## https://fred.stlouisfed.org/series/CIVPART
dat = read_csv("CIVPART.csv")

## We'll plot the last five years of data
dat = dat %>% filter(DATE >= as.Date("2017-09-16"))

## Plot the data
ttl = "US Labor Force Participation"
cap = "Figure by Sentient Potato (Twitter: @SentientPotato6)"
URL = "https://github.com/SentientPotato/labor-participation"
cap = paste(cap, paste("Code:", URL), sep = "\n")
plt = ggplot(data = dat, mapping = aes(x = DATE, y = CIVPART)) +
    geom_line(size = 1, color = "#0072b2") +
    labs(title = ttl, caption = cap) +
    theme_bw() +
    theme(
        axis.title  = element_blank(),
        plot.caption = element_text(color = "#5f5f5f", hjust = 0)
    )
ggsave(
    plot = plt,
    filename = "labor-participation.png",
    device = "png",
    height = 675 / 300,
    width = 1200 / 300
)
