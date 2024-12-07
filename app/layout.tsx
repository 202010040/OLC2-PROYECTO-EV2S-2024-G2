import 'primereact/resources/themes/saga-blue/theme.css';
import 'primereact/resources/primereact.min.css';
import 'primeflex/primeflex.css';
import 'primeicons/primeicons.css';
import '../styles/principal.css';

import { Menubar } from 'primereact/menubar';
import { MenuItem } from 'primereact/menuitem';
import getConfig from 'next/config';

const { publicRuntimeConfig } = getConfig();
const basePath = publicRuntimeConfig?.basePath || '';

const items: MenuItem[] = [
  {
    label: 'Principal',
    icon: 'pi pi-home',
    url: `${basePath}/`
  },
  {
    label: 'Integrantes',
    icon: 'pi pi-star',
    url: `${basePath}/creditos`
  }
];

const start = (
  <>
    <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }}>
      <img alt="logo" src="/iconos/fiusac_negro.png" height="40" className="mr-2" />
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
        <Menubar model={items} start={start} className='menu-bar'/> 
          {children}
        </div>
        
      </body>
    </html>
  );
}
