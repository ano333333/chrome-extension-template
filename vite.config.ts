import { crx, defineManifest } from "@crxjs/vite-plugin";
import { svelte } from "@sveltejs/vite-plugin-svelte";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite";

// https://vite.dev/config/
export default defineConfig({
	root: "src",
	envDir: "../",
	plugins: [
		svelte(),
		tailwindcss(),
		crx({
			manifest: defineManifest({
				manifest_version: 3,
				name: "Chrome Extension Template",
				version: "1.0.0",
				action: {
					default_popup: "popup.html",
				},
			}),
		}),
	],
	build: {
		outDir: "../dist",
		rollupOptions: {
			input: {
				popup: "src/popup.html",
			},
			output: {
				entryFileNames: "[name].js",
			},
		},
		emptyOutDir: true,
	},
	server: {
		port: 5173,
		strictPort: true,
		hmr: {
			port: 5173,
		},
	},
});
