const canvas = document.getElementById("upper-bound-number-line");
const ctx = canvas.getContext("2d");

function drawUpperBoundNumberLine() {
    const dpr = window.devicePixelRatio || 1;
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;

    canvas.width = width * dpr;
    canvas.height = height * dpr;
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

    const min = -1.5;
    const max = 4.5;
    const lineY = 145;
    const leftX = 50;
    const rightX = width - 50;
    const usableWidth = rightX - leftX;

    const x = value =>
        leftX + ((value - min) / (max - min)) * usableWidth;

    ctx.clearRect(0, 0, width, height);
    ctx.lineWidth = 2;
    ctx.strokeStyle = "#273247";
    ctx.fillStyle = "#273247";
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
    ctx.lineTo(leftX + arrowSize, lineY - arrowSize / 1.5);
    ctx.lineTo(leftX + arrowSize, lineY + arrowSize / 1.5);
    ctx.closePath();
    ctx.fill();

    ctx.beginPath();
    ctx.moveTo(rightX, lineY);
    ctx.lineTo(rightX - arrowSize, lineY - arrowSize / 1.5);
    ctx.lineTo(rightX - arrowSize, lineY + arrowSize / 1.5);
    ctx.closePath();
    ctx.fill();

    // integer ticks
    for (let n = -1; n <= 4; n++) {
        const px = x(n);

        ctx.beginPath();
        ctx.moveTo(px, lineY - 8);
        ctx.lineTo(px, lineY + 8);
        ctx.stroke();

        if (n >= 1 && n <= 3) {
            ctx.beginPath();
            ctx.arc(px, lineY, 6, 0, Math.PI * 2);
            ctx.fill();

            ctx.font = '18px "Computer Modern Sans", sans-serif';
            ctx.fillText(String(n), px, lineY + 30);
        }
    }

    // downward arrow marking b = 3
    const threeX = x(3);
    const arrowTop = 55;
    const arrowBottom = lineY - 10;

    ctx.beginPath();
    ctx.moveTo(threeX, arrowTop + 28);
    ctx.lineTo(threeX, arrowBottom);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(threeX, arrowBottom);
    ctx.lineTo(threeX - 7, arrowBottom - 10);
    ctx.lineTo(threeX + 7, arrowBottom - 10);
    ctx.closePath();
    ctx.fill();

    ctx.font = '18px "Computer Modern Sans", sans-serif';
    ctx.fillText(
        "an upper bound for A: b = 3",
        threeX,
        arrowTop
    );

    // caption
    ctx.font = '16px "Computer Modern Serif", serif';
    ctx.fillText(
        "Figure: For the set A = {1, 2, 3}, b = 3 is an upper bound. Note that 4, 5, 10, etc. are also upper bounds.",
        width / 2,
        height - 25
    );
}

drawUpperBoundNumberLine();
window.addEventListener("resize", drawUpperBoundNumberLine);