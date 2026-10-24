@documenttitle{Physics}
@doctype(notes)
@author{Vivek Kalita}
@date{17 October 2026}
@title{Waves and Energy considerations in \(1\)D systems}
@description{Here we consider the basic energy transfer phenomenon in simple \(1\)D strings}
@tags{Classical Mechanics, Wave Mechanics, Energy Conservation, Fourier Analysis}

@section{Introduction, label = section-label}
Let's start with a very basic question. 

Consider a string, vibrating transversely. So any small element on the string would be executing a vertical oscillatory motion; is the net energy of the particle conserved?

Anyone's first view of this would be that the energy should be conserved; since it is executing simple harmonic motion. But as it turns out, it is not the case.

@section{Energy transfer, label = section-label}

Let's consider a discrete model of the string. 

@begin(animation, label = discrete-string-force)

<style>

.df-anim { width: 100%; color: var(--fg); box-sizing: border-box; padding: 4px 8px 16px; }
.df-anim figure { margin: 0; padding: 8px 4px 8px; }
.df-anim svg { display: block; width: 100%; max-width: 680px; height: auto; margin: 0 auto; }

.df-anim { --sg-c1: #2f6db5; --sg-c3: #c9821f; --df-q: #d63a2c; }
:root[data-theme="dark"] .df-anim { --sg-c1: #4f86d1; --sg-c3: #d9962f; --df-q: #ff5a4d; }

.df-anim .pan { fill: color-mix(in srgb, var(--muted) 7%, var(--card)); stroke: var(--rule); stroke-width: 1; }
.df-anim .base { stroke: var(--muted); stroke-width: 1; stroke-dasharray: 3 4; opacity: .55; fill: none; }
.df-anim .str { stroke: var(--fg); stroke-width: 1.7; fill: none; stroke-linejoin: round; }
.df-anim .bead { fill: color-mix(in srgb, var(--muted) 55%, var(--card)); stroke: var(--fg); stroke-width: 1.2; }
.df-anim .bead.me { fill: var(--fg); stroke: var(--card); stroke-width: 1.6; }
.df-anim .tick { stroke: var(--muted); stroke-width: 1; opacity: .6; }
.df-anim .tri { stroke-width: 1.4; stroke-dasharray: 3 3; fill: none; }
.df-anim .triv { stroke-width: 2; fill: none; stroke-linecap: round; }
.df-anim .tens { stroke-width: 1.8; stroke-linecap: round; fill: none; }
.df-anim .fa { stroke-width: 3; stroke-linecap: round; fill: none; }
.df-anim .fa.net { stroke-width: 4; }
.df-anim .r { stroke: var(--sg-c3); fill: var(--sg-c3); }
.df-anim .l { stroke: var(--sg-c1); fill: var(--sg-c1); }
.df-anim .n { stroke: var(--df-q); fill: var(--df-q); }
.df-anim polygon { stroke: none; }
.df-anim .tx { font-family: var(--sans); font-size: 10px; fill: var(--muted); }

.df-anim .fl {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    font-size: 12.5px; line-height: 1; white-space: nowrap;
    font-family: var(--serif); color: var(--fg);
}
.df-anim .fl.bg { background: color-mix(in srgb, var(--muted) 7%, var(--card)); border-radius: 4px; width: auto; height: auto; padding: 2px 3px; }
.df-anim .fl .katex { font-size: 1em; }
.df-anim .fm { display: flex; align-items: center; justify-content: center; gap: 14px; width: 100%; height: 100%; font-family: var(--serif); font-size: 17px; white-space: nowrap; }
.df-anim .fm span { transition: opacity .35s, color .35s; }
.df-anim .fm .katex { font-size: 1em; }
.df-anim .fm .tr { color: var(--sg-c3); }
.df-anim .fm .tl { color: var(--sg-c1); }
.df-anim .fm .tn.on { color: var(--df-q); }

.df-anim .controls { display: flex; align-items: center; gap: 8px; flex-wrap: wrap; width: 100%; max-width: 680px; margin: 10px auto 0; }
.df-anim button {
    font-family: var(--sans); font-size: .85rem; color: var(--fg);
    background: var(--card); border: 1px solid var(--rule);
    border-radius: 8px; padding: 6px 11px; cursor: pointer; white-space: nowrap;
}
.df-anim button:hover { border-color: var(--fg); }
.df-anim button:focus-visible { outline: 2px solid var(--link); outline-offset: 2px; }
.df-anim button.play { min-width: 68px; }
.df-anim button[aria-current="true"] { background: var(--link); border-color: var(--link); color: var(--bg); }

@media (max-width: 520px) {
    .df-anim figure { padding-left: 0; padding-right: 0; }
    .df-anim .controls { gap: 6px; }
    .df-anim button { font-size: .8rem; padding: 5px 9px; }
}

</style>

<div class="df-anim">

<figure>
<svg id="df-svg" viewBox="0 0 400 300" role="img" aria-label="Beads on a string: the vertical force on bead n is the sum of the pulls from its two neighbouring segments"></svg>
</figure>

<div class="controls">
<button id="df-play" class="play">Pause</button>
<button data-s="1">Right segment</button>
<button data-s="2">Left segment</button>
<button data-s="3">Net force</button>
<button data-s="0">Auto</button>
</div>

</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css">
<script src="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.js"></script>

<script>
(function(){

if(!document.querySelector('link[href*="katex"]')){
    var lk=document.createElement('link');
    lk.rel='stylesheet';
    lk.href='https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css';
    document.head.appendChild(lk);
}

var NS='http://www.w3.org/2000/svg';
var $=function(i){return document.getElementById(i)};

var A=70, CXN=200, AY=100, FS=2.5, TL=44;       /* bead spacing, centre x, baseline, force scale, tension arrow length */
var KS=[-1,0,1,2,3,4,5,6,7], NI=3;               /* bead k is drawn at x = CXN + (k-3) A ; bead 3 is "n" */

var t=0, playing=true, stage=1, auto=true, stT=0, raf=0, last=0;
var svg, g, str, beads=[], P={};
var reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;

function yk(k,tt){ return 30*Math.sin(.9*k-1.15*tt)+9*Math.sin(1.6*k+.8*tt+1); }   /* upward displacement, px */
function xk(k){ return CXN+(k-NI)*A; }

function el(tg,at,par){
    var e=document.createElementNS(NS,tg);
    for(var k in at){ e.setAttribute(k,at[k]); }
    if(par){ par.appendChild(e); }
    return e;
}
function tex(s){ return katex.renderToString(s,{throwOnError:false,output:'html'}); }
function lab(par,s,w,bg){
    var fo=el('foreignObject',{width:w,height:24},par);
    fo.style.overflow='visible';
    var d=document.createElement('div');
    d.className='fl'+(bg ? ' bg' : '');
    d.innerHTML=tex(s);
    fo.appendChild(d);
    fo.put=function(cx,cy){ fo.setAttribute('x',cx-w/2); fo.setAttribute('y',cy-12); return fo; };
    fo.show=function(on){ fo.style.display=on ? '' : 'none'; };
    return fo;
}
function txt(par,x,y,s){ var e=el('text',{x:x,y:y,'text-anchor':'middle',class:'tx'},par); e.textContent=s; return e; }
function head(p,x,y,dir,sz){      /* arrow head at (x,y) pointing in direction dir (unit vector) */
    var ux=dir[0], uy=dir[1];
    p.setAttribute('points',[x,y, x-ux*sz-uy*sz*.5,y-uy*sz+ux*sz*.5, x-ux*sz+uy*sz*.5,y-uy*sz-ux*sz*.5].join(' '));
}

function build(){
    svg=$('df-svg');
    svg.innerHTML='<defs><clipPath id="df-c"><rect x="1" y="6" width="398" height="186"/></clipPath></defs>';
    el('rect',{x:1,y:6,width:398,height:186,class:'pan'},svg);
    g=el('g',{'clip-path':'url(#df-c)'},svg);

    el('line',{x1:1,y1:AY,x2:399,y2:AY,class:'base'},g);
    str=el('polyline',{class:'str'},g);

    /* triangles, tension arrows, force arrows (drawn under the beads) */
    P.triR=el('g',{},g); P.triL=el('g',{},g);
    P.trh={r:el('line',{class:'tri r'},P.triR), l:el('line',{class:'tri l'},P.triL)};
    P.trv={r:el('line',{class:'triv r'},P.triR), l:el('line',{class:'triv l'},P.triL)};
    P.tn={r:el('line',{class:'tens r'},P.triR), l:el('line',{class:'tens l'},P.triL)};
    P.tnh={r:el('polygon',{class:'r'},P.triR), l:el('polygon',{class:'l'},P.triL)};
    P.fa={r:el('line',{class:'fa r'},g), l:el('line',{class:'fa l'},g), n:el('line',{class:'fa net n'},g)};
    P.fh={r:el('polygon',{class:'r'},g), l:el('polygon',{class:'l'},g), n:el('polygon',{class:'n'},g)};

    KS.forEach(function(k){
        beads[k]=el('circle',{r:k===NI ? 7.5 : 5.5,class:'bead'+(k===NI ? ' me' : '')},g);
    });

    /* labels */
    P.lT={r:lab(g,'T',14), l:lab(g,'T',14)};
    P.lA={r:lab(g,'a',14), l:lab(g,'a',14)};
    P.lD={r:lab(g,'y_{n+1}-y_n',80), l:lab(g,'y_{n-1}-y_n',80)};
    P.lF={r:lab(g,'x',1), l:lab(g,'x',1), n:lab(g,'F_n',24)};

    [[NI-1,'n-1'],[NI,'n'],[NI+1,'n+1']].forEach(function(p){
        el('line',{x1:xk(p[0]),y1:172,x2:xk(p[0]),y2:177,class:'tick'},svg);
        lab(svg,p[1],40).put(xk(p[0]),184);
    });
    var ax=el('g',{},svg);
    el('line',{x1:16,y1:AY,x2:16,y2:AY-40,stroke:'var(--muted)','stroke-width':1.2},ax);
    el('polygon',{points:'16,'+(AY-45)+' 12.5,'+(AY-38)+' 19.5,'+(AY-38)+'',style:'fill:var(--muted)'},ax);
    lab(ax,'y',14).put(27,AY-38);

    /* formula */
    var fo=el('foreignObject',{x:1,y:200,width:398,height:88},svg);
    var d=document.createElement('div'); d.className='fm';
    d.innerHTML='<span class="tn">'+tex('F_n=')+'</span><span class="tr">'+tex('\\dfrac{T}{a}\\,(y_{n+1}-y_n)')+'</span><span class="tl">'+tex('-\\,\\dfrac{T}{a}\\,(y_n-y_{n-1})')+'</span>';
    fo.appendChild(d);
    P.fm={n:d.children[0],r:d.children[1],l:d.children[2]};
}

function vArrow(line,hd,x,y0,dy){
    line.setAttribute('x1',x); line.setAttribute('x2',x); line.setAttribute('y1',y0); line.setAttribute('y2',y0+dy-(Math.abs(dy)>6 ? Math.sign(dy)*5 : 0));
    var on=Math.abs(dy)>5;
    hd.style.display=on ? '' : 'none';
    line.style.visibility=Math.abs(dy)>1 ? 'visible' : 'hidden';
    if(on){ head(hd,x,y0+dy,[0,Math.sign(dy)],8); }
}

function render(){
    var Y={}, X={}, k;
    KS.forEach(function(kk){ Y[kk]=AY-yk(kk,t); X[kk]=xk(kk); });
    str.setAttribute('points',KS.map(function(kk){ return X[kk]+','+Y[kk]; }).join(' '));
    KS.forEach(function(kk){ beads[kk].setAttribute('cx',X[kk]); beads[kk].setAttribute('cy',Y[kk]); });

    var yn=Y[NI], yr=Y[NI+1], yl=Y[NI-1], xn=X[NI], xr=X[NI+1], xl=X[NI-1];
    var FR=(yr-yn)*FS, FL=(yl-yn)*FS, FN=FR+FL;      /* screen-pixel components; up is negative */
    var showR=stage>=1, showL=stage>=2, showN=stage>=3;

    [['r',xr,yr,1,FR,showR],['l',xl,yl,-1,FL,showL]].forEach(function(s){
        var c=s[0], xs=s[1], ys=s[2], sg=s[3], F=s[4], on=s[5];
        var G=c==='r' ? P.triR : P.triL;
        G.style.display=on ? '' : 'none';
        P.fa[c].style.display=on ? '' : 'none'; P.fh[c].style.display=on ? '' : 'none';
        P.lT[c].show(on); P.lA[c].show(on); P.lD[c].show(on); P.lF[c].show(false);
        if(!on){ return; }
        var dim=showN ? .5 : 1; G.style.opacity=dim; P.fa[c].style.opacity=dim; P.fh[c].style.opacity=dim;
        P.lT[c].style.opacity=dim;
        P.trh[c].setAttribute('x1',xn); P.trh[c].setAttribute('x2',xs); P.trh[c].setAttribute('y1',yn); P.trh[c].setAttribute('y2',yn);
        P.trv[c].setAttribute('x1',xs); P.trv[c].setAttribute('x2',xs); P.trv[c].setAttribute('y1',yn); P.trv[c].setAttribute('y2',ys);
        /* tension arrow along the segment */
        var dx=xs-xn, dy=ys-yn, L=Math.sqrt(dx*dx+dy*dy), ux=dx/L, uy=dy/L;
        P.tn[c].setAttribute('x1',xn+ux*9); P.tn[c].setAttribute('y1',yn+uy*9);
        P.tn[c].setAttribute('x2',xn+ux*(TL-4)); P.tn[c].setAttribute('y2',yn+uy*(TL-4));
        head(P.tnh[c],xn+ux*TL,yn+uy*TL,[ux,uy],8);
        P.lT[c].put(xn+ux*(TL+11),yn+uy*(TL+11));
        /* a below/above the horizontal leg, on the side away from the vertical leg */
        P.lA[c].put((xn+xs)/2,yn+(ys<yn ? 12 : -12));
        var vm=(yn+ys)/2;
        P.lD[c].put(xs+sg*6,ys+(ys<yn ? -17 : 17));
        /* force arrow at bead n */
        var fx=xn+sg*17;
        vArrow(P.fa[c],P.fh[c],fx,yn,F);
    });

    P.fa.n.style.display=showN ? '' : 'none'; P.fh.n.style.display=showN ? '' : 'none'; P.lF.n.show(showN);
    if(showN){
        vArrow(P.fa.n,P.fh.n,xn,yn,FN);
        P.lF.n.put(xn,yn+FN+(FN>0 ? 16 : -16));
    }

    P.fm.r.style.opacity=showR ? 1 : .2;
    P.fm.l.style.opacity=showL ? 1 : .2;
    P.fm.n.style.opacity=showN ? 1 : .35;
    P.fm.n.className='tn'+(showN ? ' on' : '');
}

function setStage(s){
    auto=(s===0);
    if(auto){ stage=1; stT=0; } else { stage=s; }
    document.querySelectorAll('.df-anim button[data-s]').forEach(function(b){
        b.setAttribute('aria-current',String(+b.getAttribute('data-s')===s));
    });
    render();
}

function frame(now){
    raf=requestAnimationFrame(frame);
    var dt=Math.min(.05,(now-last)/1000); last=now;
    if(!playing){ return; }
    t+=dt;
    if(auto){
        stT+=dt;
        if(stT>3.8){ stT=0; stage=stage>=3 ? 1 : stage+1; }
    }
    render();
}

function setPlay(on){ playing=on; $('df-play').textContent=on ? 'Pause' : 'Play'; }

$('df-play').onclick=function(){ setPlay(!playing); };
document.querySelectorAll('.df-anim button[data-s]').forEach(function(b){
    b.onclick=function(){ setStage(+b.getAttribute('data-s')); };
});

build();
setStage(0);
if(reduce){ setPlay(false); stage=3; auto=false; render(); }
else{ last=performance.now(); raf=requestAnimationFrame(frame); }

})();
</script>

@end(animation)

The force on the \(n\)-th segment is given by the equation:
\[
F_n
= \frac{T}{a}(y_{n+1}-y_n)
- \frac{T}{a}(y_n-y_{n-1}).
\]
where \(a\) is the seperation between the masses.

Define:
\[
q_n = y_{n+1}-y_n,
\qquad
q_{n-1} = y_n-y_{n-1}.
\]
Then for the kinetic energy of the \(n\)-th mass, which is given as:
\[
K_n = \frac{1}{2}m\dot{y}_n^{\,2}.
\]
we would have:
\[
\frac{dK_n}{dt}
= m\dot{y}_n\ddot{y}_n
= \frac{T}{a}\dot{y}_n(q_n-q_{n-1}).
\]
Likewise for the potential we would have:
\[
U_n = \frac{T}{4a}\left(q_{n-1}^2+q_n^2\right) \qquad \text{and} \qquad 
\frac{dU_n}{dt}
= \frac{T}{2a}
\left(q_{n-1}\dot{q}_{n-1}+q_n\dot{q}_n\right).
\]
So that for the net energy we would have:
\[
\frac{dE_n}{dt}= \frac{dK_n}{dt}+\frac{dU_n}{dt}\\[6pt]= \frac{T}{2a}\left[
q_n(\dot{y}_{n+1}+\dot{y}_n)
-q_{n-1}(\dot{y}_n+\dot{y}_{n-1})
\right]
\]

In general this term is not zero:
\[
\frac{dE_n}{dt}\neq 0.
\]

@subsection{Continuum limit and the energy flux, label = subsection-label}
In general we can define:
\[
P_{n+\frac12}
= -\frac{T}{2a}q_n(\dot{y}_{n+1}+\dot{y}_n) \qquad \text{and} \qquad 
P_{n-\frac12}
= -\frac{T}{2a}q_{n-1}(\dot{y}_n+\dot{y}_{n-1})
\]
so that we have an energy transfer equation given as:
\[
\frac{dE_n}{dt}
= P_{n-\frac12}-P_{n+\frac12}.
\]
Note that, although the energy is not conserved for each element. It however is conserved for the total string:
\[
\sum_n \frac{dE_n}{dt}=0.
\]
Taking the continuum limit:
\[
x=na,\qquad y_n\to y,\qquad a\to 0.
\]
we have:
\[
y_{n+1}-y_n\sim a\frac{\partial y}{\partial x}, \qquad \dot{y}_{n+1}+\dot{y}_n
\sim 2\frac{\partial y}{\partial t}.
\]
so that:
\[
P_{n+\frac12}
\sim -\frac{T}{2a}
\left(a\frac{\partial y}{\partial x}\right)
\left(2\frac{\partial y}{\partial t}\right).
\]
so that:
\[
P(x,t)=-T\frac{\partial y}{\partial x}\frac{\partial y}{\partial t}.
\]
and our continuity equation becomes:
\[
\frac{\partial u}{\partial t}
+\frac{\partial P}{\partial x}=0.
\]

@subsection{Power transfer in simple sinusoidal wave, label = subsection-label}
For a right moving sinusoidal wave we have:
\[
y(x,t)=A\cos(kx-\omega t),
\qquad
\omega=vk.
\]
The instantaneous power therefore is,
\[
P(x,t)=TA^2k\omega\sin^2(kx-\omega t).
\]
and the time averaged power is:
\[
\langle P\rangle=\frac{1}{2}TA^2k\omega=\frac{1}{2}\mu v\omega^2A^2.
\]

@subsection{Superposition and the Fourier Spectrum, label = subsection-label}
Consider a superposition of two wavestwo waves:
\[
y=A_1\cos\theta_1+A_2\cos\theta_2 \qquad \text{where} \qquad
\theta_j=k_jx-\omega_jt.
\]
It is easy to verify that the average power is the simple sum of the individual average powers:
\[
\langle P\rangle
=\frac{1}{2}TA_1^2k_1\omega_1
+\frac{1}{2}TA_2^2k_2\omega_2.
\]
So that, in general for discrete fourier modes:
\[
y=\sum_j A_j\cos\theta_j \qquad \text{we have} \qquad \langle P\rangle
=\frac{1}{2}\sum_j TA_j^2k_j\omega_j.
\]

@subsection{A complete (continous) fourier spectrum, label = subsection-label}
For a right moving wave, the complete Fourier spectrum is given by:
\[
y(x,t)=\frac{1}{\sqrt{2\pi}}
\int_{-\infty}^{+\infty}
A(k)e^{ik(x-vt)}\,dk.
\]
Since, we also have:
\[
y_t=-vy_x.
\]
The instantaneous power is therefore:
\[
P(x,t)=Tv\left[y_x(x,t)\right]^2
=\frac{Tv}{2\pi}
\left|
\int_{-\infty}^{+\infty}
ikA(k)e^{ik(x-vt)}\,dk
\right|^2.
\]
Parseval's theorem thus gives the tota Energy:
\[
E=T\int_{-\infty}^{+\infty}k^2|A(k)|^2\,dk.
\]

@section{Energy Transfer between strings, label = section-label}
Consider two strings joined at \(x = 0\).

Let the left string have density \(\mu_L\) and the right one have density \(\mu_R\). The strings would have the same tension (to balance the horizontal force at \(x = 0\)). 

The boundary conditions are:
\[
y_L(0,t)=y_R(0,t) \qquad \text{and} \qquad 
\frac{\partial y_L(0,t)}{\partial x}
=
\frac{\partial y_R(0,t)}{\partial x}
\]

Take the \(y_L\) to be the sum of the incident and the reflected wave. So that, 
\[
y_L=A_I\cos(k_Lx-\omega t)
+A_R\cos(k_Lx+\omega t),
\qquad x<0.
\]
and \(y_R\) is the transmitted wave:
\[
y_R=A_T\cos(k_Rx-\omega t),
\qquad x>0.
\]

From these we obtain:
\[
A_I+A_R=A_T \qquad \text{and} \qquad
k_L(A_I-A_R)=k_RA_T
\]
we get the reflection and the transmission coefficients to be:
\[
r=\frac{A_R}{A_I}=\frac{\sqrt{\mu_L}-\sqrt{\mu_R}}
{\sqrt{\mu_L}+\sqrt{\mu_R}},
\qquad
t=\frac{A_T}{A_I} =\frac{2\sqrt{\mu_L}}
{\sqrt{\mu_L}+\sqrt{\mu_R}}.
\]

@subsection{Transfer of energy, label = subsection-label}





