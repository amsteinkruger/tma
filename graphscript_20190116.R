# Script for Presentation Graphics: Weights-at-Age and Revenues/Costs-at-Age
# 1/17/2019

# Run libraries.
library(tidyverse)

# Set up functions and parameters for two sets of lengths-at-age, then weights-at-age.
fun_al = function(a, linf, k, t0){l = linf * (1 - exp(-k * (a - t0)))} # INAPESCA (2018): 200, 0.155, -0.65. # BB (2019): 200, 0.22856, -0.65.

a = seq(1, 15)
linf = 200
ka = 0.22856
kw = 0.155
t0 = -0.65

fun_aw =  function(a, l, b){w = a * l ^ b} # BB (2019): 0.000004128, 3.24674

awa = 0.000004128
awb = 3.24674

aw_aq = fun_aw(awa, fun_al(a, linf, ka, t0), awb)
aw_fi = fun_aw(awa, fun_al(a, linf, kw, t0), awb)


# Read in weights-at-age output.
#dat_aw = read.csv("aw.csv") 
#dat_aw = select(dat_aw, -X)
#dat_aw = slice(dat_aw, 2:16)

# Graph.
gg_aw = 
  ggplot() + 
  geom_path(aes(a, aw_aq)) + 
  geom_path(aes(a, aw_fi))

# Graph with some aesthetics to taste. 
# To change colors, replace "Red" with "Whatever Color You Want." I would suggest identifying an exact hexadecimal HTML code for your preferred color.
gg_aw = 
  ggplot() + 
  geom_ribbon(aes(a, ymin = aw_fi, ymax = aw_aq), alpha = 0.25, fill = "Red") +
  geom_path(aes(a, aw_aq), color = "Red") + 
  geom_path(aes(a, aw_fi), color = "Red") +
  labs(x = "Years", y = "Round Weight (Kilograms)") +
  scale_x_continuous(expand = c(0, 0), limits = c(1, 15)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 125), labels = scales::comma) +
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

# Graph.
gg_rc = 
  ggplot(dat_rc) +
  geom_path(aes(t, rmeat)) +
  geom_path(aes(t, r)) +
  geom_path(aes(t, c))

# Graph with some aesthetics to taste.
# To change colors, replace "Red" with "Whatever Color You Want." I would suggest identifying an exact hexadecimal HTML code for your preferred color.
gg_rc = 
  ggplot(dat_rc) +
  #geom_ribbon(aes(t, ymin = c, ymax = r), alpha = 0.25, fill = "Green") +
  #geom_ribbon(aes(t, ymin = rmeat, ymax = c), alpha = 0.25, fill = "Red") +
  geom_path(aes(t, r), color = "darkgreen") + 
  geom_path(aes(t, c), color = "firebrick4") +
  #geom_path(aes(t, rmeat), color = "Red") +
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
