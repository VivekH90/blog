const canvas = document.getElementById(
    "infimum-supremum-number-line"
);

const ctx = canvas.getContext("2d");

function drawInfimumSupremumNumberLine() {

    // Render at device resolution for crisp lines and text.
    const dpr = window.devicePixelRatio || 1;
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;

    canvas.width = width * dpr;
    canvas.height = height * dpr;

    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

    // Mathematical range of the number line.
    const min = -2.5;
    const max = 3.5;

    const lineY = 150;
    const leftX = 45;
    const rightX = width - 45;

    const sqrt2 = Math.SQRT2;

    const x = value =>
        leftX +
        ((value - min) / (max - min)) *
        (rightX - leftX);


    // Clear the canvas.
    ctx.clearRect(0, 0, width, height);

    ctx.lineWidth = 2;
    ctx.lineCap = "round";
    ctx.textAlign = "center";
    ctx.textBaseline = "middle";


    // ------------------------------------------------------------
    // Highlight A = { x : x² < 2 } = (-√2, √2).
    // ------------------------------------------------------------

    const infX = x(-sqrt2);
    const supX = x(sqrt2);

    ctx.fillStyle = "rgba(47, 150, 114, 0.18)";

    ctx.fillRect(
        infX,
        lineY - 18,
        supX - infX,
        36
    );


    // ------------------------------------------------------------
    // Draw the number line.
    // ------------------------------------------------------------

    ctx.strokeStyle = "#273247";

    ctx.beginPath();
    ctx.moveTo(leftX, lineY);
    ctx.lineTo(rightX, lineY);
    ctx.stroke();


    // Arrowheads at both ends.

    const lineArrowSize = 10;

    ctx.fillStyle = "#273247";

    ctx.beginPath();
    ctx.moveTo(leftX, lineY);
    ctx.lineTo(leftX + lineArrowSize, lineY - 6);
    ctx.lineTo(leftX + lineArrowSize, lineY + 6);
    ctx.closePath();
    ctx.fill();

    ctx.beginPath();
    ctx.moveTo(rightX, lineY);
    ctx.lineTo(rightX - lineArrowSize, lineY - 6);
    ctx.lineTo(rightX - lineArrowSize, lineY + 6);
    ctx.closePath();
    ctx.fill();


    // ------------------------------------------------------------
    // Integer ticks and labels.
    // ------------------------------------------------------------

    for (let n = -2; n <= 3; n++) {

        const px = x(n);

        ctx.beginPath();
        ctx.moveTo(px, lineY - 8);
        ctx.lineTo(px, lineY + 8);
        ctx.stroke();

        ctx.fillStyle = "#273247";

        ctx.font =
            '18px "Computer Modern Sans", Arial, sans-serif';

        ctx.fillText(
            String(n),
            px,
            lineY + 30
        );
    }


    // ------------------------------------------------------------
    // Mark the supremum +√2.
    // ------------------------------------------------------------

    ctx.fillStyle = "#C44E52";

    ctx.beginPath();
    ctx.arc(
        supX,
        lineY,
        7,
        0,
        Math.PI * 2
    );

    ctx.fill();


    // Downward arrow. The tip stops 10 CSS pixels above
    // the number line, guaranteeing a visible gap.

    const arrowHeadSize = 8;
    const supArrowTipY = lineY - 10;
    const supTextY = 58;
    const supArrowStartY = 85;

    ctx.strokeStyle = "#C44E52";
    ctx.fillStyle = "#C44E52";

    ctx.beginPath();
    ctx.moveTo(supX, supArrowStartY);
    ctx.lineTo(supX, supArrowTipY);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(supX, supArrowTipY);
    ctx.lineTo(
        supX - arrowHeadSize,
        supArrowTipY - arrowHeadSize
    );
    ctx.lineTo(
        supX + arrowHeadSize,
        supArrowTipY - arrowHeadSize
    );
    ctx.closePath();
    ctx.fill();

    ctx.font =
        '18px "Computer Modern Sans", Arial, sans-serif';

    ctx.fillText(
        "√2 = sup(A)",
        supX,
        supTextY
    );


    // ------------------------------------------------------------
    // Mark the infimum −√2.
    // ------------------------------------------------------------

    // The infimum is indicated by an upward arrow from below.
    // Its arrowhead stops 10 CSS pixels below the number line.

    const infArrowTipY = lineY + 10;
    const infArrowStartY = 245;
    const infTextY = 275;

    ctx.strokeStyle = "#4575B4";
    ctx.fillStyle = "#4575B4";

    ctx.beginPath();
    ctx.moveTo(infX, infArrowStartY);
    ctx.lineTo(infX, infArrowTipY);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(infX, infArrowTipY);
    ctx.lineTo(
        infX - arrowHeadSize,
        infArrowTipY + arrowHeadSize
    );
    ctx.lineTo(
        infX + arrowHeadSize,
        infArrowTipY + arrowHeadSize
    );
    ctx.closePath();
    ctx.fill();

    ctx.font =
        '18px "Computer Modern Sans", Arial, sans-serif';

    ctx.fillText(
        "inf A = −√2",
        infX,
        infTextY
    );


    // ------------------------------------------------------------
    // Figure caption.
    // ------------------------------------------------------------

    ctx.fillStyle = "#273247";

    ctx.font =
        '16px "Computer Modern Serif", Georgia, serif';

    const caption =
        "Figure: The infimum and supremum of the set A = { x : x² < 2 }.";

    ctx.fillText(
        caption,
        width / 2,
        height - 22
    );
}


drawInfimumSupremumNumberLine();

window.addEventListener(
    "resize",
    drawInfimumSupremumNumberLine
);