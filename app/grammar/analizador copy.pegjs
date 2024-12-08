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
    =espacio identificador espacio "=" espacio alternativa espacio ";"?

alternativa
    = expresion* (espacio "/" espacio expresion)*

expresion
  = espacio texto espacio 
    / espacio identificador (espacio expresion)* espacio
    / grupo
    /clase
    /numero
    /instancias



grupo
  = "[" espacio alternativa espacio "-" espacio alternativa espacio "]"
  / "[" espacio alternativa espacio "]"
  / "(" espacio alternativa espacio ")"
  / espacio "/" alternativa espacio
