inicio
    = regla (espacio ";" espacio regla)*  ";"? { return "Gramática correcta" }

identificador = [_a-zA-Z][_a-zA-Z0-9]*

texto = '"' [^"]* '"' 

espacio
    = [ \t\r\n]*
  
numero
    = [0-9]+

instancias
    = "*"
    / "+"
    / "?"

corchete_abre = "["

corchete_cierra = "]"

clase = corchete_abre 

rango = [^[\]-] "-" [^[\]-]
	/ [^[\]]+

regla
    =espacio identificador espacio "=" espacio alternativa espacio 

alternativa
    = listado_expresiones (espacio "/" espacio listado_expresiones)*
    
listado_expresiones
	= expresion espacio instancias? (espacio expresion espacio instancias?)*

expresion
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