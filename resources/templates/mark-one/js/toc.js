// toc initialization
document.addEventListener("DOMContentLoaded", () => {
    initializeTableOfContents();
});

function initializeTableOfContents() {
    const tocElement =
        document.querySelector("table-of-contents");

    if (!tocElement) return;

    const documentElement =
        document.querySelector("#document");

    if (!documentElement) return;

    setTOCColor(tocElement);

    const documentTree =
        buildDocumentTree(documentElement);

    renderTOC(tocElement, documentTree);

    initializeActiveSectionObserver(documentTree);
}

// toc color
function setTOCColor(tocElement) {
    const tocColor =
        tocElement.getAttribute("color");

    if (tocColor) {
        tocElement.style.setProperty(
            "--toc-color",
            tocColor
        );
    }
}

// build document tree
function buildDocumentTree(documentElement) {
    const documentTree = [];

    const sections =
        documentElement.querySelectorAll(
            ":scope > section"
        );

    sections.forEach((section, sectionIndex) => {
        const sectionNumber = sectionIndex + 1;

        const sectionTitle =
            section.getAttribute("title") ||
            "Untitled Section";

        const sectionID =
            `section-${sectionNumber}`;

        section.id = sectionID;
        section.dataset.number = sectionNumber;

        const subsections =
            section.querySelectorAll(
                ":scope > subsection"
            );

        const subsectionTree = [];

        subsections.forEach(
            (subsection, subsectionIndex) => {
                const subsectionNumber =
                    `${sectionNumber}.${subsectionIndex + 1}`;

                const subsectionTitle =
                    subsection.getAttribute("title") ||
                    "Untitled Subsection";

                const subsectionID =
                    `section-${sectionNumber}-${subsectionIndex + 1}`;

                subsection.id = subsectionID;
                subsection.dataset.number =
                    subsectionNumber;

                subsectionTree.push({
                    number: subsectionNumber,
                    title: subsectionTitle,
                    element: subsection,
                    id: subsectionID
                });
            }
        );

        documentTree.push({
            number: sectionNumber,
            title: sectionTitle,
            element: section,
            id: sectionID,
            subsections: subsectionTree
        });
    });

    return documentTree;
}

// render toc
function renderTOC(tocElement, documentTree) {
    tocElement.innerHTML = "";

    const box =
        document.createElement("div");
    box.className = "table-of-contents-box";

    const panel =
        document.createElement("div");
    panel.className = "table-of-contents";

    const title =
        document.createElement("h2");
    title.textContent = "Contents";

    const sectionList =
        document.createElement("ul");
    sectionList.className = "toc-sections";

    documentTree.forEach(sectionData => {
        sectionList.appendChild(
            createSectionItem(sectionData)
        );
    });

    panel.appendChild(title);
    panel.appendChild(sectionList);
    box.appendChild(panel);
    tocElement.appendChild(box);
}

// section item
function createSectionItem(sectionData) {
    const item =
        document.createElement("li");

    item.dataset.target = sectionData.id;

    const link =
        document.createElement("a");

    link.href = `#${sectionData.id}`;

    const number =
        document.createElement("span");
    number.className = "toc-number";
    number.textContent =
        sectionData.number;

    const text =
        document.createElement("span");
    text.className = "toc-title";
    text.textContent =
        sectionData.title;

    link.appendChild(number);
    link.appendChild(text);
    item.appendChild(link);

    if (sectionData.subsections.length > 0) {
        const subsectionList =
            document.createElement("ul");

        subsectionList.className =
            "toc-subsections";

        sectionData.subsections.forEach(
            subsectionData => {
                subsectionList.appendChild(
                    createSubsectionItem(
                        subsectionData
                    )
                );
            }
        );

        item.appendChild(subsectionList);
    }

    return item;
}

// subsection item
function createSubsectionItem(subsectionData) {
    const item =
        document.createElement("li");

    item.dataset.target =
        subsectionData.id;

    const link =
        document.createElement("a");

    link.href =
        `#${subsectionData.id}`;

    const number =
        document.createElement("span");

    number.className = "toc-number";
    number.textContent =
        subsectionData.number;

    const text =
        document.createElement("span");

    text.className = "toc-title";
    text.textContent =
        subsectionData.title;

    link.appendChild(number);
    link.appendChild(text);
    item.appendChild(link);

    return item;
}

// active section detection
function initializeActiveSectionObserver(documentTree) {
    const targets = [];

    documentTree.forEach(sectionData => {
        targets.push({
            element: sectionData.element,
            id: sectionData.id
        });

        sectionData.subsections.forEach(
            subsectionData => {
                targets.push({
                    element: subsectionData.element,
                    id: subsectionData.id
                });
            }
        );
    });

    const observer =
        new IntersectionObserver(
            entries => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        setActiveTOCItem(
                            entry.target.id
                        );
                    }
                });
            },
            {
                rootMargin: "-20% 0px -65% 0px",
                threshold: 0
            }
        );

    targets.forEach(target => {
        observer.observe(target.element);
    });
}

// active toc item
function setActiveTOCItem(targetID) {
    document
        .querySelectorAll(
            ".toc-sections li.toc-item-active"
        )
        .forEach(item => {
            item.classList.remove(
                "toc-item-active"
            );
        });

    const activeItem =
        document.querySelector(
            `.toc-sections li[data-target="${targetID}"]`
        );

    if (activeItem) {
        activeItem.classList.add(
            "toc-item-active"
        );
    }
}