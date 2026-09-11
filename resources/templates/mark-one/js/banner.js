// banner initialization
document.addEventListener("DOMContentLoaded", () => {
    initializeBanner();
});

// build banner
function initializeBanner() {
    const banners =
        document.querySelectorAll("banner");

    banners.forEach(source => {
        const banner =
            document.createElement("div");

        banner.className = "banner";

        const title =
            source.getAttribute("title") || "";

        const color =
            source.getAttribute("color");

        banner.style.backgroundImage =
            `url("${new URL("banner.png", document.baseURI).href}")`;

        if (color) {
            banner.style.setProperty(
                "--banner-color",
                color
            );
        }

        const heading =
            document.createElement("h1");

        heading.textContent = title;

        banner.appendChild(heading);

        source.replaceWith(banner);
    });
}