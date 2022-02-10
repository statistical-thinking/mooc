# Erste Beispiele
plot(swiss)
neues_objekt <- plot(swiss)

# Ohne Package corrplot
cor(swiss)

# Package corrplot installieren und aktivieren
install.packages(corrplot)
library("corrplot")

# Mit Package corrplot
noch_ein_neues_objekt <- cor(swiss)
corrplot.mixed(noch_ein_neues_objekt)

# Hilfe zum Package corrplot
help(corrplot)