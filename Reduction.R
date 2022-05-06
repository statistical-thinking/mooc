# Funktionsumfang von R erweitern
library(psych)
library(corrplot)

# Deskriptive Statistik
dim(bfi)
summary(bfi)
data <- na.omit(bfi[c(11:20)])
dim(data)
summary(data)

# Summenscores vergleichen
extraversion_sum <- (data$E1+data$E2+data$E3+data$E4+data$E5)/5
mean(extraversion_sum)
neuroticism_sum <- (data$N1+data$N2+data$N3+data$N4+data$N5)/5
mean(neuroticism_sum)

# Bivariate Statistik
cor_matrix <- cor(data)
corrplot(cor_matrix)

# Faktorenanalyse
fa.parallel(data, fa="both")
factors <- fa(data, nfactors=2, rotate="varimax")
factors
plot(factors)
fa(data, nfactors=3, rotate="varimax")
help(bfi)

# Funktionsumfang von R erweitern
library(cluster)

# Deskriptive Statistik
dim(iris)
summary(iris)

# Relevante Variablen z-transformieren 
cluster_data <- scale(iris[c(1:4)])
summary(cluster_data)

# Within Cluster Sum of Squares (WSS) ermitteln
wss <- (nrow(cluster_data)-1)*sum(apply(cluster_data,2,var))
for (i in 2:10) wss[i] <- sum(kmeans(cluster_data, centers=i)$withinss)

# Grafische Darstellung der Anzahl an Clustern mittels WSS
plot(1:10, wss, type="c", xlab="Cluster", ylab="WSS", main="Clusteranzahl in Abhängigkeit von WSS")

# K-Means Algorithmus anwenden
k_means_cluster <- kmeans(iris[,-5], 3, nstart=30)
clusplot(iris, k_means_cluster$cluster, color=TRUE, shade=TRUE, lines=0)

# Präzision des K-Means Algorithmus
table(iris$Species, k_means_cluster$cluster)
