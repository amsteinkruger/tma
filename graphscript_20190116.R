# Script for Presentation Graphics: Weights-at-Age and Revenues/Costs-at-Age
# 1/16/2019

# Read in weights-at-age output.
dat_aw = read.csv("aw.csv") 
dat_aw = select(dat_aw, -X)
dat_aw = dat_aw[2:16]

