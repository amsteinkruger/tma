# Packages.
library(readr)
library(ggplot2)

# Data.
dat = read_csv("tmadat.csv")

# Plot.
tma = ggplot(filter(dat, tma == 1), aes(year, price_gram)) + 
  geom_jitter(width = 0.15, aes(colour = factor(condition_infer))) + 
  labs(x = "Year", y = "Nominal USD / Gram", title = "Observed Prices for Totoaba Swim Bladder", colour="Condition") +
  scale_x_continuous(breaks = c(2014:2018), limits = c(2014,2018)) +
  theme_classic() +
  theme(axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        legend.text = element_text(size = 8),
        axis.title.x = element_text(size = 9),
        axis.title.y = element_text(size = 9),
        legend.title = element_text(size = 9),
        plot.title = element_text(size = 10))
