// navigation initialization
document.addEventListener("DOMContentLoaded", () => {
    initializeNavigation();
    initializeThemeToggle();
});

// build navigation
function initializeNavigation() {
    const navbar =
        document.querySelector(".navbar");

    if (!navbar) return;

    const buttons = [
        {
            tag: "home",
            className: "home-btn"
        },
        {
            tag: "date",
            className: "date-btn"
        },
        {
            tag: "github",
            className: "github-btn"
        }
    ];

    buttons.forEach(button => {
        const element =
            navbar.querySelector(button.tag);

        if (!element) return;

        const link =
            document.createElement("a");

        link.className =
            button.className;

        link.textContent =
            element.textContent.trim();

        const href =
            element.getAttribute("href");

        if (href) {
            link.href = href;
        }

        const color =
            element.getAttribute("color");

        if (color) {
            link.style.setProperty(
                "--nav-color",
                color
            );
        }

        element.replaceWith(link);
    });
}

function initializeThemeToggle() {
    const toggle = document.querySelector(".theme-toggle");
    if (!toggle) return;

    const root = document.documentElement;
    const icon = toggle.querySelector(".theme-icon");
    const label = toggle.querySelector(".theme-label");

    const applyTheme = dark => {
        root.classList.toggle("dark-mode", dark);
        root.style.colorScheme = dark ? "dark" : "light";
        toggle.setAttribute("aria-pressed", String(dark));
        toggle.setAttribute("aria-label", dark ? "Enable light mode" : "Enable dark mode");
        if (icon) icon.textContent = dark ? "☀" : "☾";
        if (label) label.textContent = dark ? "Light Mode" : "Dark Mode";
    };

    const saved = localStorage.getItem("mark-one-theme");
    applyTheme(saved === "dark");

    toggle.addEventListener("click", () => {
        const dark = !root.classList.contains("dark-mode");
        applyTheme(dark);
        localStorage.setItem("mark-one-theme", dark ? "dark" : "light");
    });
}
