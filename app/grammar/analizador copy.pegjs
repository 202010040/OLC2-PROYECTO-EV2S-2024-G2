/*inicio
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

*/

inicio
    = regla (espacio ";" espacio regla)*  ";"? { return "Gramática correcta" }

identificador = [_a-zA-Z][_a-zA-Z0-9]*

texto = '"' [^"]* '"' / "'" [^']* "'"

espacio
    = ([ \t\r\n] / comentarios_simples/ comentarios_multilinea)* 

comentarios_simples
    = "//" [^\n]*

comentarios_multilinea
    = "/*" (!"*/" .)* "*/"

numero
    = [0-9]+

instancias
    = "*"
    / "+"
    / "?"

corchete_abre = "["

corchete_cierra = "]"

clase = corchete_abre rango + corchete_cierra

rango = [^[\]-] "-" [^[\]-]
	/ [^[\]]+

regla
    =espacio identificador espacio "=" espacio alternativa espacio 

alternativa
    = listado_expresiones (espacio "/" espacio listado_expresiones)*
    
listado_expresiones
	= expresion espacio instancias? (espacio expresion espacio instancias?)*

expresion
    = identificador (":" expresion_unica)
    / expresion_unica

expresion_unica
  =  texto 
    / identificador 
    / grupo
    / clase
    / numero

grupo
  = "[" espacio alternativa espacio "-" espacio alternativa espacio "]"
  / "[" espacio alternativa espacio "]"
  / "(" espacio alternativa espacio ")"
  / espacio "/" alternativa espacio
