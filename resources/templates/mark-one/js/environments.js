// environment initialization
document.addEventListener("DOMContentLoaded", () => {
    initializeEnvironments();
});

// environment types
const environmentTypes = [
    "definition",
    "theorem",
    "lemma",
    "proposition",
    "corollary",
    "axiom"
];

// environment counters
const counters = {
    definition: 0,
    theorem: 0,
    lemma: 0,
    proposition: 0,
    corollary: 0,
    axiom: 0
};

// initialize environments
function initializeEnvironments() {
    environmentTypes.forEach(type => {
        const environments =
            document.querySelectorAll(type);

        environments.forEach(environment => {
            buildEnvironment(
                environment,
                type
            );
        });
    });

    document.querySelectorAll("proof").forEach(proof => {
        buildProof(proof);
    });
}

// build environment
function buildEnvironment(
    environment,
    type
) {
    counters[type]++;

    const title =
        environment.getAttribute("title") || "";

    const color =
        environment.getAttribute("color") ||
        getDefaultColor(type);

    const box =
        document.createElement("div");

    box.className =
        `math-environment ${type}-box`;

    setEnvironmentColors(
        box,
        color
    );

    // environment header
    const header =
        document.createElement("div");

    header.className =
        "environment-header";

    const heading =
        document.createElement("div");

    heading.className =
        "environment-heading";

    const numberElement =
        document.createElement("span");

    numberElement.className =
        "environment-number";

    numberElement.textContent =
        capitalize(type);

    const name =
        document.createElement("span");

    name.className =
        "environment-name";

    name.textContent =
        title ? `(${title})` : "";

    heading.appendChild(
        numberElement
    );

    if (title) {
        heading.appendChild(name);
    }

    // environment tag
    const tag =
        document.createElement("span");

    tag.className =
        "environment-tag";

    tag.textContent =
        capitalize(type);

    header.appendChild(heading);
    header.appendChild(tag);

    // environment content
    const content =
        document.createElement("div");

    content.className =
        "environment-content";

    const children =
        [...environment.children];

    let itemNumber = 0;

    children.forEach(child => {
        if (
            child.tagName.toLowerCase() ===
            "r-item"
        ) {
            itemNumber++;

            addRItem(
                child,
                content,
                itemNumber
            );
        } else {
            content.appendChild(
                child.cloneNode(true)
            );
        }
    });

    box.appendChild(header);
    box.appendChild(content);

    environment.replaceWith(box);

    renderEnvironmentMath(box);
}

// set environment colors
function setEnvironmentColors(
    element,
    color
) {
    element.style.setProperty(
        "--env-color",
        color
    );

    element.style.setProperty(
        "--env-dark-color",
        darkenColor(
            color,
            0.45
        )
    );

    element.style.setProperty(
        "--env-light-color",
        mixColor(
            color,
            "#FFFFFF",
            0.92
        )
    );

    element.style.setProperty(
        "--env-border-color",
        mixColor(
            color,
            "#FFFFFF",
            0.70
        )
    );
}

// r-item
function addRItem(
    item,
    content,
    number
) {
    const row =
        document.createElement("div");

    row.className =
        "environment-item";

    const circle =
        document.createElement("div");

    circle.className =
        "environment-number-circle";

    circle.textContent =
        number;

    const text =
        document.createElement("div");

    text.className =
        "environment-item-text";

    [...item.childNodes].forEach(node => {
        text.appendChild(
            node.cloneNode(true)
        );
    });

    row.appendChild(circle);
    row.appendChild(text);

    content.appendChild(row);
}

// build proof
function buildProof(proof) {
    const colback =
        proof.getAttribute("colback") ||
        "#EEF7F2";

    const coltext =
        proof.getAttribute("coltext") ||
        "#1F6B4F";

    const box =
        document.createElement("div");

    box.className =
        "proof-box";

    box.style.setProperty(
        "--proof-background",
        colback
    );

    box.style.setProperty(
        "--proof-color",
        coltext
    );

    // proof heading
    const title =
        document.createElement("h2");

    title.className =
        "proof-title";

    title.textContent =
        "Proof";

    box.appendChild(title);

    // proof content
    const content =
        document.createElement("div");

    content.className =
        "proof-content";

    [...proof.children].forEach(child => {
        const tag =
            child.tagName.toLowerCase();

        if (tag === "step") {
            content.appendChild(
                buildProofStep(
                    child
                )
            );
        } else if (tag === "proof-figure") {
            content.appendChild(
                buildProofFigure(
                    child
                )
            );
        } else {
            content.appendChild(
                child.cloneNode(true)
            );
        }
    });

    box.appendChild(content);

    proof.replaceWith(box);

    renderEnvironmentMath(box);
}

// build proof step
function buildProofStep(step) {
    const row =
        document.createElement("div");

    row.className =
        "proof-step";

    const number =
        document.createElement("div");

    number.className =
        "proof-step-number";

    const existingSteps =
        document.querySelectorAll(
            ".proof-step"
        ).length;

    number.textContent =
        existingSteps + 1;

    const content =
        document.createElement("div");

    content.className =
        "proof-step-content";

    const title =
        step.getAttribute("title") || "";

    if (title) {
        const heading =
            document.createElement("h3");

        heading.className =
            "proof-step-title";

        heading.innerHTML =
            title;

        content.appendChild(heading);
    }

    [...step.childNodes].forEach(node => {
        content.appendChild(
            node.cloneNode(true)
        );
    });

    row.appendChild(number);
    row.appendChild(content);

    return row;
}

// build proof figure
function buildProofFigure(source) {
    const figure =
        document.createElement("figure");

    figure.className =
        "proof-figure";

    const visual =
        document.createElement("div");

    visual.className =
        "proof-figure-visual";

    const src =
        source.getAttribute("src");

    if (src) {
        const image =
            document.createElement("img");

        image.src = src;

        const alt =
            source.getAttribute("alt") ||
            source.getAttribute("caption") ||
            "Proof figure";

        image.alt = alt;

        visual.appendChild(image);
    } else {
        [...source.childNodes].forEach(node => {
            visual.appendChild(
                node.cloneNode(true)
            );
        });
    }

    figure.appendChild(visual);

    const caption =
        source.getAttribute("caption");

    if (caption) {
        const figcaption =
            document.createElement("figcaption");

        const label =
            document.createElement("strong");

        label.textContent =
            "Figure:";

        figcaption.appendChild(label);

        figcaption.appendChild(
            document.createTextNode(
                ` ${caption}`
            )
        );

        figure.appendChild(figcaption);
    }

    return figure;
}

// darken color
function darkenColor(
    color,
    factor
) {
    const rgb =
        hexToRGB(color);

    if (!rgb) {
        return color;
    }

    return rgbToHex(
        rgb.r * factor,
        rgb.g * factor,
        rgb.b * factor
    );
}

// mix colors
function mixColor(
    color1,
    color2,
    amount
) {
    const rgb1 =
        hexToRGB(color1);

    const rgb2 =
        hexToRGB(color2);

    if (!rgb1 || !rgb2) {
        return color1;
    }

    const r =
        rgb1.r +
        (rgb2.r - rgb1.r) *
        amount;

    const g =
        rgb1.g +
        (rgb2.g - rgb1.g) *
        amount;

    const b =
        rgb1.b +
        (rgb2.b - rgb1.b) *
        amount;

    return rgbToHex(
        r,
        g,
        b
    );
}

// convert hex to rgb
function hexToRGB(color) {
    if (!color) {
        return null;
    }

    let hex =
        color.trim();

    if (hex.startsWith("#")) {
        hex = hex.slice(1);
    }

    if (hex.length === 3) {
        hex =
            hex
                .split("")
                .map(value => value + value)
                .join("");
    }

    if (hex.length !== 6) {
        return null;
    }

    const value =
        parseInt(
            hex,
            16
        );

    return {
        r: (value >> 16) & 255,
        g: (value >> 8) & 255,
        b: value & 255
    };
}

// convert rgb to hex
function rgbToHex(
    r,
    g,
    b
) {
    const values = [
        r,
        g,
        b
    ].map(value =>
        Math.max(
            0,
            Math.min(
                255,
                Math.round(value)
            )
        )
    );

    return (
        "#" +
        values
            .map(value =>
                value
                    .toString(16)
                    .padStart(2, "0")
            )
            .join("")
    );
}

// default colors
function getDefaultColor(type) {
    const colors = {
        definition: "#2F9672",
        theorem: "#3F6FA0",
        lemma: "#765A75",
        proposition: "#765A75",
        corollary: "#B77D69",
        axiom: "#B77D69"
    };

    return colors[type];
}

// render mathematics
function renderEnvironmentMath(element) {
    if (
        window.MathJax &&
        window.MathJax.startup
    ) {
        MathJax.startup.promise.then(() => {
            MathJax.typesetPromise([
                element
            ]);
        });
    }
}

// capitalize
function capitalize(text) {
    return (
        text.charAt(0).toUpperCase() +
        text.slice(1)
    );
}