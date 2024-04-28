clients <- read.csv("/Users/Mega-Pc/Desktop/Formation_Rstudio/Base_Clients.csv", sep = ";", dec = ".")
ventes <- read.csv("/Users/Mega-Pc/Desktop/Formation_Rstudio/Base_Ventes.csv", sep = ";", dec = ".")

# jointure des deux tables

library(dplyr)
jointure <- left_join(ventes, clients, by = "CustomerID")
View(jointure)

# Les 7 éléments clés de la structure d'un graphique avec ggplot2 sont :
# 1. Le jeu de données : spécifié dans ggplot(data = <données>)
# 2. Les esthétiques (aes) : définissent comment les variables sont mappées sur les aspects visuels tels que x, y, couleur, forme, etc. (aes(x = <variable_x>, y = <variable_y>, color = <variable_couleur>, ...))
# 3. Les couches (layers) : comprennent les objets géométriques (geoms) pour le type de graphique (points, lignes, barres, etc.), les statistiques (stat), et les positions (position)
# 4. Les échelles (scales) : contrôlent le mappage des esthétiques aux valeurs visuelles (échelles de couleurs, échelles de taille, etc.)
# 5. Les systèmes de coordonnées (coord) : ajustent la manière dont l'espace du graphique est utilisé et vu (par exemple, coord_cartesian(), coord_polar(), etc.)
# 6. Les facettes (facets) : pour créer des graphiques en grille basés sur une ou plusieurs variables de regroupement
# 7. Les thèmes (theme) : permettent de personnaliser l'apparence du graphique (couleurs de fond, polices, lignes des axes, etc.)

# relation entre la quantité et le prix

plot(x=jointure$Quantity, y = jointure$Price, xlab = "quantité", ylab = "prix", main = "quantité en fonction du prix", type = "l", col= "blue")
# xlab et ylab est pour changer le nom des variables

library(ggplot2)

ggplot(data = jointure,aes(x = Quantity,y = Price)) +
  geom_point(col = "red", size = 3)+
  labs(x="Quantité", y="Prix",title = "Quantité en fonction du prix")

# autre methode
ggplot(data = jointure, aes(x = Quantity, y = Price)) +
  geom_point(col = "red", size = 3)+
  xlab(label = "Quantite")+
  ylab(label ="Prix")+
  ggtitle("Quantité en fonction du prix")
# autre methode
ggplot(data = jointure, aes(x = Quantity, y = Price, fill = CustomerCategory)) +
  geom_point( size = 3)+
  scale_color_manual(values = c("blue","red","green","grey"))+
  facet_wrap(~CustomerCategory)

# histogramme avec une fonction native
hist(jointure$Price)
ggplot(data = jointure, aes(Price))+
  geom_histogram(bins = 40, color = "blue", aes(fill=CustomerCategory))+
  facet_grid(vars(CustomerCategory))

# boxplot avec les fonctions natives
boxplot(Price ~ CustomerCategory, data = jointure)

update.packages(ggplot)
library(ggplot2)
#
ggplot(data = jointure, aes(x=CustomerCategory, y=price))+
  geom_boxplot(aes(fill =  CustomerCategory))
# fill pour changer les couleurs en fonction de la categorie


boxplot(Price ~ CustomerCategory, data = jointure)
list_variable <- c("Price", "Quantite")
for (i  in list_variable)
 
# repartition des ggroupes d'age
# fonction natives
jointure$AgeGroup <- as.factor(jointure$AgeGroup)
barplot(table(jointure$AgeGroup))

# avec ggplot
ggplot(data = jointure, aes(AgeGroup))+
  geom_bar()

ggplot(data = jointure, aes(AgeGroup))+
  geom_col()

# # Principaux packages du tidyverse :
# - ggplot2 : Création intuitive de visualisations de données complexes.
# - dplyr : Manipulation de données (filtrage, sélection, réarrangement).
# - tidyr : Transformation des données pour les rendre "tidy" (ordonnées), optimisant leur analyse.
# - readr : Importation rapide et facile de données depuis des fichiers plats (CSV, etc.).
# - purrr : Programmation fonctionnelle pour un code plus clair.
# - tibble : Une version moderne du dataframe avec une impression et sous-ensemble améliorés.
# - stringr : Manipulation de chaînes de caractères.
# - forcats : Gestion de données catégorielles avec des facteurs.
# - lubridate : Manipulation simplifiée des dates et heures.

# Date en avec lubridate
View(jointure)
str(jointure)

install.packages("lubridate")
library(lubridate)
jointure$datebis <- dmy_hm(jointure$Date)
jointure$datebis2 <- as.Date(jointure$datebis)
str(jointure)
# obtenir le mois
mois <- month(jointure$datebis2)
jour <- day(jointure$datebis2)
annee <- year(jointure$datebis2)
 

# Utiliser des chaîne de caractère en R
install.packages("stringr")
library(stringr)
ma_chaine <- "Bienvenue sur LeCoinStat"
str_c("Letter: ", letters)

fruit <- c("apple", "banana", "pear", "pineapple")
str_like(fruit, "app")
str_like(fruit, "app%")
str_like(fruit, "ba_ana")
str_like(fruit, "%APPLE")

