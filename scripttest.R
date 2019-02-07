# ---- test-a ----
x = seq(0, 10)
y = x ^ 2

z = plot(x, y)

print(z)

library(ggplot2)

xy = data.frame(x, y)

write.csv(xy, "xy.csv")
