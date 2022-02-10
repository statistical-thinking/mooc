# Lineare Regression
lm(mtcars$mpg~mtcars$wt)

# Resampling
set.seed(1701)
R <- 1000
b <- vector(length=R)
for(i in 1:R){
  boot.data <- mtcars[sample(1:nrow(mtcars), size = 100, replace=T), ] 
  boot.result  <- summary(lm(boot.data$mpg~boot.data$wt))
  b[i] <- boot.result$coefficients[2,1] # p-values in 2nd row and 1st column
}
summary(b)

# Verteilung der Regressionsgewichte
plot(density(b), main="Stichprobenwiederholung der Regressionsgewichte", ylim=c(0.05,1.25), xlim=c(-7,-3.5))
abline(0,0,0,-5.344, col="red")
legend("topright", inset=.01, legend=c("b-coefficient (original) = -5.344"), col=c("red"), box.lty=0, lty=1:2, cex=1.0)