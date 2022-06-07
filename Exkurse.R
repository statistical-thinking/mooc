# Exponentialfunktion mit negativem Vorzeichen
x <- seq(0,50,1)
y <- runif(1,5,5)*exp(-runif(1,0.1,0.1)*x)+rnorm(51,0,0.5)
a_start <- 10
b_start <- 2*log(2)/a_start
m <- nls(y~a*exp(-b*x), start=list(a=a_start, b=b_start))
plot(x,y)
lines(x, predict(m), col="blue", lty=2,lwd=3)

# Michaelis-Menten-Gleichung
x <- seq(0,50)
y <- (runif(1,10,20)*x)/(runif(1,0,10)+x)+rnorm(51,0,1)
a_start <- 10
b_start <- 2*log(2)/a_start
m <- nls(y~a*x/(b+x), start=list(a=a_start, b=b_start))
plot(x,y)
lines(x, predict(m), lty=2, col="blue", lwd=3)

# Logarithmierte Odds Ratio eines nerdigen Star Wars Fans
starwars <- data.frame(
Nerd=c(1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0),
Fan=c(1,1,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,0,0))
glm(data=starwars, Fan~Nerd, family=binomial)

# Simpson Paradoxon
x <- c(3, 4, 5, 7, 8, 9)
y <- c(8, 9, 10, 2, 3, 4)
simpson <- data.frame(x, y)
plot(simpson, ylim=c(1, 11), xlim=c(1, 11))
abline(lm(data=simpson, y~x))
abline(lm(data=simpson[c(1, 2, 3),], y~x), col="red")
abline(lm(data=simpson[c(4, 5, 6),], y~x), col="green")
legend(8, 10.5, legend=c("Gruppe A", "Gruppe B"), col=c("red", "green"), lty=1)

# Parallelen zwischen t-Test und linearer Regression
t.test(ToothGrowth$len~ToothGrowth$supp)
lm(ToothGrowth$len~ToothGrowth$supp)

# Moderationseffekt (Teil 1)
set.seed(1701)
data <- data.frame(
fan = rep(c("Star Wars", "Star Trek"), each = 30),
nerdindex = rep(c("1", "2", "3"), each = 10, times = 2),
tvindex = c(runif(10, -3, 3), runif(10, 0, 5), runif(10, 4, 6),
runif(10, -4, 2), runif(10, 0, 3), runif(10, 5, 8)))

# Moderationseffekt (Teil 2)
interaction.plot(x.factor = data$nerdindex,
trace.factor = data$fan, response = data$tvindex,
fun = median, main = "Moderationseffekt (Schnittstelle)",
ylab = "TV-Index (Stunden pro Tag)",
xlab = "Nerd-Index (1=klein, 2=mittel, 3=groß)",
col = c("red", "blue"), lty = 2, lwd = 2,
trace.label = "Franchise")

# Moderationseffekt (Teil 3)
summary(lm(data=data, tvindex~nerdindex*fan))

# Plot der ersten Seite
library(mgcv)
library(lattice)
x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100)
tab <- data.frame(x,y,z)
mod <- gam(z~te(x,y), data=tab)
z <- matrix(fitted(mod), ncol=10)
wireframe(z, drape=TRUE, colorkey=TRUE)