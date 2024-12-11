gramatica
  = (espaciado_simple inicializador_global)? (espaciado_simple inicializador)? espaciado_simple (regla espaciado_simple)+ { return "Gramática correcta" }

inicializador_global
  = "{" bloque_de_codigo "}" fin_secuencia

inicializador
  = bloque_de_codigo fin_secuencia

regla
  = nombre_identificador espaciado_simple
    (literal_cadena espaciado_simple)?
    "=" espaciado_simple
    expresion fin_secuencia

expresion
  = expresion_opcional

expresion_opcional
  = expresion_accion (espaciado_simple "/" espaciado_simple expresion_accion)*

expresion_accion
  = expresion_secuencia (espaciado_simple bloque_de_codigo)?

expresion_secuencia
  = expresion_etiquetada (espaciado_simple expresion_etiquetada)*

expresion_etiquetada
  = "@" etiqueta_prefijo? expresion_prefijo
  / etiqueta_prefijo expresion_prefijo
  / expresion_prefijo

etiqueta_prefijo
  = nombre_identificador espaciado_simple ":" espaciado_simple

expresion_prefijo
  = operador_prefijo espaciado_simple expresion_sufijo
  / expresion_sufijo

operador_prefijo
  = "$"
  / "&"
  / "!"

expresion_sufijo
  = expresion_primaria espaciado_simple operador_sufijo
  / expresion_repetida
  / expresion_primaria

operador_sufijo
  = "?"
  / "*"
  / "+"

expresion_repetida
  = expresion_primaria espaciado_simple "|" espaciado_simple limites espaciado_simple ("," espaciado_simple expresion espaciado_simple)? "|"

limites
  = limite? espaciado_simple ".." espaciado_simple limite?
  / limite

limite
  = entero
  / nombre_identificador
  / bloque_de_codigo

expresion_primaria
  = comparador_literal
  / comparador_clase_caracter
  / comparador_cualquiera
  / referencia_regla
  / predicado_semantico
  / "(" espaciado_simple expresion espaciado_simple ")"

referencia_regla
  = nombre_identificador "." nombre_identificador
  / nombre_identificador !(espaciado_simple (literal_cadena espaciado_simple)? "=")

predicado_semantico
  = operador_semantico espaciado_simple bloque_de_codigo

operador_semantico
  = "&"
  / "!"

comparador_literal
  = literal_cadena "i"?

literal_cadena
  = '"' caracter_cadena_doble* '"'
  / "'" caracter_cadena_simple* "'"

caracter_cadena_doble
  = $(!('"' / "\\" / terminador_de_linea) caracter_fuente)
  / "\\" secuencia_escape
  / continuacion_linea

caracter_cadena_simple
  = $(!("'" / "\\" / terminador_de_linea) caracter_fuente)
  / "\\" secuencia_escape
  / continuacion_linea

comparador_clase_caracter
  = "["
    "^"?
    (rango_clase_caracter / clase_caracter)*
    "]"
    "i"?

rango_clase_caracter
  = clase_caracter "-" clase_caracter

clase_caracter
  = $(!("]" / "\\" / terminador_de_linea) caracter_fuente)
  / "\\" secuencia_escape
  / continuacion_linea

continuacion_linea
  = "\\" terminador_de_linea

secuencia_escape
  = escape_caracter
  / "0" !digito_decimal

escape_caracter
  = "'"
  / '"'
  / "\\"
  / "b"
  / "f"
  / "n"
  / "r"
  / "t"
  / "u"
  / "v"

digito_decimal
  = [0-9]

comparador_cualquiera
  = "."

bloque_de_codigo
  = "{" codigo "}"

codigo
  = $((![{}] caracter_fuente)+ / "{" codigo "}")*

entero
  = $digito_decimal+

caracter_fuente
  = .

espacio_blanco
  = "\t"
  / "\v"
  / "\f"
  / " "

terminador_de_linea
  = "\n"
  / "\r\n"
  / "\r"

comentario
  = comentario_multilinea
  / comentario_linea_simple

comentario_multilinea
  = "/*" (!"*/" caracter_fuente)* "*/"

comentario_linea_simple
  = "//" (!terminador_de_linea caracter_fuente)*

nombre_identificador
  = inicio_identificador parte_identificador*

inicio_identificador
  = [a-zA-Z]
  / "_"

parte_identificador
  = inicio_identificador
  / "$"
  / digito_decimal

espaciado_simple
  = (espacio_blanco / terminador_de_linea / comentario)*
_
  = (espacio_blanco / comentario_multilinea)*

fin_secuencia
  = (espaciado_simple ";")+
  / _ comentario_linea_simple? terminador_de_linea
  / espaciado_simple fin_archivo

fin_archivo
  = !.
