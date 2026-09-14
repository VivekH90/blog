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

        const image =
            source.getAttribute("image") || "banner.png";

        banner.style.backgroundImage =
            `url("${new URL(image, document.baseURI).href}")`;

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

    if (
        window.location.pathname.includes(
            "/computer-science/theory-of-computation/"
        )
    ) {
        const style =
            document.createElement("style");

        style.textContent = `
            .table-of-contents {
                background: #17212B !important;
                border-color: #344150 !important;
            }

            .table-of-contents h2 {
                color: #F0F4F8 !important;
                border-color: #344150 !important;
            }

            .toc-sections a {
                color: #DCE3EA !important;
            }
        `;

        document.head.appendChild(style);
    }
}