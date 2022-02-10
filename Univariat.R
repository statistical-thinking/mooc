# Datensatz einlesen
heart.data <- read.csv("https://raw.githubusercontent.com/statistical-thinking/datasets/main/heart.data.csv")

# Univariate Statistik
dim(heart.data)
summary(heart.data)
boxplot(heart.data)

# Univariate Statistik -> Verteilungsfunktion und Lagemaße
hist(heart.data$heart.disease, freq=FALSE, breaks=40, ylim=c(0,0.10), xlim=c(-5,26))
curve(dnorm(x, mean=mean(heart.data$heart.disease), sd=sd(heart.data$heart.disease)), add=TRUE, lwd=5)
abline(v=10.17, col="red")   # Mean
abline(v=10.38, col="green") # Median
abline(v=6.75, col="blue")   # Modus
legend(19, 0.1, legend=c("Mean", "Median", "Modus"), col=c("red", "green", "blue"), lty=1)

# Univariate Statstik -> Varianz und Standardabweichung (Teil 1)
var(heart.data$heart.disease)
sd(heart.data$heart.disease)

# Univariate Statstik -> Varianz und Standardabweichung (Teil 2)
hist(heart.data$heart.disease, freq=FALSE, breaks=40, ylim=c(0,0.10), xlim=c(-5,26))
curve(dnorm(x, mean=mean(heart.data$heart.disease), sd=sd(heart.data$heart.disease)), add=TRUE, lwd=5)
abline(v=5.6, col="red")   # Untere Grenze (68 %)
abline(v=14.74, col="red") # Obere Grenze (68 %)
abline(v=1.03, col="green")   # Untere Grenze (95 %)
abline(v=19.31, col="green") # Obere Grenze (95 %)
legend(20, 0.1, legend=c("68 %", "95 %"), col=c("red", "green"), lty=1)