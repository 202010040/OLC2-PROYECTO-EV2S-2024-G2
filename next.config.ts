import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  basePath: process.env.NEXT_PUBLIC_BASE_PATH || '',
  trailingSlash: true,
  publicRuntimeConfig: {
    basePath: process.env.NEXT_PUBLIC_BASE_PATH || '',
  },
};

export default nextConfig;
