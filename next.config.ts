import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
    output: 'export',
    publicRuntimeConfig: {
      basePath: '/OLC2-PROYECTO-EV2S-2024-G2', // Exponer basePath al runtime
    },
    
};

export default nextConfig;
