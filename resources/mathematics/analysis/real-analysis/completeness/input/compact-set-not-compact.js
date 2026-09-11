(() => {
    const canvas = document.getElementById("compact-set-not-compact");
    if (!canvas) return;

    const figure = canvas.parentElement;
    const overlay = figure.querySelector(".compact-set-overlay");
    if (!overlay) return;

    const C = {
        ink: "#172B3A",
        blue: "#6689AA",
        terracotta: "#C97870",
        box: "#F8F2E5",
        boxBorder: "#DECEAA",
        surface: "#FBF7EF"
    };

    function addLabel(html, left, top, opts = {}) {
        const el = document.createElement("div");
        el.className = "compact-set-label";
        el.innerHTML = html;
        Object.assign(el.style, {
            position: "absolute",
            left: `${left}px`,
            top: `${top}px`,
            width: opts.width ? `${opts.width}px` : "max-content",
            maxWidth: "92%",
            color: opts.color || C.ink,
            fontFamily: '"Computer Modern Sans", sans-serif',
            fontSize: opts.fontSize || "1rem",
            lineHeight: opts.lineHeight || "1.25",
            textAlign: opts.align || "center",
            whiteSpace: opts.wrap ? "normal" : "nowrap",
            transform: [
                opts.tx ? `translateX(${opts.tx})` : "",
                opts.ty ? `translateY(${opts.ty})` : ""
            ].filter(Boolean).join(" "),
            pointerEvents: "none"
        });
        overlay.appendChild(el);
    }

    function point(x, y, r, stroke) {
        ctx.save();
        ctx.fillStyle = C.surface;
        ctx.strokeStyle = stroke;
        ctx.lineWidth = 2.4;
        ctx.beginPath();
        ctx.arc(x, y, r, 0, Math.PI * 2);
        ctx.fill();
        ctx.stroke();
        ctx.restore();
    }

    function arrow(x, y, dir) {
        const s = 8;
        ctx.save();
        ctx.fillStyle = C.ink;
        ctx.beginPath();
        if (dir < 0) {
            ctx.moveTo(x, y);
            ctx.lineTo(x + s, y - s / 2);
            ctx.lineTo(x + s, y + s / 2);
        } else {
            ctx.moveTo(x, y);
            ctx.lineTo(x - s, y - s / 2);
            ctx.lineTo(x - s, y + s / 2);
        }
        ctx.closePath();
        ctx.fill();
        ctx.restore();
    }

    function bracket(x1, x2, y, h) {
        const r = Math.min(9, h / 2);
        const t = y - h / 2;
        const b = y + h / 2;
        ctx.save();
        ctx.strokeStyle = C.blue;
        ctx.lineWidth = 3;
        ctx.lineCap = "round";
        ctx.lineJoin = "round";
        ctx.beginPath();
        ctx.moveTo(x1 + r, t);
        ctx.lineTo(x2 - r, t);
        ctx.quadraticCurveTo(x2, t, x2, t + r);
        ctx.lineTo(x2, b - r);
        ctx.quadraticCurveTo(x2, b, x2 - r, b);
        ctx.lineTo(x1 + r, b);
        ctx.quadraticCurveTo(x1, b, x1, b - r);
        ctx.lineTo(x1, t + r);
        ctx.quadraticCurveTo(x1, t, x1 + r, t);
        ctx.stroke();
        ctx.restore();
    }

    function roundRect(x, y, w, h, r) {
        ctx.beginPath();
        if (ctx.roundRect) {
            ctx.roundRect(x, y, w, h, r);
            return;
        }
        const q = Math.min(r, w / 2, h / 2);
        ctx.moveTo(x + q, y);
        ctx.lineTo(x + w - q, y);
        ctx.quadraticCurveTo(x + w, y, x + w, y + q);
        ctx.lineTo(x + w, y + h - q);
        ctx.quadraticCurveTo(x + w, y + h, x + w - q, y + h);
        ctx.lineTo(x + q, y + h);
        ctx.quadraticCurveTo(x, y + h, x, y + h - q);
        ctx.lineTo(x, y + q);
        ctx.quadraticCurveTo(x, y, x + q, y);
        ctx.closePath();
    }

    function draw() {
        overlay.innerHTML = "";

        const width = canvas.clientWidth || 900;
        const height = Math.max(410, width * 410 / 900);
        const dpr = window.devicePixelRatio || 1;

        canvas.style.height = `${height}px`;
        canvas.width = Math.round(width * dpr);
        canvas.height = Math.round(height * dpr);

        window.ctx = canvas.getContext("2d");
        ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
        ctx.clearRect(0, 0, width, height);

        const left = Math.max(34, width * 0.07);
        const right = width - left;
        const y = height * 0.13;
        const min = -0.5;
        const max = 1.5;
        const map = v => left + (v - min) / (max - min) * (right - left);

        ctx.strokeStyle = C.ink;
        ctx.lineWidth = 2;
        ctx.beginPath();
        ctx.moveTo(left, y);
        ctx.lineTo(right, y);
        ctx.stroke();
        arrow(left, y, -1);
        arrow(right, y, 1);

        point(map(0), y, 6, C.terracotta);
        point(map(1), y, 6, C.terracotta);
        addLabel("\\(0\\)", map(0), y + 14, {tx: "-50%", fontSize: "0.98rem"});
        addLabel("\\(1\\)", map(1), y + 14, {tx: "-50%", fontSize: "0.98rem"});

        const bars = [
            [0, 0.5, 0.31, "\\((0,0.5)\\)"],
            [0.25, 0.75, 0.44, "\\((0.25,0.75)\\)"],
            [0.5, 0.6, 0.57, "\\((0.5,0.6)\\)"]
        ];

        bars.forEach(([a, b, py, label]) => {
            const yy = height * py;
            bracket(map(a), map(b), yy, Math.max(25, height * 0.07));
            addLabel(label, (map(a) + map(b)) / 2, yy - 6, {
                tx: "-50%", ty: "-100%", fontSize: width < 600 ? "0.78rem" : "0.95rem"
            });
        });

        const dotsY = height * 0.65;
        ctx.save();
        ctx.strokeStyle = C.blue;
        ctx.lineWidth = 2;
        ctx.setLineDash([5, 5]);
        ctx.beginPath();
        ctx.moveTo(map(0.67), dotsY);
        ctx.lineTo(map(0.98), dotsY);
        ctx.stroke();
        ctx.restore();
        addLabel("\\(\\cdots\\)", map(0.65), dotsY - 4, {
            tx: "-100%", ty: "-100%", color: C.blue, fontSize: "1.15rem"
        });

        const bx = Math.max(18, width * 0.04);
        const by = height * 0.72;
        const bw = width - 2 * bx;
        const bh = height * 0.24;

        ctx.save();
        ctx.fillStyle = C.box;
        ctx.strokeStyle = C.boxBorder;
        ctx.lineWidth = 1.2;
        roundRect(bx, by, bw, bh, 4);
        ctx.fill();
        ctx.stroke();
        ctx.restore();

        addLabel(
            "For \\((0,1)\\), consider the open cover " +
            "\\(U_n=\\left(\\tfrac{1}{n+1},1\\right)\\), " +
            "where \\(n=1,2,3,\\dots\\). Together these intervals cover every point of \\((0,1)\\), " +
            "but any finite selection misses points sufficiently close to \\(0\\). Thus this particular " +
            "open cover has no finite subcover, so \\((0,1)\\) is not compact.",
            bx + 15, by + 12, {width: bw - 30, wrap: true, align: "left", fontSize: width < 600 ? "0.72rem" : "0.88rem", lineHeight: "1.38"}
        );

        if (window.MathJax && typeof MathJax.typesetPromise === "function") {
            MathJax.typesetPromise([overlay]);
        }
    }

    draw();
    let resizeTimer;
    window.addEventListener("resize", () => {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(draw, 100);
    });
})();