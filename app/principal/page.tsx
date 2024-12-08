'use client';

import { InputTextarea } from 'primereact/inputtextarea';
import { useState } from 'react';
import { Button } from 'primereact/button';
import { parse as AnalizarGramatica } from './analizador';
import '../../styles/compilador.css'



export default function Principal() {
    const [Entrada, setEntrada] = useState('');
    const [Salida, setSalida] = useState('');

    /*const handleAnalizar = () => {
        try {
            const resultado = AnalizarGramatica(Entrada);
            setSalida(resultado);
            
        } catch (error) {
            if (error instanceof Error) {
                console.log(error.message);
                setSalida(`Error: ${error.message}`);
            } else {
                setSalida("Error desconocido");
            }
        }
    }*/

    const RevisionGramatica = () => {
        try {
            const resultado:string = AnalizarGramatica(Entrada);
            setSalida(resultado);
        } catch (error) {
            setSalida(String(error));
        }
        
    }
    return (
        <>

            <div className="grid">
                <div className="col-6">
                    <h4> Ingrese La gramatica </h4>
                    <InputTextarea
                        autoResize
                        value={Entrada}
                        onChange={(e) => setEntrada(e.target.value)}
                        className="custom-textarea"
                    />

                </div>
                <div className="col-1" style={{ display: "flex", justifyContent: "center", alignItems: "center" }}>
                    <Button
                        label="Analizar"
                        severity="secondary"
                        outlined
                        raised
                        onClick={RevisionGramatica}
                    />
                </div>
                <div className="col-5">
                    <h4> Gramatica Revisada </h4>
                    <InputTextarea
                        autoResize
                        value={Salida}
                        className="custom-textarea"
                        disabled
                    />
                </div>
            </div>
        </>
    )
}