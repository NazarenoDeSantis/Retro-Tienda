const themeSwitch = document.getElementById("flexSwitchCheckDefault");
const rootElement = document.documentElement;
const pageFooter = document.getElementById("pageFooter"); // Referencia al footer

// Al cargar la página, aplica el tema guardado (si existe) en localStorage
document.addEventListener("DOMContentLoaded", function () {
    let savedTheme = localStorage.getItem("theme");
    if (savedTheme) {
        rootElement.setAttribute("data-bs-theme", savedTheme);
        themeSwitch.checked = savedTheme === "dark"; // Activa el switch si el tema es oscuro
        pageFooter.classList.toggle("footer-dark", savedTheme === "dark");
        pageFooter.classList.toggle("footer-light", savedTheme === "light");
    }
});

// Evento para alternar el tema
themeSwitch.addEventListener("change", function () {
    let theme = themeSwitch.checked ? "dark" : "light";
    rootElement.setAttribute("data-bs-theme", theme);
    localStorage.setItem("theme", theme); // Guarda la preferencia del usuario

    // Cambia la clase del footer para el tema
    pageFooter.classList.toggle("footer-dark", theme === "dark");
    pageFooter.classList.toggle("footer-light", theme === "light");
});