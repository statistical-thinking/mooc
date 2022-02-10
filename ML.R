# Ausgangsdatensatz
dim(trees)

# Trainingsdatensatz anlegen
subset1 <- subset(trees[1:5,])
subset2 <- subset(trees[26:30,])
training_data <- rbind(subset1, subset2)
training_data

# Validierungsdatensatz anlegen
subset3 <- subset(trees[6:25,])
subset4 <- subset(trees[31,])
validation_data <- rbind(subset3, subset4)
validation_data

# Lineares Regressionsmodell als Machine Learning Algorithmus
algorithm <- lm(data=training_data, Volume~Girth+Height)

# Machine Learning Algorithmus auf Validierungsdatensatz anwenden
validation <- predict(algorithm, validation_data)
difference <- validation_data-validation
mean(difference$Volume)
sd(trees$Volume)