import Nodo from "./Nodo";

export default interface Visitante <T> { // <T> es una etiqueta de Tipo, en este caso es un tipo generico que llamarermos T
    visitRegla (node: Nodo) : T;
    visitConcat(node: Nodo) : T;
    visitString(node: Nodo) : T;
}