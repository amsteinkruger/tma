# Script for Presentation Graphics: Weights-at-Age and Revenues/Costs-at-Age
# 1/16/2019

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
gg_aw = 
  ggplot(dat_aw) + 
  geom_path(aes(a, aw_aq)) + 
  geom_path(aes(a, aw_fi)) +
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

# Read in revenues/costs-at-age data.
dat_rc = read.csv("aq_rc.csv")
dat_rc = select(dat_rc, -X)

# Graph.
gg_rc = 
  ggplot(dat_rc) +
  geom_path(aes(t, r.n0)) + 
  geom_path(aes(t, c.n0))

# Graph with some aesthetics to taste.
gg_rc = 
  ggplot(dat_rc) +
  geom_path(aes(t, r.n0)) + 
  geom_path(aes(t, c.n0)) +
  labs(x = "Years", y = "Costs and Revenues (USD2018)") +
  scale_x_continuous(expand = c(0, 0), limits = c(1, 15)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 400000), labels = scales::comma) +
  ggtitle("Costs and Revenues at Age for Wild and Aquacultured Totoaba") +
  theme_classic() +
  theme(axis.text.x = element_text(size = 8),
        axis.text.y = element_text(size = 8),
        #legend.text = element_text(size = 8),
        axis.title.x = element_text(size = 9),
        axis.title.y = element_text(size = 9),
        #legend.title = element_text(size = 9),
        plot.title = element_text(size = 9),
        legend.position = "none")