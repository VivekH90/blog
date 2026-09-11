(() => {
    const canvas = document.getElementById("compact-set-not-compact");
    if (!canvas) return;

    const figure = canvas.parentElement;
    const overlay = figure.querySelector(".compact-set-overlay");
    if (!overlay) return;

    const C = {
        ink: "#172B3A",
        blue: "rgba(102,137,170,0.48)",
        teal: "rgba(79,129,120,0.42)",
        lavender: "rgba(140,127,176,0.42)",
        terracotta: "rgba(201,120,112,0.40)",
        point: "#C97870",
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

    function bar(x1, x2, y, h, fill) {
        const r=Math.min(6,h/2),t=y-h/2,b=y+h/2;
        ctx.save(); ctx.fillStyle=fill; ctx.strokeStyle=fill.replace(/rgba\(([^,]+),([^,]+),([^,]+),[^)]+\)/,"rgba($1,$2,$3,0.95)");
        ctx.lineWidth=1.6; ctx.beginPath(); ctx.moveTo(x1+r,t); ctx.lineTo(x2-r,t);
        ctx.quadraticCurveTo(x2,t,x2,t+r); ctx.lineTo(x2,b-r); ctx.quadraticCurveTo(x2,b,x2-r,b);
        ctx.lineTo(x1+r,b); ctx.quadraticCurveTo(x1,b,x1,b-r); ctx.lineTo(x1,t+r);
        ctx.quadraticCurveTo(x1,t,x1+r,t); ctx.closePath(); ctx.fill(); ctx.stroke(); ctx.restore();
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

        // The intervals U_n=(1/(n+1),1/n) sit directly on the number line.
        const intervals = [
            [1/2,1,C.blue,"\\(U_1=\\left(\\tfrac{1}{2},1\\right)\\)"],
            [1/3,1/2,C.teal,"\\(U_2=\\left(\\tfrac{1}{3},\\tfrac{1}{2}\\right)\\)"],
            [1/4,1/3,C.lavender,"\\(U_3=\\left(\\tfrac{1}{4},\\tfrac{1}{3}\\right)\\)"],
            [1/5,1/4,C.terracotta,"\\(U_4=\\left(\\tfrac{1}{5},\\tfrac{1}{4}\\right)\\)"]
        ];
        const overlap=Math.max(2,width*.004),barH=Math.max(15,height*.06);
        intervals.forEach(([a,b,color,text])=>{
            const x1=Math.max(map(0)+1,map(a)-overlap),x2=Math.min(map(1)-1,map(b)+overlap);
            bar(x1,x2,y,barH,color);
            addLabel(text,(x1+x2)/2,y-5,{tx:"-50%",ty:"-100%",fontSize:width<650?"0.66rem":"0.84rem"});
        });

        // Infinitely many smaller intervals continue toward 0.
        const dotsY=y+height*.075;
        ctx.save(); ctx.strokeStyle=C.ink; ctx.lineWidth=2; ctx.setLineDash([5,5]);
        ctx.beginPath(); ctx.moveTo(map(.08),dotsY); ctx.lineTo(map(.20),dotsY); ctx.stroke(); ctx.restore();
        addLabel("\\(\\cdots\\)",map(.06),dotsY-5,{tx:"-100%",ty:"-100%",color:C.ink,fontSize:"1.1rem"});

        const bx = Math.max(18, width * 0.04);
        const by = height * 0.36;
        const bw = width - 2 * bx;
        const bh = height * 0.56;

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
            "\\(U_n=\\left(\\tfrac{1}{n+1},\\tfrac{1}{n}\\right)\\) for " +
            "\\(n=1,2,3,\\dots\\). These intervals cover every point of \\((0,1)\\), " +
            "but any finite selection misses points sufficiently close to \\(0\\). " +
            "Hence this cover has no finite subcover, so \\((0,1)\\) is not compact.",
            bx+15,by+14,{width:bw-30,wrap:true,align:"left",fontSize:width<650?"0.72rem":"0.88rem",lineHeight:"1.38"}
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