import type { NextConfig } from "next";

/*
const nextConfig: NextConfig = {
  basePath: process.env.NEXT_PUBLIC_BASE_PATH || '',
  trailingSlash: true,
  publicRuntimeConfig: {
    basePath: process.env.NEXT_PUBLIC_BASE_PATH || '',
  },
};

export default nextConfig;
*/

// Produccion
const nextConfig: NextConfig = {
  basePath: '/OLC2-PROYECTO-EV2S-2024-G2',
  output: 'export'
};

export default nextConfig;