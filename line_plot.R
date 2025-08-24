#*******************************************************************************
#* EJERCICIO *******************************************************************
#*******************************************************************************

# Limpiar ambiente global ------------------------------------------------------
rm(list = ls())

# Llamar librerías -------------------------------------------------------------
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)
if (!require(babynames)) install.packages("babynames")
library(babynames)
if (!require(viridis)) install.packages("viridis")
library(viridis)

# Crear data frame filtrado ----------------------------------------------------
### Tiene que filtrarse por
### - Nombres (Jessica, Natalie, Saray)
### - Sexo (mujer)
### - Año (mayor a 1980)
baby <- babynames %>%
  filter(year > 1980 &
    name %in% c("Jessica", "Natalie", "Saray") &
    sex %in% "F") %>%
  select(-prop)

# Crear plot -------------------------------------------------------------------
myplot <-
  baby %>%
  ggplot(
    data = .,
    mapping = aes(
      x = year,
      y = n,
      group = name,
      color = name
    )
  ) +
  geom_line(linetype = "dashed") +
  geom_point(
    alpha = 0.5,
    size = 3
  ) +
  scale_color_viridis(discrete = TRUE)

myplot
