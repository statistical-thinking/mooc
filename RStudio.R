# Erste Beispiele
plot(swiss)
neues_objekt <- plot(swiss)

# Ohne Package CORRPLOT
cor(swiss)

# Package CORRPLOT installieren und aktivieren
install.packages(corrplot)
library("corrplot")

# Mit Package CORRPLOT
noch_ein_neues_objekt <- cor(swiss)
corrplot.mixed(noch_ein_neues_objekt)

# Hilfe zum Package CORRPLOT
help(corrplot)
