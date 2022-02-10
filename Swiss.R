# Datensatz einsehen
head(swiss)
help(swiss)

# Forschungsfrage: Welche Variable hat den stärksten Einfluss auf Fertility?

# Analysemodell
DiagrammeR::grViz("
digraph {
  graph [layout = circo]
  node [shape = circle]
    A [label = 'Fertility']
    B [label = 'Agriclture']
    C [label = 'Examination']
    D [label = 'Education']
    E [label = 'Catholic']
    F [label = 'Infant Mortality']
  edge []
    B -> A
    C -> A
    D -> A
    E -> A
    A -> F
    C -> B
    D -> C
    D -> B
}
")

# Univariate Statistik
summary(swiss)
boxplot(swiss)

# Bivariate Statistik
cor(swiss)

# Multivariate Statistik
lm(Fertility~., data=swiss)