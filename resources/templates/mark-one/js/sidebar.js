// sidebar initialization
document.addEventListener("DOMContentLoaded", () => {
    initializeSidebar();
});

// build sidebar
function initializeSidebar() {
    const sidebars =
        [...document.querySelectorAll("sidebar")];

    if (!sidebars.length) return;

    const firstSidebar =
        sidebars[0];

    const color =
        firstSidebar.getAttribute("color");

    const sidebar =
        document.createElement("aside");

    sidebar.className =
        "sidebar";

    if (color) {
        sidebar.style.setProperty(
            "--sidebar-color",
            color
        );
    }

    sidebars.forEach((source, index) => {

        if (index > 0) {
            const divider =
                document.createElement("hr");

            divider.className =
                "sidebar-divider";

            sidebar.appendChild(divider);
        }

        sidebar.appendChild(
            createSidebarGroup(source)
        );
    });

    // insert generated sidebar
    firstSidebar.parentNode.insertBefore(
        sidebar,
        firstSidebar
    );

    // remove source elements
    sidebars.forEach(source => {
        source.remove();
    });

    // render sidebar mathematics
    renderSidebarMath(sidebar);
}

// create sidebar group
function createSidebarGroup(source) {
    const group =
        document.createElement("section");

    group.className =
        "sidebar-group";

    // search
    if (
        source.getAttribute("search") ===
        "true"
    ) {
        group.appendChild(
            createSidebarSearch()
        );
    }

    // group title
    const title =
        source.getAttribute("title");

    if (title) {
        const heading =
            document.createElement("h2");

        heading.textContent =
            title;

        group.appendChild(heading);
    }

    // item list
    const list =
        document.createElement("ul");

    list.className =
        "sidebar-items";

    const items =
        source.querySelectorAll(
            ":scope > item"
        );

    items.forEach(item => {

        const li =
            document.createElement("li");

        const link =
            document.createElement("a");

        link.href =
            item.getAttribute("href") || "#";

        link.textContent =
            item.getAttribute("title") || "";

        li.appendChild(link);
        list.appendChild(li);
    });

    group.appendChild(list);

    return group;
}

// create search
function createSidebarSearch() {
    const search =
        document.createElement("div");

    search.className =
        "sidebar-search";

    const input =
        document.createElement("input");

    input.type = "text";
    input.placeholder =
        "Search notes...";

    const button =
        document.createElement("button");

    button.type = "button";

    button.setAttribute(
        "aria-label",
        "Search"
    );

    button.textContent = "⌕";

    search.appendChild(input);
    search.appendChild(button);

    return search;
}

// render sidebar mathematics
function renderSidebarMath(sidebar) {
    if (
        window.MathJax &&
        window.MathJax.startup
    ) {
        MathJax.startup.promise.then(() => {
            MathJax.typesetPromise([
                sidebar
            ]);
        });
    }
}