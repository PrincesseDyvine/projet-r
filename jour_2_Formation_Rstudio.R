# importation du fichier client
clients <- read.csv("/Users/Mega-Pc/Desktop/Formation_Rstudio/Base_Clients.csv", sep = ";", dec = ".")
str(clients)

ventes <- read.csv("/Users/Mega-Pc/Desktop/Formation_Rstudio/Base_Ventes.csv", sep = ";", dec = ".")

View(ventes)

# importation fichiers excell
install.packages("readxl")
library(readxl)
test <- read_excel("/Users/Mega-Pc/Desktop/Formation_Rstudio/Base_Ventes.xlsx")


# voir les cinq premiers clients de la table
head(clients, 5)

# les cinq derniers clients
tail(clients, 5)

# voir la structure de la base de données
str(ventes)

# nombre de lignes
nrow(clients)
nrow(ventes)

# nombre de colonnes
ncol(clients)
ncol(ventes)
dim(clients)
# nom des colones
nom_colonne_client <- colnames(clients)

nom_colonne_ventes <- colnames(ventes)

# description rapide de la base de données
summary(clients)
summary(ventes)

clients$AgeGroup <- as.factor(clients$AgeGroup)# transformer cette colonne en facteur
summary(clients)
# il est preferable de toujours convertir les données qualitatives afin d'avoir plus d'info sur les données

# les groupes de la base de données
unique(clients$AgeGroup)
# nombre d'individu par groupe d'age
table(clients$AgeGroup)
# avoir la proportion
categorie_stat <- table(clients$AgeGroup)
prop.table(categorie_stat)

# nombre de valeur manquante sur le groupe d'age
is.na(clients$AgeGroup)
# somme des valeur manquantes
sum(is.na(clients$AgeGroup))
# valeur manquante sur la base de données
colSums(is.na(clients))
colSums(is.na(ventes))

rowSums(is.na(ventes))

# remplacer la valeur manquante sur le prix par zero

ventes[is.na(ventes$Price), ] # afficher les lignes ou il ya les valeures manquantes

venteb <- ventes
venteb$Price[is.na(venteb$Price)] <- 0
colSums(is.na(venteb))

# supprimer les valeurs manquantes
ventec <- na.omit(ventes)
dim(ventec)
colSums(is.na(ventec))

# renommer des colonnes
install.packages("dplyr")
library(dplyr)
rename(clients, "Nom" = "Name")

colnames(clients)[2] <- "Nombis"

View(ventes)

# creer une nouvelle colonne montant total
ventes$montantTotal <- ventes$Quantity * ventes$Price
sum(ventes$montantTotal) #reponse :NA a cause des valeurs manquante
sum(ventes$montantTotal, na.rm = T)
View(ventes)

# liste des produits dont le prix est superieur a 40 
liste_produit <- ventes[ventes$Price > 40, ]

# donner uniquement custumerID et ProductID
liste_produit <- ventes[ventes$Price > 40, c("CustomerID", "ProductID")]
View(liste_produit)

# liste des produits dont le prix est superieur a 40 sans les valeurs manquantes
liste_produit <- ventes[ventes$Price > 40 & is.na(ventes$Price) == FALSE, ]

# donner la liste des clients premium
liste_premium <- clients[clients$CustomerCategory == "Premium",]
liste_premium

liste_client_premium <- clients %>% filter(CustomerCategory == "Premium") 
liste_client_premium <- filter(clients,CustomerCategory == "Premium") 


# joindre les deux tables
jointure <- left_join(ventes, clients, by = "CustomerID")
jointure <- inner_join(ventes, clients, by = "CustomerID")
jointure <- merge(ventes, clients, by = "CustomerID")
View(jointure)

# somme de CA par type de client
jointure %>% group_by(CustomerID)
# somme de montant total
jointure %>% group_by(CustomerCategory) %>% summarise(sum(montantTotal, na.rm = T), moyenne = mean(montantTotal, na.rm = T ),nombre = n())


