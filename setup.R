# ---- packages_list ----

pkg <- c("readr",
         "knitr",
         "tidyverse",
         "gapminder",
         "sandwich",
         "cowplot",
         "reshape2",
         "broom",
         "kableExtra",
         "scales",
         "extrafont")

# ---- packages_inst ----

install.packages(pkg, verbose = FALSE, quiet = TRUE)

# ---- packages_upda ----

update.packages(pkg, verbose = FALSE, quiet = TRUE)

# ---- packages_libr ----

lapply(pkg, library, character.only = TRUE)

# ---- fonts ----

font_import()
loadfonts(device = "win")

# ---- theme ----

btheme =
  theme(plot.title = element_text(hjust = 0.5, size = 32, family = "Century Gothic", face = "bold"), 
        rect = element_rect(fill = "transparent"),
        plot.background = element_rect(fill = "transparent", color = NA),
        legend.position = "right",
        legend.background = element_rect(fill = "transparent"),
        legend.box.background = element_rect(fill = "transparent"),
        legend.key = element_rect(fill="transparent", colour=NA),
        legend.text = element_text(size = 16, family = "Century Gothic"),
        legend.title = element_text(size = 18, family = "Century Gothic"),
        panel.background = element_rect(fill = "transparent"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 18, family = "Century Gothic"),
        axis.title.x = element_text(size = 24, family = "Century Gothic", face = "bold"),
        axis.text.y = element_text(size = 18, family = "Century Gothic"),
        axis.title.y = element_text(size = 24, family = "Century Gothic", face = "bold"))