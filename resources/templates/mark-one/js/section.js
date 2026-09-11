// section initialization
document.addEventListener("DOMContentLoaded", () => {
    initializeSections();
});

// section types
const sectionTypes = [
    "section",
    "subsection"
];

// initialize sections
function initializeSections() {
    const sections =
        document.querySelectorAll(
            "#document > section"
        );

    sections.forEach(
        (section, sectionIndex) => {

            const sectionNumber =
                sectionIndex + 1;

            buildSection(
                section,
                sectionNumber
            );

            buildSubsections(
                section,
                sectionNumber
            );
        }
    );
}

// build section
function buildSection(
    section,
    sectionNumber
) {
    const title =
        section.getAttribute("title") || "";

    const color =
        section.getAttribute("color") ||
        "#765A75";

    section.style.setProperty(
        "--section-color",
        color
    );

    const heading =
        document.createElement("h2");

    heading.className =
        "section-title";

    const number =
        document.createElement("span");

    number.className =
        "section-number";

    number.innerHTML =
        "\\(\\S\\) " + sectionNumber;

    const text =
        document.createElement("span");

    text.className =
        "section-text";

    text.textContent =
        title;

    heading.appendChild(number);
    heading.appendChild(text);

    section.prepend(heading);

    section.dataset.number =
        sectionNumber;

    renderSectionMath(section);
}

// build subsections
function buildSubsections(
    section,
    sectionNumber
) {
    const subsections =
        section.querySelectorAll(
            ":scope > subsection"
        );

    subsections.forEach(
        (
            subsection,
            subsectionIndex
        ) => {

            const subsectionNumber =
                `${sectionNumber}.${subsectionIndex + 1}`;

            buildSubsection(
                subsection,
                subsectionNumber
            );
        }
    );
}

// build subsection
function buildSubsection(
    subsection,
    subsectionNumber
) {
    const title =
        subsection.getAttribute("title") || "";

    const color =
        subsection.getAttribute("color") ||
        "#765A75";

    subsection.style.setProperty(
        "--section-color",
        color
    );

    const heading =
        document.createElement("h3");

    heading.className =
        "subsection-title";

    const number =
        document.createElement("span");

    number.className =
        "subsection-number";

    number.textContent =
        subsectionNumber;

    const text =
        document.createElement("span");

    text.className =
        "subsection-text";

    text.textContent =
        title;

    heading.appendChild(number);
    heading.appendChild(text);

    subsection.prepend(heading);

    subsection.dataset.number =
        subsectionNumber;

    renderSectionMath(subsection);
}

// render section mathematics
function renderSectionMath(section) {
    if (
        window.MathJax &&
        window.MathJax.startup
    ) {
        MathJax.startup.promise.then(() => {
            MathJax.typesetPromise([
                section
            ]);
        });
    }
}