// Generar clases para AST
// Este archivo genera las clases necesarias para implementar el patrón visitante con Typescript
// Archivo generado por aux en conferencia 

// La idea es generar el compilador de fortran a partir de ahi

import { writeFileSync } from 'node:fs';
import path from 'node:path';
import nodes from './Nodes.js';

const __dirname = import.meta.dirname;
const classesDestination = 'AST.ts';
const visitorDestination = 'interfaces/Visitor.ts'; // Las rutas relativas se deben personalizar

let codeString = `
// Auto-generated
import Nodo from "./Nodo";

export default interface Visitante <T> {

`;
for (const node of Object.keys(nodes)) {
    codeString += `\tvisit${node}(node: Nodo): T\n`;
}
codeString += `}`;

writeFileSync(path.join(__dirname, visitorDestination), codeString);
console.log('Generated visitor Interface');

codeString = `
// Auto-generated
import Nodo from "./Nodo";
import Visitante from "./Visitor"; 

`;
for (const [name, args] of Object.entries(nodes)) {
    const argKeys = Object.keys(args);
    codeString += `
export class ${name} implements Nodo {
    ${argKeys.map((arg) => `${arg}: ${args[arg]};`).join('\n\t')}

    constructor(${argKeys.map((arg) => `${arg}: ${args[arg]}`).join(', ')}) {
        ${argKeys.map((arg) => `this.${arg} = ${arg};`).join('\n\t\t')}
    }

    accept<T>(visitor: Visitante<T>) {
        return visitor.visit${name}(this);
    }
}
    `;
    console.log(`Generating ${name} node`);
}

writeFileSync(path.join(__dirname, classesDestination), codeString);
console.log('Done!');