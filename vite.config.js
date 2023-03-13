import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import { imagetools } from 'vite-imagetools';

export default defineConfig({
    plugins: [
        laravel({
            input: 'resources/js/app.js',
            refresh: true,
            transformOnServe: (code, devServerUrl) => code.replaceAll('/@imagetools', devServerUrl+'/storage/app/public'),
        }),
        imagetools(),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
});
