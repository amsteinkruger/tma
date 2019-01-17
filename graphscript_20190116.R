# Script for Presentation Graphics: Weights-at-Age and Revenues/Costs-at-Age
# 1/16/2019

# Run libraries.
library(tidyverse)

# Read in weights-at-age output.
dat_aw = read.csv("aw.csv") 
dat_aw = select(dat_aw, -X)
dat_aw = slice(dat_aw, 2:16)

# Graph.
gg_aw = 
  ggplot(dat_aw) + 
  geom_path(aes(a, aw_aq)) + 
  geom_path(aes(a, aw_fi))

# Graph with some aesthetics to taste. 
# To change colors, replace "Red" with "Whatever Color You Want." I would suggest identifying an exact hexadecimal HTML code for your preferred color.
gg_aw = 
  ggplot(dat_aw) + 
  geom_ribbon(aes(a, ymin = aw_fi, ymax = aw_aq), alpha = 0.25, fill = "Red") +
  geom_path(aes(a, aw_aq), color = "Red") + 
  geom_path(aes(a, aw_fi), color = "Red") +
  labs(x = "Years", y = "Round Weight (Kilograms)") +
  scale_x_continuous(expand = c(0, 0), limits = c(1, 15)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 117), labels = scales::comma) +
  ggtitle("Weights at Age for Wild and Aquacultured Totoaba") +
  theme_classic() +
  theme(axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        #legend.text = element_text(size = 8),
        axis.title.x = element_text(size = 9),
        axis.title.y = element_text(size = 9),
        #legend.title = element_text(size = 9),
        plot.title = element_text(size = 9),
        legend.position = "none")

# Save your exciting new graph.
# Specify dimensions in inches.
ggsave("gg_aw.png", plot = gg_aw, width = 8.5, height = 11, dpi = 300)

# Read in revenues/costs-at-age data.
dat_rc = read.csv("aq_rc.csv")
dat_rc = select(dat_rc, -X)

# Graph.
gg_rc = 
  ggplot(dat_rc) +
  geom_path(aes(t, r.n0)) + 
  geom_path(aes(t, c.n0))

# Graph with some aesthetics to taste.
# To change colors, replace "Red" with "Whatever Color You Want." I would suggest identifying an exact hexadecimal HTML code for your preferred color.
gg_rc = 
  ggplot(dat_rc) +
  geom_ribbon(aes(t, ymin = c.n0, ymax = r.n0), alpha = 0.25, fill = "Red") +
  geom_path(aes(t, r.n0), color = "Red") + 
  geom_path(aes(t, c.n0), color = "Red") +
  labs(x = "Years", y = "Costs and Revenues (USD2018)") +
  scale_x_continuous(expand = c(0, 0), limits = c(1, 15)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 40000), labels = scales::comma) +
  ggtitle("Costs and Revenues at Age for Individual Totoaba in Aquaculture") +
  theme_classic() +
  theme(axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        #legend.text = element_text(size = 8),
        axis.title.x = element_text(size = 9),
        axis.title.y = element_text(size = 9),
        #legend.title = element_text(size = 9),
        plot.title = element_text(size = 9),
        legend.position = "none")

ggsave("gg_rc.png", plot = gg_rc, width = 8.5, height = 11, dpi = 300)
