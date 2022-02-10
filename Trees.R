# Univariate Statistik
summary(trees)
boxplot(trees)

# Bivariate Statistik
cor(trees)
plot(trees$Volume~trees$Girth)
abline(lm(trees$Volume~trees$Girth))

# Multivariate Statistik
regression_model <- lm(Volume~., data=trees)
regression_model
summary(regression_model)