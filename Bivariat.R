# Datensatz einlesen
heart.data <- read.csv("https://raw.githubusercontent.com/statistical-thinking/datasets/main/heart.data.csv")

# Bivariate Statistik -> Korrelation (Teil 1)
cor(heart.data)

# Bivariate Statistik -> Korrelation (Teil 2)
plot(heart.data$heart.disease~heart.data$biking)
abline(lm(heart.data$heart.disease~heart.data$biking), col="green")

# Bivariate Statistik -> Chi-Quadrat-Test
nominal_y <- ifelse(heart.data$heart.disease > 10.17, 1, 0) # Überdurchschnittlich viele Erkrankungen
nominal_x <- ifelse(heart.data$smoking > 15.43, 1, 0) # Überdurchschnittlich hohes Rauchverhalten
table(nominal_y, nominal_x)
chisq.test(nominal_y, nominal_x)

# Bivariate Statistik -> t-Test (Teil 1)
low_smoking_areas <- subset(heart.data, heart.data$smoking < 15.43)
high_smoking_areas <- subset(heart.data, heart.data$smoking > 15.43)
par(mfrow=c(1,2))
boxplot(low_smoking_areas[c(3)], ylim=c(0, 22), main="Low Smoking Areas (0)")
boxplot(high_smoking_areas[c(3)], ylim=c(0, 22), main="High Smoking Areas (1)")

# Bivariate Statistik -> t-Test (Teil 2)
t.test(heart.data$heart.disease~nominal_x)