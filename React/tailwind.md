### Install Tailwind
`npm install -D tailwindcss postcss autoprefixer`
`npx tailwindcss init -p`
On `tailwind.config.js` file include
    ```
    module.exports = {
        content: [
            "./src/**/*.{js,jsx,ts,tsx}",
        ],
        theme: {
            extend: {},
        },
        plugins: [],
        }
    ```
Add the `@tailwind` directives for each of Tailwind’s layers to your `./src/index.css` file.
    ```
    @tailwind base;
    @tailwind components;
    @tailwind utilities;
    ````
