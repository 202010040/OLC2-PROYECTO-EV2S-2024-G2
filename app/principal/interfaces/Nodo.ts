import Visitante from "./Visitante"; 

export default interface Nodo {
    aceptar <T> (visitor: Visitante <T>) : T; // any se considera una mala practica, ya que se debe de tipar
}

