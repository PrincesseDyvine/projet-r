# creer une fonction mathematique afin de faire des stats descriptives sur des données quantitatifs

# retourne un dataframe avec le resultat
# importation du fichier client
clients <- read.csv("/Users/Mega-Pc/Desktop/Formation_Rstudio/Base_Clients.csv", sep = ";", dec = ".")
str(clients)

ventes <- read.csv("/Users/Mega-Pc/Desktop/Formation_Rstudio/Base_Ventes.csv", sep = ";", dec = ".")

# calcul de la somme
somme <- function(a,b){
  resultat <- a+b
  return(resultat)
}
x <- 5
y <- 10
somme(5,10)

is.numeric(ventes$Quantity)

# if else en R: tester si une variable est quantitative 
if (is.numeric(ventes$Quantity) ) {
  resultat <- "Numerique"
}else {
  resultat <- "Non numérique"
}

# boucle for en R
for (variable in names(ventes)) {
  
  if(is.numeric(ventes[[variable]])){
    print(paste0(variable, "est un numerique"))
  }else{
    print(paste0(variable,"n'est pas numerique"))
  }
  
}
# paste0 c'est pour concatener deux chaines de caractere
# creation de la fonction

a <- "Bonjour"
b <- 




resultat
statistique_descriptive <- function(base_donnee){
  resultat <- data.frame(nom_variable = character(1),min = numeric(1), max = numeric(1), moyenne = numeric(1), variance = numeric(1))
  liste_variable <- names(base_donnee)
  for (variable in liste_variable) {
    if (is.numeric(base_donnee[[variable]])) {
      min <- min(base_donnee[[variable]])
      max <- max(base_donnee[[variable]])
      moyenne <- moyenne(base_donnee[[variable]])
      variance <- var(base_donnee[[variable]])
      
      resultat[nrow(resultat)+1,] <- c(variable,min,max,moyenne,variance)
    }
  }
  return(resultat)
}

resultat <- statistique_descriptive(ventes)
