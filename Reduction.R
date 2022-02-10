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