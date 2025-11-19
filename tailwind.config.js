// tailwind.config.js
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      colors: {
        "hot-pink": "#FF69B4",
        purple: "#6B46C1",
        blue: "#3182CE",
      },
    },
  },
  plugins: [],
};
