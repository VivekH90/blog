// navigation initialization
document.addEventListener("DOMContentLoaded", () => {
    initializeNavigation();
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