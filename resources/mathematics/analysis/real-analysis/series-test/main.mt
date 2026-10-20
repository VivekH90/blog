@documenttitle{Mathematics}
@doctype(notes)
@author{Vivek Kalita}
@date{5 October 2026}
@title{Abel and Dirichlet tests for series}
@description{A rudimentary exploration of some of the basic tests of convergence: Abel and Dirichlet}
@tags{Real Analysis, Convergence, Abel's test, Dirichlet's test}

@section{Introduction, label = section-label}

Before begining, lets see what our intuition says. Consider the series:

\[
\sum_{n=1}^{\infty}a_n = \sum_{n=1}^{\infty}\frac{1}{n^2} = \frac{1}{1^2}+\frac{1}{2^2}+\frac{1}{3^2}+\cdots
\]

and consider the sequence:
\[
b_n = \frac{1}{n}
\]

What do you think will the behaviour of the series be:
\[
\sum_{n=1}^{\infty}a_n b_n =  \sum_{n=1}^{\infty} \frac{1}{n^3}
\]

This in fact is a well known sequence, and it is well known to be convergent. In general if you have a converget series:
\[
\sum_{n=1}^{\infty}a_n
\]

and we multipy its terms by another sequence \((b_n)\). Your intuition would obviosuly say that the series:
\[
\sum_{n=1}^{\infty}a_n b_n 
\]
is convergent.

An useful case is when \((b_n)\) is monotone and bounded.

@begin(lemma = Summation by Parts)

Let

\[
A_n=\sum_{k=1}^{n}a_k.
\]

Then, for \(m\le n\),

\[
\sum_{k=m}^{n}a_kb_k
=
A_nb_n-A_{m-1}b_m
+
\sum_{k=m}^{n-1}A_k(b_k-b_{k+1}).
\]

@end(lemma)

@begin(proof)

Since

\[
a_k=A_k-A_{k-1},
\]

we have

\[
\sum_{k=m}^{n}a_kb_k
=
\sum_{k=m}^{n}(A_k-A_{k-1})b_k.
\]

Expanding,

\[
=
A_mb_m+A_{m+1}b_{m+1}+\cdots+A_nb_n
-
A_{m-1}b_m-A_mb_{m+1}-\cdots-A_{n-1}b_n.
\]

Grouping the terms gives

\[
\sum_{k=m}^{n}a_kb_k
=
A_nb_n-A_{m-1}b_m
+
A_m(b_m-b_{m+1})
+\cdots+
A_{n-1}(b_{n-1}-b_n).
\]

Hence,

\[
\sum_{k=m}^{n}a_kb_k
=
A_nb_n-A_{m-1}b_m
+
\sum_{k=m}^{n-1}A_k(b_k-b_{k+1}).
\]

@end(proof)

@begin(colourbox)

The summation by parts formula is just the discrete product rule written
and summed. The terms \(A_kb_k\) cancel successively, leaving only the
end terms and the changes \(b_k-b_{k+1}\).

@end(colourbox)

@begin(theorem = Abel's Test)

Suppose that

\[
\sum_{n=1}^{\infty}a_n
\]

converges and that \((b_n)\) is monotone and bounded. Then

\[
\sum_{n=1}^{\infty}a_nb_n
\]

converges.

@end(theorem)

@begin(proof)

Let

\[
A_n=\sum_{k=1}^{n}a_k.
\]

Since \(\sum a_n\) converges, \(A_n\to A\) for some \(A\in\mathbb R\).
Also, since \((b_n)\) is monotone and bounded,

\[
b_n\to b
\]

for some \(b\in\mathbb R\).

We show that the partial sums of \(\sum a_nb_n\) form a Cauchy
sequence.

Let \(\epsilon>0\). Since \(A_n\to A\), choose \(N\) such that

\[
n\ge N\implies |A_n-A|<\epsilon.
\]

Since \(b_n\) is monotone and converges, its total variation is bounded.
Using summation by parts, for \(n>m\ge N\),

\[
\sum_{k=m}^{n}a_kb_k
=
A_nb_n-A_{m-1}b_m
+
\sum_{k=m}^{n-1}A_k(b_k-b_{k+1}).
\]

Subtracting \(A\) from each \(A_k\), the terms involving \(A\) cancel,
because

\[
Ab_m-Ab_n+\sum_{k=m}^{n-1}A(b_k-b_{k+1})=0.
\]

Thus

\[
\sum_{k=m}^{n}a_kb_k
=
(A_n-A)b_n-(A_{m-1}-A)b_m
+
\sum_{k=m}^{n-1}(A_k-A)(b_k-b_{k+1}).
\]

Since \((b_n)\) is bounded, say \(|b_n|\le M\), and \(b_n\) is monotone,

\[
\sum_{k=m}^{n-1}|b_k-b_{k+1}|
\le 2M.
\]

Therefore,

\[
\left|\sum_{k=m}^{n}a_kb_k\right|
\le
2M\epsilon+2M\epsilon
=
4M\epsilon.
\]

Hence the partial sums are Cauchy, and therefore

\[
\sum_{n=1}^{\infty}a_nb_n
\]

converges.

@end(proof)

@begin(animation, label = summation-by-parts)

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css">

<style>

.sp-anim {
    width: 100%;
    color: var(--fg);
    font-family: var(--serif);
}

/* Prevent KaTeX HTML + MathML from appearing twice */
.sp-anim .katex-mathml {
    display: none !important;
}

.sp-anim .katex-html {
    display: inline-block !important;
}

.sp-anim figure {
    margin: 0;
    padding: 2px 6px 10px;
    overflow: hidden;
}

.sp-anim svg {
    display: block;
    width: 100%;
    max-width: 600px;
    height: auto;
    margin: 0 auto;
}

/* Original animation colours */

.sp-anim {
    --sp-c1: #2f6db5;
    --sp-c2: #1f8a7e;
    --sp-c3: #c9821f;
    --sp-c4: #7d4cb8;
    --sp-hatch: #b8321f;
}

:root[data-theme="dark"] .sp-anim {
    --sp-c1: #4f86d1;
    --sp-c2: #2fa597;
    --sp-c3: #d9962f;
    --sp-c4: #9a6fd6;
    --sp-hatch: #ff8272;
}

.sp-anim .ax {
    stroke: var(--muted);
    stroke-width: 1.4;
}

.sp-anim .tk {
    stroke: var(--muted);
    stroke-width: 1;
}

.sp-anim .gr {
    stroke: var(--muted);
    stroke-width: 1;
    opacity: .22;
}

.sp-anim .cut {
    stroke: var(--fg);
    stroke-width: 1.3;
    stroke-dasharray: 5 4;
}

.sp-anim .frame {
    fill: none;
    stroke: var(--fg);
    stroke-width: 1.8;
}

.sp-anim .fl {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: var(--serif);
    font-size: 14px;
    line-height: 1;
    white-space: nowrap;
}

.sp-anim .fl .katex {
    font-size: 1em;
}

.sp-anim .pl {
    color: var(--fg);
    text-shadow: none;
}

.sp-anim .dl {
    color: var(--fg);
    text-shadow: none;
}

.sp-anim .mu {
    color: var(--muted);
}

.sp-anim .controls {
    display: flex;
    align-items: center;
    gap: 8px;
    flex-wrap: wrap;
    width: 100%;
    max-width: 600px;
    margin: 4px auto 0;
    padding-bottom: 12px;
}

.sp-anim button {
    font-family: var(--sans);
    font-size: .85rem;
    color: var(--fg);
    background: var(--card);
    border: 1px solid var(--rule);
    border-radius: 8px;
    padding: 6px 11px;
    cursor: pointer;
    white-space: nowrap;
}

.sp-anim button:hover {
    border-color: var(--fg);
}

.sp-anim button:focus-visible,
.sp-anim input:focus-visible {
    outline: 2px solid var(--link);
    outline-offset: 2px;
}

.sp-anim button.play {
    min-width: 68px;
}

.sp-anim button[aria-current="true"] {
    background: var(--link);
    border-color: var(--link);
    color: var(--bg);
}

.sp-anim input[type="range"] {
    flex: 1;
    min-width: 90px;
    accent-color: var(--link);
}

@media (max-width: 520px) {

    .sp-anim figure {
        padding-left: 0;
        padding-right: 0;
        padding-bottom: 14px;
    }

    .sp-anim .controls {
        gap: 6px;
    }

    .sp-anim button {
        font-size: .8rem;
        padding: 5px 9px;
    }
}

</style>

<div class="sp-anim">

<figure>
<svg id="sp-svg"
     viewBox="0 0 400 320"
     role="img"
     aria-label="Summation by parts animation">
</svg>
</figure>

<div class="controls">

<button id="sp-play" class="play">Pause</button>

<input id="sp-scrub"
       type="range"
       min="0"
       max="2"
       step="0.001"
       value="0"
       aria-label="Animation progress">

<button data-s="0">Columns</button>
<button data-s="1">Rows</button>
<button data-s="2">Rectangle</button>
<button id="sp-rnd">New</button>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.js"></script>

<script>
(function(){

var NS='http://www.w3.org/2000/svg';

var $=function(i){
    return document.getElementById(i);
};

var PAL=[
    '--sp-c1',
    '--sp-c2',
    '--sp-c3',
    '--sp-c4'
];

var a=[2,1,3,2];
var b=[1,2,3.5,4.5];

var G={};
var pcs=[];
var strips=[];
var cols=[];
var widths=[];
var rows=[];
var cutL=[];

var p=0;
var q=0;
var stage=0;

var raf=0;
var tm=0;
var playing=true;

var ox=55;
var oy=250;
var W=290;
var H=200;

var sx;
var sy;
var An;
var bn;
var A;
var frameEl;

var reduce=window.matchMedia(
    '(prefers-reduced-motion: reduce)'
).matches;


function el(t,at,par){

    var e=document.createElementNS(NS,t);

    for(var k in at){
        e.setAttribute(k,at[k]);
    }

    if(par){
        par.appendChild(e);
    }

    return e;
}


function tex(s,d){

    return katex.renderToString(s,{
        throwOnError:false,
        displayMode:!!d
    });
}


function cl(x){

    return Math.max(
        0,
        Math.min(1,x)
    );
}


function ease(t){

    return t<.5
        ? 2*t*t
        : 1-Math.pow(-2*t+2,2)/2;
}


function bb(j){

    return j
        ? b[j-1]
        : 0;
}


function X(v){

    return ox+v*sx;
}


function Y(v){

    return oy-v*sy;
}


function lab(par,t,cls,w){

    w=w||70;

    var fo=el(
        'foreignObject',
        {
            width:w,
            height:24
        },
        par
    );

    fo.style.overflow='visible';

    var d=document.createElement('div');

    d.className='fl '+cls;
    d.innerHTML=tex(t);

    fo.appendChild(d);

    fo.put=function(cx,cy){

        fo.setAttribute(
            'x',
            cx-w/2
        );

        fo.setAttribute(
            'y',
            cy-12
        );
    };

    return fo;
}


function build(){

    var n=a.length;
    var i,j,k;

    A=[0];

    a.forEach(function(v){

        A.push(
            A[A.length-1]+v
        );

    });

    An=A[n];
    bn=b[n-1];

    sx=W/An;
    sy=H/bn;

    var svg=$('sp-svg');

    svg.innerHTML=
        '<defs>' +
        '<pattern id="sp-h" width="8" height="8" ' +
        'patternUnits="userSpaceOnUse" ' +
        'patternTransform="rotate(45)">' +

        '<rect width="8" height="8" ' +
        'style="fill:var(--sp-hatch);opacity:.10"/>' +

        '<line x1="0" y1="0" x2="0" y2="8" ' +
        'stroke="var(--sp-hatch)" ' +
        'stroke-width="2.4" ' +
        'opacity=".55"/>' +

        '</pattern>' +
        '</defs>';


    for(i=0;i<=An;i++){

        el(
            'line',
            {
                x1:X(i),
                x2:X(i),
                y1:oy,
                y2:Y(bn)-4,
                class:'gr'
            },
            svg
        );
    }


    for(i=0;i<=Math.floor(bn);i++){

        el(
            'line',
            {
                x1:ox,
                x2:X(An),
                y1:Y(i),
                y2:Y(i),
                class:'gr'
            },
            svg
        );
    }


    el(
        'line',
        {
            x1:ox,
            y1:oy,
            x2:X(An)+6,
            y2:oy,
            class:'ax'
        },
        svg
    );


    el(
        'line',
        {
            x1:ox,
            y1:oy,
            x2:ox,
            y2:Y(bn)-12,
            class:'ax'
        },
        svg
    );


    G.strip=el('g',{},svg);
    G.pc=el('g',{},svg);
    G.cut=el('g',{},svg);
    G.lab=el('g',{},svg);


    frameEl=el(
        'rect',
        {
            x:X(0),
            y:Y(bn),
            width:An*sx,
            height:bn*sy,
            class:'frame'
        },
        svg
    );


    pcs=[];
    strips=[];
    cols=[];
    widths=[];
    rows=[];
    cutL=[];


    for(k=1;k<=n;k++){

        for(j=1;j<=k;j++){

            pcs.push({
                k:k,
                j:j,
                x:X(A[k-1]),
                w:a[k-1]*sx,
                y:Y(bb(j)),
                h:(bb(j)-bb(j-1))*sy,
                e:el(
                    'rect',
                    {},
                    G.pc
                )
            });

        }
    }


    for(j=2;j<=n;j++){

        var w=A[j-1]*sx;
        var h=(bb(j)-bb(j-1))*sy;

        var s={
            j:j,
            w:w,
            h:h,
            y:Y(bb(j)),
            ok:w>50 && h>14,

            e:el(
                'rect',
                {
                    fill:'url(#sp-h)',
                    stroke:'var(--sp-hatch)',
                    'stroke-width':1
                },
                G.strip
            )
        };


        s.t=lab(
            G.lab,
            'A_{'+(j-1)+'}\\,\\Delta b_{'+j+'}',
            'dl',
            72
        );


        s.t.put(
            ox+w/2,
            s.y+h/2
        );


        strips.push(s);
    }


    for(k=1;k<=n;k++){

        var cw=a[k-1]*sx;

        var c=lab(
            G.lab,
            'a_'+k+'b_'+k,
            'pl',
            54
        );


        c.put(
            X(A[k-1])+cw/2,
            oy-14
        );


        cols.push({
            e:c,
            ok:cw>30
        });


        var wl=lab(
            G.lab,
            'a_'+k,
            'mu',
            44
        );


        wl.put(
            X(A[k-1])+cw/2,
            oy+30
        );


        widths.push(wl);
    }


    for(j=1;j<=n;j++){

        var hh=(bb(j)-bb(j-1))*sy;

        var r=lab(
            G.lab,
            '\\Delta b_{'+j+'}\\,(A_n-A_{'+(j-1)+'})',
            'pl',
            112
        );


        r.put(
            (X(A[j-1])+X(An))/2,
            Y((bb(j)+bb(j-1))/2)
        );


        rows.push({
            e:r,
            ok:
                hh>14 &&
                (An-A[j-1])*sx>92
        });
    }


    for(j=1;j<n;j++){

        cutL.push({
            e:el(
                'line',
                {
                    y1:Y(b[j-1]),
                    y2:Y(b[j-1]),
                    class:'cut'
                },
                G.cut
            ),

            x0:X(A[j]),
            x1:X(An)
        });
    }


    for(i=1;i<=n;i++){

        el(
            'line',
            {
                x1:X(A[i]),
                x2:X(A[i]),
                y1:oy,
                y2:oy+5,
                class:'tk'
            },
            svg
        );


        lab(
            svg,
            'A_'+i,
            'mu',
            36
        ).put(
            X(A[i]),
            oy+14
        );


        el(
            'line',
            {
                x1:ox-5,
                x2:ox,
                y1:Y(b[i-1]),
                y2:Y(b[i-1]),
                class:'tk'
            },
            svg
        );


        lab(
            svg,
            'b_'+i,
            'mu',
            30
        ).put(
            ox-18,
            Y(b[i-1])
        );
    }
}


function render(){

    var gap=ease(
        cl((p-.3)/.25)
    );

    var ins=
        2*gap*
        (
            1-
            ease(
                cl((p-1.7)/.3)
            )
        );


    pcs.forEach(function(s){

        var gr=ease(
            cl(
                (q*1.6-(s.k-1)*.3)/.7
            )
        );


        var ce=ease(
            cl(
                (p-.5-(s.j-1)*.1)/.2
            )
        );


        var y=
            oy-
            (oy-s.y)*gr;

        var h=s.h*gr;

        var st=s.e.style;
        var e=s.e;


        e.setAttribute(
            'x',
            s.x+ins
        );


        e.setAttribute(
            'width',
            Math.max(
                0,
                s.w-2*ins
            )
        );


        e.setAttribute(
            'y',
            y+ins
        );


        e.setAttribute(
            'height',
            Math.max(
                0,
                h-2*ins
            )
        );


        st.fill=
            ce<=0
            ? 'var('+PAL[s.k-1]+')'
            : 'color-mix(in srgb,var('+
              PAL[s.j-1]+
              ') '+
              Math.round(ce*100)+
              '%,var('+
              PAL[s.k-1]+
              '))';


        st.stroke=
            ins<.2
            ? st.fill
            : 'none';

        st.strokeWidth='.8px';
    });


    cutL.forEach(function(c,i){

        var u=ease(
            cl(p/.22-i*.3)
        );


        c.e.setAttribute(
            'x1',
            c.x0
        );


        c.e.setAttribute(
            'x2',
            c.x0+
            (c.x1-c.x0)*u
        );


        c.e.style.opacity=
            (1-cl((p-.55)/.3))*
            cl(q*2-.8);
    });


    cols.forEach(function(c){

        c.e.style.opacity=
            c.ok
            ? cl(1-p*4)*
              cl((q-.85)*8)
            : 0;
    });


    widths.forEach(function(w){

        w.style.opacity=
            cl(1-p*4)*
            cl((q-.85)*8);
    });


    rows.forEach(function(r){

        r.e.style.opacity=
            r.ok
            ? cl((p-.88)/.12)*
              (1-cl((p-1.1)/.15))
            : 0;
    });


    strips.forEach(function(s){

        var u=ease(
            cl(
                (p-1.15-(s.j-2)*.15)/.4
            )
        );


        s.e.setAttribute(
            'x',
            ox
        );


        s.e.setAttribute(
            'y',
            s.y
        );


        s.e.setAttribute(
            'width',
            s.w*u
        );


        s.e.setAttribute(
            'height',
            s.h
        );


        s.e.style.opacity=
            u>0
            ? 1
            : 0;


        s.t.style.opacity=
            s.ok
            ? cl((u-.8)*5)
            : 0;
    });


    frameEl.style.opacity=
        ease(
            cl((p-1.05)/.2)
        );


    $('sp-scrub').value=p;


    var s=
        p<.5
        ? 0
        : p<1.5
        ? 1
        : 2;


    if(s!==stage){

        stage=s;

        document.querySelectorAll(
            '.sp-anim button[data-s]'
        ).forEach(function(bt){

            bt.setAttribute(
                'aria-current',
                String(
                    +bt.getAttribute('data-s')===s
                )
            );
        });
    }
}


function tween(get,set,to,dur,done){

    cancelAnimationFrame(raf);

    var from=get();
    var t0=performance.now();

    dur=reduce
        ? 0
        : dur;


    (function step(now){

        var k=
            dur
            ? cl((now-t0)/dur)
            : 1;


        set(
            from+
            (to-from)*k
        );


        render();


        if(k<1){

            raf=
                requestAnimationFrame(
                    step
                );

        }else if(done){

            done();
        }

    })(t0);
}


function cycle(){

    if(!playing){
        return;
    }


    var t=
        p<.999
        ? 1
        : p<1.999
        ? 2
        : 0;


    var d=
        t===1
        ? 5200
        : t===2
        ? 4200
        : 1500;


    tween(
        function(){
            return p;
        },

        function(v){
            p=v;
        },

        t,

        d*Math.abs(t-p),

        function(){

            tm=setTimeout(
                cycle,
                t===0
                    ? 800
                    : 2600
            );
        }
    );
}


function setPlay(on){

    playing=on;

    clearTimeout(tm);
    cancelAnimationFrame(raf);


    $('sp-play').textContent=
        on
        ? 'Pause'
        : 'Play';


    if(on){

        tm=setTimeout(
            cycle,
            150
        );
    }
}


function gotoStep(s){

    setPlay(false);

    q=1;


    tween(
        function(){
            return p;
        },

        function(v){
            p=v;
        },

        s,

        Math.max(
            700,
            Math.abs(s-p)*2600
        )
    );
}


function intro(){

    p=0;
    q=0;
    stage=0;

    render();


    tween(
        function(){
            return 0;
        },

        function(v){
            q=v;
        },

        1,

        2000,

        function(){

            if(playing){

                tm=setTimeout(
                    cycle,
                    1600
                );
            }
        }
    );
}


$('sp-play').onclick=function(){

    setPlay(!playing);
};


$('sp-scrub').oninput=function(){

    setPlay(false);

    q=1;
    p=+this.value;

    render();
};


document.querySelectorAll(
    '.sp-anim button[data-s]'
).forEach(function(bt){

    bt.onclick=function(){

        gotoStep(
            +bt.getAttribute('data-s')
        );
    };
});


$('sp-rnd').onclick=function(){

    var n=4;

    var na=[];
    var nb=[];

    var c=
        .5+
        Math.floor(
            Math.random()*3
        )*.5;


    for(var i=0;i<n;i++){

        na.push(
            1+
            Math.floor(
                Math.random()*3
            )
        );


        nb.push(c);


        c+=
            .5+
            Math.floor(
                Math.random()*3
            )*.5;
    }


    a=na;
    b=nb;


    clearTimeout(tm);

    playing=true;


    $('sp-play').textContent=
        'Pause';


    build();


    p=0;
    q=0;
    stage=0;


    intro();
};


build();


if(reduce){

    playing=false;
    q=1;

    $('sp-play').textContent=
        'Play';

    render();

}else{

    intro();
}

})();
</script>

@end(animation)