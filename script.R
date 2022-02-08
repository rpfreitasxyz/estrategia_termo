library(tidyverse)
library(stringi)

palavras_brutas <- read_table("pt-br-master/dicio") %>%
  rename(bruto = aa) %>%
  mutate(sem_acentos = stri_trans_general(bruto, "Latin-ASCII")) %>%
  filter(str_length(sem_acentos) == 5)

palavras <- palavras_brutas %>%
  separate(sem_acentos, into = c(NA, "letra1", "letra2", "letra3", "letra4", "letra5"), sep = "", remove = FALSE)

palavra_resposta <- slice(palavras, round(runif(1, min = 1, max = nrow(palavras)))) %>% select(sem_acentos) %>% unlist() %>% unname()

palavra_chute <- slice(palavras, round(runif(1, min = 1, max = nrow(palavras)))) %>% select(sem_acentos) %>% unlist() %>% unname()

resp <- c(str_split(palavra_resposta, "")[[1]], seq(1, 5))
chute <- c(str_split(palavra_chute, "")[[1]], seq(1, 5))

# AMARELA
chute[4] %in% resp[1:5]