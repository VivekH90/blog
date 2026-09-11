const canvas = document.getElementById("upper-bound-number-line");
const ctx = canvas.getContext("2d");

function drawNumberLine() {
    const dpr = window.devicePixelRatio || 1;
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;

    canvas.width = width * dpr;
    canvas.height = height * dpr;
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

    const min = -1.5;
    const max = 4.5;
    const lineY = 130;
    const leftX = 45;
    const rightX = width - 45;

    const x = value =>
        leftX +
        ((value - min) / (max - min)) *
        (rightX - leftX);

    ctx.clearRect(0, 0, width, height);

    ctx.strokeStyle = "#273247";
    ctx.fillStyle = "#273247";
    ctx.lineWidth = 2;
    ctx.lineCap = "round";
    ctx.textAlign = "center";
    ctx.textBaseline = "middle";

    // number line
    ctx.beginPath();
    ctx.moveTo(leftX, lineY);
    ctx.lineTo(rightX, lineY);
    ctx.stroke();

    // arrowheads
    const arrowSize = 9;

    ctx.beginPath();
    ctx.moveTo(leftX, lineY);
    ctx.lineTo(leftX + arrowSize, lineY - 6);
    ctx.lineTo(leftX + arrowSize, lineY + 6);
    ctx.closePath();
    ctx.fill();

    ctx.beginPath();
    ctx.moveTo(rightX, lineY);
    ctx.lineTo(rightX - arrowSize, lineY - 6);
    ctx.lineTo(rightX - arrowSize, lineY + 6);
    ctx.closePath();
    ctx.fill();

    // ticks and the set A = {1, 2, 3}
    for (let n = -1; n <= 4; n++) {
        const px = x(n);

        ctx.beginPath();
        ctx.moveTo(px, lineY - 7);
        ctx.lineTo(px, lineY + 7);
        ctx.stroke();

        if (n >= 1 && n <= 3) {
            ctx.beginPath();
            ctx.arc(px, lineY, 6, 0, Math.PI * 2);
            ctx.fill();

            ctx.font =
                '18px "Computer Modern Sans", sans-serif';

            ctx.fillText(
                String(n),
                px,
                lineY + 28
            );
        }
    }

    // downward arrow to the upper bound b = 4
    const fourX = x(4);
    const arrowTop = 58;
    const arrowBottom = lineY - 10;

    ctx.beginPath();
    ctx.moveTo(fourX, arrowTop + 27);
    ctx.lineTo(fourX, arrowBottom);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(fourX, arrowBottom);
    ctx.lineTo(fourX - 7, arrowBottom - 10);
    ctx.lineTo(fourX + 7, arrowBottom - 10);
    ctx.closePath();
    ctx.fill();

    ctx.font =
        '18px "Computer Modern Sans", sans-serif';

    ctx.fillText(
        "An upper bound for A: b = 4",
        fourX,
        arrowTop
    );

    // caption
    ctx.font =
        '16px "Computer Modern Serif", serif';

    const caption =
        "Figure: For the set A = {1, 2, 3}, b = 4 is an upper bound. Note that 5, 10, etc. are also upper bounds.";

    const words = caption.split(" ");
    const lines = [];
    const maxWidth = width - 30;
    let line = "";

    for (const word of words) {
        const test =
            line ? line + " " + word : word;

        if (
            ctx.measureText(test).width > maxWidth &&
            line
        ) {
            lines.push(line);
            line = word;
        } else {
            line = test;
        }
    }

    if (line) lines.push(line);

    const lineHeight = 20;
    const startY =
        height - 25 -
        ((lines.length - 1) * lineHeight) / 2;

    lines.forEach((text, index) => {
        ctx.fillText(
            text,
            width / 2,
            startY + index * lineHeight
        );
    });
}

drawNumberLine();

window.addEventListener(
    "resize",
    drawNumberLine
);