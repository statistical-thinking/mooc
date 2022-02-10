# Datensatz einlesen
heart.data <- read.csv("https://raw.githubusercontent.com/statistical-thinking/datasets/main/heart.data.csv")

# Multivariate Statistik (Teil 1)
(lm(heart.disease~biking, data=heart.data))
plot(heart.data$heart.disease~heart.data$biking)
abline(lm(heart.data$heart.disease~heart.data$biking), col="green")
(lm(heart.disease~biking+smoking, data=heart.data))

# Multivariate Statistik (Teil 2)
reg1 <- (lm(heart.disease~., data=heart.data))
summary(reg1)
plot(reg1$residuals)

# Multivariate Statistik (Teil 3)
nominal_y <- ifelse(heart.data$heart.disease > 10.17, 1, 0)
plot(nominal_y~heart.data$biking)
reg2 <- glm(nominal_y~heart.data$biking, family=binomial)
summary(reg2)