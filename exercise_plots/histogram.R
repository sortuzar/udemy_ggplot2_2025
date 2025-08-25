#*******************************************************************************
# EJERCICIOS *******************************************************************
#*******************************************************************************

# DATASET: mpg. (x=displ)
# This plot is a histogram, and the labels on top of each bar are the count of
# how many items fall in each category.
# For this plot, you’ll need to apply what we’ve learnt in the GRAMMAR part
# (statistical transformations and computed aesthetics) and what we’ve
# learnt in the PLOTS part, in particular about histograms.

# Limpiar ambiente global ------------------------------------------------------
rm(list = ls())

# Llamar librerías -------------------------------------------------------------
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

# Generar plot -----------------------------------------------------------------
p <-
  mpg %>%
  ggplot(
    data = .,
    mapping = aes(
      x = displ
    )
  ) +
  geom_histogram()

p
