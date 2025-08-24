#*******************************************************************************
#* EJERCICIO *******************************************************************
#*******************************************************************************

# DATASET: mpg
# The big dots represent the mean of the consumption of each class of car.
# In a later lesson, we will learn how to do this automatically within ggplot2,
# but for the moment, load the package dplyr and execute the following
# command to store in a variable called class_info the mean highway fuel
# consumption.

# library(dplyr)
# class_info <- summarise(group_by(mpg, class),
#                        n=n(), hwy=mean(hwy))
# Esto crea un nuevo data frame, yo no hice eso, agrupé todo en el mismo data frame

# NOTE: You’ll need to use geom_text for the labels, check it out doing
# ?geom_text. To change the labels, use the function labs with parameters
# title, x and y.

# Limpiar ambiente global ------------------------------------------------------
rm(list = ls())

# Llamar librerías -------------------------------------------------------------
if (!require(tidyverse)) install.packages(tidyverse)
library(tidyverse)
# if (!require(viridis)) install.packages(viridis)
# library(viridis)

# Agregar variable de media al data frame --------------------------------------
mpgnew <- mpg %>%
  mutate(id = row_number()) %>%
  select(id, class, hwy) %>%
  arrange(class)

mpgnew <-
  mpgnew %>%
  group_by(class) %>%
  mutate(
    hwy_mean = mean(hwy, na.rm = TRUE),
    n = n()
  ) %>%
  ungroup()
# Así tenemos el valor individual para cada auto pero además dos columnas
# agrupadas a nivel de la clase del auto

# Generar plot -----------------------------------------------------------------
p <-
  mpgnew %>%
  ggplot(
    data = .,
    mapping = aes(
      x = class,
      y = hwy,
      color = class
    )
  ) +
  geom_jitter(alpha = 0.5) +
  geom_point(
    mapping = aes(
      y = hwy_mean,
      color = class
    ),
    size = 5,
    alpha = 1,
  ) +
  labs(
    title = "Fuel consumption per class of vehicle",
    x = "Class of vehicle",
    y = "Highway fuel consumption"
  ) +
  # Opción 1: descartada
  # geom_text(mapping=aes(label=n)) # si ocupo esto, el valor N se repite para cada punto

  # Opción 2: descartada, pero no se ve tan mal
  # geom_text( # es mejor ocupar un nuevo data frame
  #  data = mpgnew %>%
  #    select(class, n, hwy_mean) %>%
  #    distinct(),
  #  mapping=aes(label=n, y = hwy_mean),
  #  color="black"
  # )

  # Opción 3: descartada pero estamos cerca
  # geom_text( # es mejor ocupar un nuevo data frame
  #  data = mpgnew %>%
  #    select(class, n, hwy_mean) %>%
  #    distinct(),
  #  mapping = aes(label = paste0("n = ",n), y = hwy_mean),
  #  color = "black"
  # )

  # Opción 4: definitiva, hay que ajustar el eje Y según una constante
  geom_text( # es mejor ocupar un nuevo data frame
    data = mpgnew %>%
      select(class, n, hwy_mean) %>%
      distinct(),
    mapping = aes(label = paste0("n = ", n), y = 5), # con este argumento muy sencillo puedo hacer mapping de texto
    color = "black" # es necesario indicar un color y no usar NULL, porque no está heredando el color por usar otro data frame
  )

p
