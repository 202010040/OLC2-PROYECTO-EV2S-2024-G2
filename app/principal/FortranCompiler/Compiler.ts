import Nodo from "../interfaces/Nodo";
import Visitante from "../interfaces/Visitante";

export default class Compiler implements Visitante <String> {
    // Como T es un tipo generico en visitante, al implementarlo se debe especificar su tipo
    // Si el visitante retorna un tipo T, todos los nodos deben retornar un tipo T, en este caso, String
    
    visitRegla(node: Nodo): String {
        throw new Error("Method not implemented.");
    }
    visitConcat(node: Nodo): String {
        throw new Error("Method not implemented.");
    }
    visitString(node: Nodo): String {
        throw new Error("Method not implemented.");
    } 

    
}