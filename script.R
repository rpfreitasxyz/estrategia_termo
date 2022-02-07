library(tidyverse)
library(stringi)

palavras_brutas <- read_table("pt-br-master/dicio") %>%
  rename(bruto = aa) %>%
  mutate(sem_acentos = stri_trans_general(bruto, "Latin-ASCII")) %>%
  filter(str_length(sem_acentos) == 5)

palavras <- palavras_brutas %>%
  separate(sem_acentos, into = c(NA, "letra1", "letra2", "letra3", "letra4", "letra5"), sep = "", remove = FALSE)