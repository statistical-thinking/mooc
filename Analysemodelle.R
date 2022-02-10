# Forschungsfrage: Wie stark ist der Einfluss der unabhängigen Variable auf die abhängige Variable?

# Hypothese: Je mehr [weniger] UV, desto mehr [weniger] AV

# Analysemodell
DiagrammeR::grViz("
digraph {
  graph [layout = circo]
  node [shape = circle]
    A [label = 'UV']
    B [label = 'AV']
  edge []
    A -> B
}
")

# Forschungsfrage: Welche Variable hat den stärksten Einfluss auf die Variable Volume?

# 1. Hypothese: Je mehr Girth [Height], desto mehr Height [Girth] (ungerichtete Hypothese)
# 2. Hypothese: Je mehr Height, desto mehr Volume
# 3. Hypothese: Je mehr Girth, desto mehr Volume

# Analysemodell
DiagrammeR::grViz("
digraph {
  graph [layout = circo]
  node [shape = circle]
    A [label = 'Girth']
    B [label = 'Height']
    C [label = 'Volume']
  edge []
    A -> C
    A -> B
    B -> A
    B -> C
}
")