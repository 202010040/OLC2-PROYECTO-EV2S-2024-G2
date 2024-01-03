const nodes = {
    // Nombre: Tipo
    // Se debe crear un Nodo en cada elemento de la gramatica
    Identifier: {
        id: 'string'
    },
    Identifier: {
        id: 'string',
        alias: 'string',
        expresion: 'Nodo',
    },
    String: {
        value: 'string'
    }
};

export default nodes;