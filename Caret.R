# Zusatzprogramm CARET installieren und aktivieren
install.packages("caret", dependencies=TRUE)
library(caret)

# Features anlegen
x <- iris[,1:4]
y <- iris[,5]

# Grafische Darstellung der Features
featurePlot(x=x, y=y, plot="box")

# Grafische Darstellung über SEPAL.WIDTH und SEPAL.LENGTH
shapes=c(1,0,20)
shapes <- shapes[as.numeric(iris$Species)]
plot(x=iris$Sepal.Length, y=iris$Sepal.Width, frame=FALSE, xlab="Sepal Length", ylab="Sepal Width", pch=shapes)
legend("topright", legend=levels(iris$Species), pch=c(1,0,20))

# Training Data und Validation Data anlegen
validation_index <- createDataPartition(iris$Species, p=0.80, list=FALSE)
validation <- iris[-validation_index,]
training <- iris[validation_index,]

# Training Data und Validation Data einsehen
summary(validation)
summary(training)

# Validierung festlegen
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# Linear Discriminant Analysis trainieren
fit.lda <- train(Species~., data=training, method="lda", metric=metric, trControl=control)

# K-Nearest Neighbors trainieren
fit.knn <- train(Species~., data=training, method="knn", metric=metric, trControl=control)

# Random Forest trainieren
fit.rf <- train(Species~., data=training, method="rf", metric=metric, trControl=control)

# Vergleich der Machine Learning Algorithmen
results <- resamples(list(lda=fit.lda, knn=fit.knn, rf=fit.rf))
summary(results)
dotplot(results)

# Fokus auf besten Algorithmus
print(fit.lda)

# Machine Learning Algorithmus auf Validation Data anwenden
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)