
import '../../styles/compilador.css';

export default function Creditos() {
  const miembros = [
    { nombre: 'María José Tebalan Sanchez', rol: '202100265' },
    { nombre: 'Maria de los angeles Paz de Leon', rol: '201602619' },
    { nombre: 'Evelio Marcos Jousué Cruz Solíz', rol: '202010040' }
    
  ];

  return (
    <>
      <div className="tabla-futurista-container">
        <h4> Integrantes </h4>
        <table className="tabla-futurista">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Carne</th>
            </tr>
          </thead>
          <tbody>
            {miembros.map((miembro, index) => (
              <tr key={index}>
                <td>{miembro.nombre}</td>
                <td>{miembro.rol}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </>
  )
}
