import 'primereact/resources/themes/saga-blue/theme.css';
import 'primereact/resources/primereact.min.css';
import 'primeflex/primeflex.css';
import 'primeicons/primeicons.css';
import '../styles/principal.css';

import { Menubar } from 'primereact/menubar';
import { MenuItem } from 'primereact/menuitem';
;

const rutabase:string = '/OLC2-PROYECTO-EV2S-2024-G2' //Produccion
//const rutabase:string = '' //Local

const items: MenuItem[] = [
  {
    label: 'Principal',
    icon: 'pi pi-home',
    url: `${rutabase}/`
  },
  {
    label: 'Integrantes',
    icon: 'pi pi-star',
    url: `${rutabase}/creditos`
  }
];

const start = (
  <>
    <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
    <img alt="logo" src={`${rutabase}/iconos/fiusac_negro.png`} height="40" className="mr-2" />
    </div>
  </>
);

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es">
      <head>
        <title> Compi 2 Proyecto </title>
        <link rel="icon" href="iconos/fiusac.png" />
      </head>

      <body>
        <header>

        </header>

        
        <div className="content">
        <Menubar model={items} start={start}  className='menu-bar'/> 
          <div style={{padding: '2%'}}>
            {children}
          </div>
        </div>
        
      </body>
    </html>
  );
}
