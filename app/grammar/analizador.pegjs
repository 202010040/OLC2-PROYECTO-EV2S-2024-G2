
Gramatica
  = (EspaciadoSimple InicializadorGlobal)? (EspaciadoSimple Inicializador)? EspaciadoSimple (Regla EspaciadoSimple)+ { return "Gramática correcta" }

InicializadorGlobal
  = "{" BloqueDeCodigo "}" FinSecuencia

Inicializador
  = BloqueDeCodigo FinSecuencia

Regla
  = NombreIdentificador EspaciadoSimple
    (LiteralCadena EspaciadoSimple)?
    "=" EspaciadoSimple
    Expresion FinSecuencia

Expresion
  = ExpresionOpcional

ExpresionOpcional
  = ExpresionAccion (EspaciadoSimple "/" EspaciadoSimple ExpresionAccion)*

ExpresionAccion
  = ExpresionSecuencia (EspaciadoSimple BloqueDeCodigo)?

ExpresionSecuencia
  = ExpresionEtiquetada (EspaciadoSimple ExpresionEtiquetada)*

ExpresionEtiquetada
  = "@" EtiquetaPrefijo? ExpresionPrefijo
  / EtiquetaPrefijo ExpresionPrefijo
  / ExpresionPrefijo

EtiquetaPrefijo
  = NombreIdentificador EspaciadoSimple ":" EspaciadoSimple

ExpresionPrefijo
  = OperadorPrefijo EspaciadoSimple ExpresionSufijo
  / ExpresionSufijo

OperadorPrefijo
  = "$"
  / "&"
  / "!"

ExpresionSufijo
  = ExpresionPrimaria EspaciadoSimple OperadorSufijo
  / ExpresionRepetida
  / ExpresionPrimaria

OperadorSufijo
  = "?"
  / "*"
  / "+"

ExpresionRepetida
  = ExpresionPrimaria EspaciadoSimple "|" EspaciadoSimple Limites EspaciadoSimple ("," EspaciadoSimple Expresion EspaciadoSimple)? "|"

Limites
  = Limite? EspaciadoSimple ".." EspaciadoSimple Limite?
  / Limite

Limite
  = Entero
  / NombreIdentificador
  / BloqueDeCodigo

ExpresionPrimaria
  = ComparadorLiteral
  / ComparadorClaseCaracter
  / ComparadorCualquiera
  / ReferenciaRegla
  / PredicadoSemantico
  / "(" EspaciadoSimple Expresion EspaciadoSimple ")"

ReferenciaRegla
  = NombreIdentificador "." NombreIdentificador
  / NombreIdentificador !(EspaciadoSimple (LiteralCadena EspaciadoSimple)? "=")

PredicadoSemantico
  = OperadorSemantico EspaciadoSimple BloqueDeCodigo

OperadorSemantico
  = "&"
  / "!"

ComparadorLiteral
  = LiteralCadena "i"?

LiteralCadena
  = '"' CaracterCadenaDoble* '"'
  / "'" CaracterCadenaSimple* "'"

CaracterCadenaDoble
  = $(!('"' / "\\" / TerminadorDeLinea) CaracterFuente)
  / "\\" SecuenciaEscape
  / ContinuacionLinea

CaracterCadenaSimple
  = $(!("'" / "\\" / TerminadorDeLinea) CaracterFuente)
  / "\\" SecuenciaEscape
  / ContinuacionLinea

ComparadorClaseCaracter
  = "["
    "^"?
    (RangoClaseCaracter / ClaseCaracter)*
    "]"
    "i"?

RangoClaseCaracter
  = ClaseCaracter "-" ClaseCaracter

ClaseCaracter
  = $(!("]" / "\\" / TerminadorDeLinea) CaracterFuente)
  / "\\" SecuenciaEscape
  / ContinuacionLinea

ContinuacionLinea
  = "\\" TerminadorDeLinea

SecuenciaEscape
  = EscapeCaracter
  / "0" !DigitoDecimal

EscapeCaracter
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

DigitoDecimal
  = [0-9]

ComparadorCualquiera
  = "."

BloqueDeCodigo
  = "{" Codigo "}"

Codigo
  = $((![{}] CaracterFuente)+ / "{" Codigo "}")*

Entero
  = $DigitoDecimal+

CaracterFuente
  = .

EspacioBlanco
  = "\t"
  / "\v"
  / "\f"
  / " "

TerminadorDeLinea
  = "\n"
  / "\r\n"
  / "\r"

Comentario
  = ComentarioMultilinea
  / ComentarioLineaSimple

ComentarioMultilinea
  = "/*" (!"*/" CaracterFuente)* "*/"

ComentarioLineaSimple
  = "//" (!TerminadorDeLinea CaracterFuente)*

NombreIdentificador
  = InicioIdentificador ParteIdentificador*

InicioIdentificador
  = [a-zA-Z]
  / "_"

ParteIdentificador
  = InicioIdentificador
  / "$"
  / DigitoDecimal
  
EspaciadoSimple
  = (EspacioBlanco / TerminadorDeLinea / Comentario)*
_
  = (EspacioBlanco / ComentarioMultilinea)*

FinSecuencia
  = (EspaciadoSimple ";")+  
  / _ ComentarioLineaSimple? TerminadorDeLinea  
  / EspaciadoSimple FinArchivo

FinArchivo
  = !.