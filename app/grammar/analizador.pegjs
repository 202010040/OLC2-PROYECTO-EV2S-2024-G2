inicio
    = regla* { return "Gramática correcta" }

identificador = [_a-zA-Z][_a-zA-Z0-9]*

texto = '"' [^"']* '"' / "'" [^"']* "'"

espacio
  = [ \t\r\n]*

numero
    = [0-9]+

instancias
    = "*"
    / "+"
    / "?"

clase
    = "[" [^\]]+ "]" 

// Reglas de la gramática

regla
    =espacio identificador espacio "=" espacio alternativa espacio instancias? espacio ";"?
alternativa
    = expresion* (espacio "/" espacio expresion)*

expresion
  = identificador espacio expresion
    /espacio texto espacio identificador
    / grupo
    /clase
    /identificador
    /numero



grupo
  = "[" espacio expresion "-" expresion espacio "]"
  / "[" espacio expresion espacio "]"
  / "(" espacio expresion* espacio ")"
  / espacio "/" expresion espacio

