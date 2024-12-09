'use client';

import React, { useState, useCallback, useRef } from 'react';
import { Button } from 'primereact/button';
import CodeMirror from '@uiw/react-codemirror';
import { javascript } from '@codemirror/lang-javascript';
import { dracula } from '@uiw/codemirror-theme-dracula';
import { parse as AnalizarGramatica } from './analizador';
import { Messages } from 'primereact/messages';
import '../../styles/compilador.css';

export default function Principal() {
    const [Entrada, setEntrada] = useState("");
    const [Salida, setSalida] = useState("");

    const msgs = useRef<Messages>(null);

    const LimpiarMensaje = () => {
        msgs.current?.clear();
    };

    const MostrarMensaje = (correcto: boolean, detalle: string) => {
        msgs.current?.show({
            severity: correcto ? 'success' : 'error',
            summary: correcto ? 'Revisión Completada' : 'Revisión Fallida',
            detail: detalle,
            sticky: true,
            closable: false,
        });
    };

    const RevisionGramatica = () => {
        LimpiarMensaje();
        try {
            const resultado: string = AnalizarGramatica(Entrada);
            setSalida(resultado);
            // Mostrar mensaje después de la asignación de estado exitosa
            MostrarMensaje(true, resultado);
        } catch (error: any) {
            if (error?.location) {
                const { line, column } = error.location.start;
                const errorMsg = `Error en la línea ${line}, columna ${column}: \n${error.message}`;
                setSalida(errorMsg);
                MostrarMensaje(false, errorMsg);
            } else {
                const errorMsg = `Error: ${String(error)}`;
                setSalida(errorMsg);
                MostrarMensaje(false, errorMsg);
            }
        }
    };

    const onChange = useCallback((value: string) => {
        setEntrada(value);
    }, []);

    return (
        <>
            <div className="grid">
                <div className="col-12">
                    <h4>Ingrese la gramática</h4>
                    <CodeMirror
                        value={Entrada}
                        height="55vh"
                        theme={dracula}
                        extensions={[javascript({ jsx: true })]}
                        onChange={onChange}
                        className="custom-textarea"
                        basicSetup={{
                            autocompletion: false,
                        }}
                    />
                </div>
            </div>
            <div className="grid">
                <div className="col">
                    <Button
                        label="Analizar"
                        severity="secondary"
                        raised
                        onClick={RevisionGramatica}
                        style={{ marginRight: '1%', marginTop: '1%' }}
                        icon="pi pi-check"
                    />
                    <Button
                        label="Limpiar"
                        severity="warning"
                        raised
                        outlined
                        onClick={() => {setEntrada(''); LimpiarMensaje()}}
                        icon="pi pi-trash"
                    />
                </div>
            </div>
            <div className="grid">
                <Messages ref={msgs} />
            </div>
        </>
    );
}
