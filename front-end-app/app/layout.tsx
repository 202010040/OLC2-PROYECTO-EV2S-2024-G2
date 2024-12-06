import 'primereact/resources/themes/saga-blue/theme.css';
import 'primereact/resources/primereact.min.css';
import 'primeflex/primeflex.css';

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
        {children}
      </body>
    </html>
  );
}
