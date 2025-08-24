#*******************************************************************************
#* EJERCICIO ********************************************************************
#*******************************************************************************

# Limpiar ambiente global ------------------------------------------------------
rm(list = ls())

# Llamar librerías -------------------------------------------------------------
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)
if (!require(babynames)) install.packages("babynames")
library(babynames)
