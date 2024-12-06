'use client';

import { InputTextarea } from 'primereact/inputtextarea';
import { useState } from 'react';
import { Button } from 'primereact/button';
import { AnalizarGramatica } from './analizador'

export default function Principal() {
    const [Entrada, setEntrada] = useState('');
    const [Salida, setSalida] = useState('');
    return (
        <>
            <div className="grid">
                <div className="col">
                    <h4> Ingrese La gramatica </h4>
                    <InputTextarea autoResize value={Entrada} onChange={(e) => setEntrada(e.target.value)} rows={15} cols={120} />
                </div>
                <div className="col">
                    <h4> Gramatica Revisada </h4>
                    <InputTextarea autoResize value={Salida} disabled rows={15} cols={120} />
                </div>
            </div>
            <div className="grid">
                <div className="col-4 col-offset-5">
                    <Button 
                        label="Analizar" 
                        severity="secondary"  
                        raised
                        onClick={ () => setSalida(AnalizarGramatica(Entrada))}  
                    />
                </div>
            </div>
        </>
    )
}