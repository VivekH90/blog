@documenttitle{Physics}

@doctype(notes)

@author{Vivek Kalita}

@date{10 October 2026}

@title{The Stern–Gerlach Experiment}

@description{An informal introduction to quantum mechanics through the Stern–Gerlach experiment.}

@tags{Quantum Mechanics, Fundamental Experiments}

@section{Introduction, label = section-label}

Let's begin with a simple thought experiment.

Imagine we have an inhomogeneous magnetic field. We send a beam of silver atoms through it and observe where they land on a detector.

What do you expect to see?

Each atom has a magnetic moment. If we treat the atoms as tiny classical magnets, their deflections should depend on the orientations of their magnetic moments relative to the field gradient. Some atoms would be deflected upward, some downward, and others by intermediate amounts. We should therefore expect a continuous distribution of deflections.

But this is @bold{not what happens}. The beam splits into two distinct components.

@begin(animation, label = stern-gerlach)
<style>
.sg-anim { width: 100%; color: var(--fg); box-sizing: border-box; padding: 4px 8px 16px; }
.sg-anim figure { margin: 0; padding: 8px 4px 8px; overflow: hidden; }
.sg-anim svg { display: block; width: 100%; max-width: 640px; height: auto; margin: 0 auto; }
.sg-anim {
    --sg-c1: #2f6db5;
    --sg-c3: #c9821f;
}
:root[data-theme="dark"] .sg-anim {
    --sg-c1: #4f86d1;
    --sg-c3: #d9962f;
}
.sg-anim .ln  { stroke: var(--fg); stroke-width: 1.6; fill: none; }
.sg-anim .thin { stroke: var(--muted); stroke-width: 1; fill: none; }
.sg-anim .guide { stroke: var(--muted); stroke-width: 1; stroke-dasharray: 3 4; opacity: .45; fill: none; }
.sg-anim .pole { fill: color-mix(in srgb, var(--muted) 38%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg-anim .body { fill: color-mix(in srgb, var(--muted) 22%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg-anim .plate { fill: var(--fg); }
.sg-anim .scr { fill: color-mix(in srgb, var(--muted) 30%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg-anim .fieldln { stroke: var(--muted); stroke-width: 1.1; stroke-dasharray: 3 3; fill: none; opacity: .8; }
.sg-anim .tx { font-family: var(--sans); font-size: 10.5px; fill: var(--muted); }
.sg-anim .fl {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    font-size: 13px; line-height: 1; white-space: nowrap;
    font-family: var(--serif);
    color: var(--fg);
}
.sg-anim .fl .katex { font-size: 1em; }
.sg-anim .controls {
    display: flex; align-items: center; gap: 8px; flex-wrap: wrap;
    width: 100%; max-width: 600px; margin: 10px auto 0;
}
.sg-anim button {
    font-family: var(--sans); font-size: .85rem; color: var(--fg);
    background: var(--card); border: 1px solid var(--rule);
    border-radius: 8px; padding: 6px 11px; cursor: pointer; white-space: nowrap;
}
.sg-anim button:hover { border-color: var(--fg); }
.sg-anim button:focus-visible,
.sg-anim input:focus-visible { outline: 2px solid var(--link); outline-offset: 2px; }
.sg-anim button.play { min-width: 68px; }
.sg-anim button[aria-current="true"] { background: var(--link); border-color: var(--link); color: var(--bg); }
.sg-anim label.spd { font-family: var(--sans); font-size: .85rem; color: var(--muted); display: flex; align-items: center; gap: 6px; flex: 1; min-width: 150px; }
.sg-anim input[type="range"] { flex: 1; min-width: 70px; accent-color: var(--link); }
@media (max-width: 520px) {
    .sg-anim figure { padding-left: 0; padding-right: 0; }
    .sg-anim .controls { gap: 6px; }
    .sg-anim button { font-size: .8rem; padding: 5px 9px; }
}
</style>
<div class="sg-anim">
<figure>
<svg id="sg-svg" viewBox="0 36 400 250" role="img" aria-label="Stern-Gerlach experiment animation"></svg>
</figure>
<div class="controls">
<button id="sg-play" class="play">Pause</button>
<button data-m="c">Classical</button>
<button data-m="q">Quantum</button>
<button id="sg-burst">Burst</button>
<button id="sg-reset">Reset</button>
<label class="spd">Speed <input id="sg-speed" type="range" min="0.5" max="4" step="0.1" value="1.5" aria-label="Speed"></label>
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
var BY=148, OVX=48, MX0=120, MX1=220, SCX=316;
var DMAX=16, Y0=76, Y1=220, NB=48, BH=(Y1-Y0)/NB, HW=46;
var mode='c', playing=true, speed=1.5, raf=0, last=0, acc=0;
var atoms=[], deposits=[], counts=[], bars=[];
var svg, LA, LD, LH, labTop, labBot;
var reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
function el(t,at,par){
    var e=document.createElementNS(NS,t);
    for(var k in at){ e.setAttribute(k,at[k]); }
    if(par){ par.appendChild(e); }
    return e;
}
function tex(s){ return katex.renderToString(s,{throwOnError:false,output:'html'}); }
function cl(x){ return Math.max(0,Math.min(1,x)); }
function gs(){ return (Math.random()+Math.random()+Math.random()-1.5)/1.5; }
function lab(par,t,w){
    var fo=el('foreignObject',{width:w,height:24},par);
    fo.style.overflow='visible';
    var d=document.createElement('div');
    d.className='fl';
    d.innerHTML=tex(t);
    fo.appendChild(d);
    fo.put=function(cx,cy){
        fo.setAttribute('x',cx-w/2);
        fo.setAttribute('y',cy-12);
        return fo;
    };
    fo.set=function(s){ d.innerHTML=tex(s); };
    return fo;
}
function txt(par,x,y,s){
    var e=el('text',{x:x,y:y,'text-anchor':'middle',class:'tx'},par);
    e.textContent=s;
    return e;
}
function build(){
    svg=$('sg-svg');
    svg.innerHTML='';
    var i;
    /* undeflected axis */
    el('line',{x1:42,y1:BY,x2:SCX,y2:BY,class:'guide'},svg);
    /* oven and slits */
    el('rect',{x:8,y:126,width:30,height:44,rx:4,class:'body'},svg);
    el('rect',{x:36,y:144,width:4,height:8,style:'fill:var(--card)'},svg);
    el('rect',{x:58,y:112,width:5,height:32,class:'plate'},svg);
    el('rect',{x:58,y:152,width:5,height:32,class:'plate'},svg);
    txt(svg,23,188,'oven');
    txt(svg,60,200,'slits');
    /* magnet: upper pole with a wedge edge, lower pole flat */
    el('polygon',{points:'105,56 235,56 235,96 195,124 145,124 105,96',class:'pole'},svg);
    el('polygon',{points:'105,240 235,240 235,200 195,172 145,172 105,200',class:'pole'},svg);
    [152,161,170,179,188].forEach(function(xi){
        el('line',{x1:xi,y1:171,x2:xi,y2:125,class:'fieldln'},svg);
    });
    lab(svg,'N',24).put(170,88);
    lab(svg,'S',24).put(170,208);
    txt(svg,170,262,'magnet');
    /* z axis */
    el('line',{x1:22,y1:266,x2:22,y2:236,class:'ln'},svg);
    el('polygon',{points:'22,232 18.5,239 25.5,239',style:'fill:var(--fg)'},svg);
    lab(svg,'z',20).put(34,244);
    /* screen */
    el('rect',{x:SCX,y:Y0-6,width:6,height:Y1-Y0+12,class:'scr'},svg);
    txt(svg,SCX+3,262,'screen');
    labTop=lab(svg,'',76).put(SCX+38,57);
    labBot=lab(svg,'',76).put(SCX+38,239);
    LH=el('g',{},svg);
    LD=el('g',{},svg);
    LA=el('g',{},svg);
    bars=[];
    for(i=0;i<NB;i++){
        var yc=Y0+(i+.5)*BH;
        bars.push(el('rect',{
            x:SCX+10,y:Y0+i*BH+.4,width:0,height:BH-.8,
            style:'fill:var('+(yc<BY?'--sg-c3':'--sg-c1')+');opacity:.8'
        },LH));
    }
}
function off(x,D){
    if(x<=MX0){ return 0; }
    if(x<=MX1){ var u=(x-MX0)/(MX1-MX0); return D*u*u; }
    return D*(1+2*(x-MX1)/(MX1-MX0));
}
function colorFor(s,P){
    return 'color-mix(in srgb,var('+(s>=0?'--sg-c3':'--sg-c1')+') '+Math.round(P)+'%,var(--muted))';
}
function newAtom(t0){
    var s=mode==='q' ? (Math.random()<.5 ? 1 : -1) : (Math.random()*2-1);
    var g=el('g',{},LA);
    var ring=el('circle',{r:4.6,fill:'none',stroke:'var(--muted)','stroke-width':1,'stroke-dasharray':'2 2'},g);
    var body=el('circle',{r:3.2},g);
    var nd=el('line',{'stroke-width':1.4,'stroke-linecap':'round',stroke:'var(--fg)'},g);
    var hd=el('circle',{r:1.7,style:'fill:var(--fg)'},g);
    var vx=mode==='q' ? 0 : Math.sqrt(Math.max(0,1-s*s)), vy=-s;
    nd.setAttribute('x1',-vx*5); nd.setAttribute('y1',-vy*5);
    nd.setAttribute('x2', vx*5); nd.setAttribute('y2', vy*5);
    hd.setAttribute('cx', vx*5); hd.setAttribute('cy', vy*5);
    atoms.push({
        s:s, t:t0||0, y0:gs()*2.2, k:1+0.05*gs(),
        g:g, ring:ring, body:body, nd:nd, hd:hd, vx:vx, vy:vy
    });
}
function place(a){
    if(a.t<0){ a.g.style.display='none'; return; }
    a.g.style.display='';
    var x=OVX+a.t, D=a.s*DMAX*a.k;
    var y=BY-off(x,D)+a.y0;
    a.g.setAttribute('transform','translate('+x+','+y+')');
    var m=cl((x-MX0)/20);
    if(mode==='q'){
        a.body.style.fill=colorFor(a.s,100*m);
        a.nd.style.opacity=m; a.hd.style.opacity=m;
        a.ring.style.opacity=1-m;
    }else{
        a.body.style.fill=colorFor(a.s,100*Math.abs(a.s)*m);
        a.nd.style.opacity=1; a.hd.style.opacity=1;
        a.ring.style.opacity=0;
    }
}
function land(a){
    var D=a.s*DMAX*a.k;
    var y=BY-off(SCX,D)+a.y0;
    y=Math.max(Y0+2,Math.min(Y1-2,y));
    var c=el('circle',{cx:SCX+3+gs()*1.2,cy:y,r:1.7},LD);
    c.style.fill=colorFor(a.s,mode==='q' ? 100 : 100*Math.abs(a.s)*.9+10);
    deposits.push(c);
    if(deposits.length>700){ LD.removeChild(deposits.shift()); }
    var i=Math.max(0,Math.min(NB-1,Math.floor((y-Y0)/BH)));
    counts[i]++;
}
function drawHist(){
    var mx=0,i;
    for(i=0;i<NB;i++){ if(counts[i]>mx){ mx=counts[i]; } }
    for(i=0;i<NB;i++){
        bars[i].setAttribute('width',mx ? counts[i]/mx*HW : 0);
    }
}
function clearAll(){
    atoms.forEach(function(a){ if(a.g.parentNode){ LA.removeChild(a.g); } });
    deposits.forEach(function(d){ if(d.parentNode){ LD.removeChild(d); } });
    atoms=[]; deposits=[]; counts=[];
    for(var i=0;i<NB;i++){ counts.push(0); }
    drawHist();
}
function step(dt){
    acc+=dt;
    while(acc>=.1){
        acc-=.1;
        if(atoms.length<90){ newAtom(0); }
    }
    for(var i=atoms.length-1;i>=0;i--){
        var a=atoms[i];
        a.t+=95*dt;
        if(OVX+a.t>=SCX){
            land(a);
            LA.removeChild(a.g);
            atoms.splice(i,1);
        }else{
            place(a);
        }
    }
    drawHist();
}
function frame(now){
    raf=requestAnimationFrame(frame);
    var dt=Math.min(.05,(now-last)/1000);
    last=now;
    if(!playing){ return; }
    step(dt*speed);
}
function setMode(m){
    mode=m;
    clearAll();
    labTop.set(m==='q' ? '\\mu_z=+\\mu_B' : '\\mu_z=+\\mu');
    labBot.set(m==='q' ? '\\mu_z=-\\mu_B' : '\\mu_z=-\\mu');
    document.querySelectorAll('.sg-anim button[data-m]').forEach(function(bt){
        bt.setAttribute('aria-current',String(bt.getAttribute('data-m')===m));
    });
    if(reduce){ instant(300); }
}
function instant(n){
    for(var i=0;i<n;i++){
        newAtom(0);
        var a=atoms.pop();
        land(a);
        LA.removeChild(a.g);
    }
    drawHist();
}
function setPlay(on){
    playing=on;
    $('sg-play').textContent=on ? 'Pause' : 'Play';
}
$('sg-play').onclick=function(){ setPlay(!playing); };
$('sg-reset').onclick=function(){ clearAll(); acc=0; };
$('sg-burst').onclick=function(){
    for(var i=0;i<40;i++){ newAtom(-i*5); }
    if(!playing){ setPlay(true); }
};
$('sg-speed').oninput=function(){ speed=+this.value; };
document.querySelectorAll('.sg-anim button[data-m]').forEach(function(bt){
    bt.onclick=function(){ setMode(bt.getAttribute('data-m')); };
});
build();
setMode('c');
if(reduce){
    setPlay(false);
}else{
    last=performance.now();
    raf=requestAnimationFrame(frame);
}
})();
</script>
@end(animation)

This is the central observation of the Stern–Gerlach experiment, performed by Otto Stern and Walther Gerlach in 1922.

@section{Expectations and Results, label = section-label}

@subsection{Classical Expectations, label = subsection-label}

The potential energy of a magnetic dipole \(\boldsymbol{\mu}\) in a magnetic field \(\mathbf B\) is

\[
U=-\boldsymbol{\mu}\cdot\mathbf B.
\]

The corresponding force is

\[
\mathbf F=-\nabla U=\nabla(\boldsymbol{\mu}\cdot\mathbf B)\approx \mu_z\frac{\partial B_z}{\partial z}\,\hat{\mathbf z}.
\]

Since \(\mu_z = \mu \cos \theta\) and a classical magnetic moment can have any orientation \(\theta\), its vertical component can vary continuously. We should therefore expect a continuous distribution of deflections.

The experiment, however, contradicts this prediction.

@subsection{Continuing the experiment, label = subsection-label}

To investigate this discrepancy further, let us modify the experiment.

We place a second Stern–Gerlach apparatus after the first, blocking the lower output so that only the upper beam enters the second apparatus. We can then rotate the second apparatus relative to the first and examine the resulting distribution.

@begin(animation, label = stern-gerlach-series)
<style>
.sg3-anim { width: 100%; color: var(--fg); box-sizing: border-box; padding: 4px 8px 16px; }
.sg3-anim figure { margin: 0; padding: 8px 4px 8px; overflow: hidden; }
.sg3-anim svg { display: block; width: 100%; max-width: 680px; height: auto; margin: 0 auto; }
.sg3-anim {
    --sg-c1: #2f6db5;
    --sg-c3: #c9821f;
}
:root[data-theme="dark"] .sg3-anim {
    --sg-c1: #4f86d1;
    --sg-c3: #d9962f;
}
.sg3-anim .ln  { stroke: var(--fg); stroke-width: 1.5; fill: none; }
.sg3-anim .guide { stroke: var(--muted); stroke-width: 1; stroke-dasharray: 3 4; opacity: .45; fill: none; }
.sg3-anim .pole { fill: color-mix(in srgb, var(--muted) 38%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg3-anim .body { fill: color-mix(in srgb, var(--muted) 22%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg3-anim .plate { fill: var(--fg); }
.sg3-anim .det { fill: color-mix(in srgb, var(--muted) 30%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg3-anim .trk { fill: none; stroke: var(--muted); stroke-width: 1; opacity: .6; }
.sg3-anim .fieldln { stroke: var(--muted); stroke-width: 1.1; stroke-dasharray: 3 3; fill: none; opacity: .8; }
.sg3-anim .tx { font-family: var(--sans); font-size: 9.5px; fill: var(--muted); }
.sg3-anim .fl {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    font-size: 12px; line-height: 1; white-space: nowrap;
    font-family: var(--serif);
    color: var(--fg);
}
.sg3-anim .fl .katex { font-size: 1em; }
.sg3-anim .controls {
    display: flex; align-items: center; gap: 8px; flex-wrap: wrap;
    width: 100%; max-width: 640px; margin: 10px auto 0;
}
.sg3-anim button {
    font-family: var(--sans); font-size: .85rem; color: var(--fg);
    background: var(--card); border: 1px solid var(--rule);
    border-radius: 8px; padding: 6px 11px; cursor: pointer; white-space: nowrap;
}
.sg3-anim button:hover { border-color: var(--fg); }
.sg3-anim button:focus-visible,
.sg3-anim input:focus-visible { outline: 2px solid var(--link); outline-offset: 2px; }
.sg3-anim button.play { min-width: 68px; }
.sg3-anim button[aria-current="true"] { background: var(--link); border-color: var(--link); color: var(--bg); }
.sg3-anim label.spd { font-family: var(--sans); font-size: .85rem; color: var(--muted); display: flex; align-items: center; gap: 6px; flex: 1; min-width: 150px; }
.sg3-anim input[type="range"] { flex: 1; min-width: 70px; accent-color: var(--link); }
@media (max-width: 520px) {
    .sg3-anim figure { padding-left: 0; padding-right: 0; }
    .sg3-anim .controls { gap: 6px; }
    .sg3-anim button { font-size: .8rem; padding: 5px 9px; }
}
</style>
<div class="sg3-anim">
<figure>
<svg id="sg3-svg" viewBox="0 -72 400 162" role="img" aria-label="Two Stern-Gerlach devices in series: a z filter followed by a second filter along z, x or y"></svg>
</figure>
<div class="controls">
<button id="sg3-play" class="play">Pause</button>
<button data-f="z">Filter z</button>
<button data-f="x">Filter x</button>
<button data-f="y">Filter y</button>
<button id="sg3-burst">Burst</button>
<button id="sg3-reset">Reset</button>
<label class="spd">Speed <input id="sg3-speed" type="range" min="0.5" max="4" step="0.1" value="1.5" aria-label="Speed"></label>
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
/* beam axis is y = 0; up on screen is negative y */
var XO=44, M1=68, M1E=128, COL=146, RET0=151, RET1=194;
var M2=198, M2E=258, SCX=324, U=11, MAXA=90;
var DET_Y=2*U, BW=46, BX=346;
/* spin axes as drawn in the little legend: z up, x right, y towards the viewer */
var AX={ z:[0,-1], x:[1,0], y:[-0.7071,0.7071] };
var filter='x', playing=true, speed=1.5, raf=0, last=0, acc=0;
var atoms=[], cu=0, cd=0, flashU=0, flashD=0;
var svg, LA, labM2, labU, labD, barU, barD, fU, fD;
var reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
function el(t,at,par){
    var e=document.createElementNS(NS,t);
    for(var k in at){ e.setAttribute(k,at[k]); }
    if(par){ par.appendChild(e); }
    return e;
}
function tex(s){ return katex.renderToString(s,{throwOnError:false,output:'html'}); }
function cl(x){ return Math.max(0,Math.min(1,x)); }
function sm(u){ u=cl(u); return u*u*(3-2*u); }
function gs(){ return (Math.random()+Math.random()+Math.random()-1.5)/1.5; }
function lab(par,t,w){
    var fo=el('foreignObject',{width:w,height:24},par);
    fo.style.overflow='visible';
    var d=document.createElement('div');
    d.className='fl';
    d.innerHTML=tex(t);
    fo.appendChild(d);
    fo.put=function(cx,cy){
        fo.setAttribute('x',cx-w/2);
        fo.setAttribute('y',cy-12);
        return fo;
    };
    fo.set=function(s){ d.innerHTML=tex(s); };
    return fo;
}
function txt(par,x,y,s,anchor){
    var e=el('text',{x:x,y:y,'text-anchor':anchor||'middle',class:'tx'},par);
    e.textContent=s;
    return e;
}
/* two identical, mirror-image poles about the beam axis */
function magnet(mx,letter){
    el('polygon',{points:[mx-8,-46, mx+68,-46, mx+68,-30, mx+46,-17, mx+14,-17, mx-8,-30].join(' '),class:'pole'},svg);
    el('polygon',{points:[mx-8,46,  mx+68,46,  mx+68,30,  mx+46,17,  mx+14,17,  mx-8,30 ].join(' '),class:'pole'},svg);
    [14,22,30,38,46].forEach(function(d){
        el('line',{x1:mx+d,y1:16,x2:mx+d,y2:-16,class:'fieldln'},svg);
    });
    lab(svg,'N',24).put(mx+30,-33);
    lab(svg,'S',24).put(mx+30,33);
}
function build(){
    svg=$('sg3-svg');
    svg.innerHTML='';
    /* source and entrance slits */
    el('line',{x1:34,y1:0,x2:M1,y2:0,class:'guide'},svg);
    el('rect',{x:6,y:-14,width:28,height:28,rx:4,class:'body'},svg);
    el('rect',{x:32,y:-4,width:4,height:8,style:'fill:var(--card)'},svg);
    el('rect',{x:50,y:-22,width:5,height:17,class:'plate'},svg);
    el('rect',{x:50,y:5,width:5,height:17,class:'plate'},svg);
    /* first filter, fixed along z */
    magnet(M1,'z');
    lab(svg,'\\mathsf{SG}_{z}',60).put(M1+30,-59);
    /* collimator: the slit lets only the upper (+z) beam through */
    el('rect',{x:COL,y:-46,width:5,height:31,class:'plate'},svg);
    el('rect',{x:COL,y:-7,width:5,height:53,class:'plate'},svg);
    lab(svg,'\\lvert{+}z\\rangle',50).put(172,-24);
    /* second filter, axis chosen by the buttons */
    magnet(M2,'');
    labM2=lab(svg,'',60).put(M2+30,-59);
    /* detectors, one per output beam, each with a bar showing its share of the counts */
    [-1,1].forEach(function(sg){
        var yd=sg*DET_Y;
        el('rect',{x:SCX+2,y:yd-9,width:10,height:18,class:'det'},svg);
        var f=el('rect',{x:SCX+2,y:yd-9,width:10,height:18,style:'fill:var('+(sg<0?'--sg-c3':'--sg-c1')+');opacity:0'},svg);
        el('rect',{x:BX,y:yd-4,width:BW,height:8,class:'trk'},svg);
        var b=el('rect',{x:BX,y:yd-4,width:0,height:8,style:'fill:var('+(sg<0?'--sg-c3':'--sg-c1')+');opacity:.85'},svg);
        var l=lab(svg,'',40).put(BX+BW/2,yd+(sg<0?-17:17));
        if(sg<0){ fU=f; barU=b; labU=l; } else { fD=f; barD=b; labD=l; }
    });
    /* legend of spin axes */
    el('line',{x1:26,y1:52,x2:26,y2:28,class:'ln'},svg);
    el('line',{x1:26,y1:52,x2:50,y2:52,class:'ln'},svg);
    el('line',{x1:26,y1:52,x2:10,y2:68,class:'ln'},svg);
    el('polygon',{points:'26,25 23,31 29,31',style:'fill:var(--fg)'},svg);
    el('polygon',{points:'53,52 47,49 47,55',style:'fill:var(--fg)'},svg);
    el('polygon',{points:'10,68 16,65.5 12.5,62',style:'fill:var(--fg)'},svg);
    lab(svg,'z',16).put(26,19);
    lab(svg,'x',16).put(60,52);
    lab(svg,'y',16).put(5,76);
    txt(svg,40,80,'spin axes','start');
    LA=el('g',{},svg);
}
function yOf(a,x){
    var D=U*a.k;
    if(x<=M1){ return a.y0; }
    if(x<=M1E){ return a.y0-a.s1*D*sm((x-M1)/(M1E-M1)); }
    if(x<=RET0){ return a.y0-a.s1*D; }
    if(x<=RET1){ return a.y0-D*(1-sm((x-RET0)/(RET1-RET0))); }
    if(x<=M2){ return a.y0; }
    if(x<=M2E){ return a.y0-a.s2*D*sm((x-M2)/(M2E-M2)); }
    return a.y0-a.s2*D*(1+sm((x-M2E)/(SCX-M2E)));
}
function cvar(s){ return s>=0 ? '--sg-c3' : '--sg-c1'; }
function needle(g,v,s){
    var L=5.2;
    var nd=el('line',{'stroke-width':1.2,'stroke-linecap':'round',stroke:'var(--fg)'},g);
    var hd=el('circle',{r:1.5,style:'fill:var(--fg)'},g);
    var vx=v[0]*s*L, vy=v[1]*s*L;
    nd.setAttribute('x1',-vx); nd.setAttribute('y1',-vy);
    nd.setAttribute('x2',vx);  nd.setAttribute('y2',vy);
    hd.setAttribute('cx',vx);  hd.setAttribute('cy',vy);
    nd.style.opacity=0; hd.style.opacity=0;
    return {nd:nd,hd:hd};
}
function newAtom(t0){
    var s1=Math.random()<.5 ? 1 : -1;
    var s2=filter==='z' ? 1 : (Math.random()<.5 ? 1 : -1);
    var g=el('g',{},LA);
    var ring=el('circle',{r:4.3,fill:'none',stroke:'var(--muted)','stroke-width':1,'stroke-dasharray':'2 2'},g);
    var body=el('circle',{r:2.8,style:'fill:var(--muted)'},g);
    atoms.push({
        s1:s1, s2:s2, t:t0||0, y0:gs()*1.0, k:1+0.04*gs(),
        dead:false, fade:1, g:g, ring:ring, body:body,
        n0:needle(g,AX.z,s1),
        n1:needle(g,AX[filter],s2)
    });
}
function place(a){
    if(a.t<0){ a.g.style.display='none'; return; }
    a.g.style.display='';
    var x=XO+a.t, y=yOf(a,x);
    a.g.setAttribute('transform','translate('+x+','+y+')');
    var m1=cl((x-M1)/16), m2=cl((x-M2)/16);
    a.ring.style.opacity=1-m1;
    a.n0.nd.style.opacity=m1*(1-m2); a.n0.hd.style.opacity=m1*(1-m2);
    a.n1.nd.style.opacity=m2;        a.n1.hd.style.opacity=m2;
    a.body.style.fill = m2>0
        ? 'color-mix(in srgb,var('+cvar(a.s2)+') '+Math.round(100*m2)+'%,var('+cvar(a.s1)+'))'
        : 'color-mix(in srgb,var('+cvar(a.s1)+') '+Math.round(100*m1)+'%,var(--muted))';
    a.g.style.opacity=a.dead ? a.fade : 1;
}
function drawBars(){
    var tot=cu+cd;
    barU.setAttribute('width',tot ? cu/tot*BW : 0);
    barD.setAttribute('width',tot ? cd/tot*BW : 0);
}
function clearAll(){
    atoms.forEach(function(a){ if(a.g.parentNode){ LA.removeChild(a.g); } });
    atoms=[]; cu=0; cd=0; flashU=0; flashD=0;
    drawBars();
}
function step(dt){
    acc+=dt;
    while(acc>=.1){
        acc-=.1;
        if(atoms.length<MAXA){ newAtom(0); }
    }
    for(var i=atoms.length-1;i>=0;i--){
        var a=atoms[i];
        if(a.dead){
            a.fade-=dt*4;
            if(a.fade<=0){ LA.removeChild(a.g); atoms.splice(i,1); continue; }
            place(a);
            continue;
        }
        a.t+=95*dt;
        var x=XO+a.t;
        if(a.s1<0 && x>=COL){ a.t=COL-XO; a.dead=true; place(a); continue; }
        if(x>=SCX){
            if(a.s2>0){ cu++; flashU=1; } else { cd++; flashD=1; }
            LA.removeChild(a.g);
            atoms.splice(i,1);
            continue;
        }
        place(a);
    }
    flashU=Math.max(0,flashU-dt*5); flashD=Math.max(0,flashD-dt*5);
    fU.style.opacity=flashU; fD.style.opacity=flashD;
    drawBars();
}
function frame(now){
    raf=requestAnimationFrame(frame);
    var dt=Math.min(.05,(now-last)/1000);
    last=now;
    if(!playing){ return; }
    step(dt*speed);
}
function setFilter(f){
    filter=f;
    clearAll();
    labM2.set('\\mathsf{SG}_{'+f+'}');
    labU.set('{+}'+f);
    labD.set('{-}'+f);
    document.querySelectorAll('.sg3-anim button[data-f]').forEach(function(bt){
        bt.setAttribute('aria-current',String(bt.getAttribute('data-f')===f));
    });
    if(reduce){ instant(400); }
}
function instant(n){
    for(var i=0;i<n;i++){
        if(Math.random()<.5){
            if(filter==='z' || Math.random()<.5){ cu++; } else { cd++; }
        }
    }
    drawBars();
}
function setPlay(on){
    playing=on;
    $('sg3-play').textContent=on ? 'Pause' : 'Play';
}
$('sg3-play').onclick=function(){ setPlay(!playing); };
$('sg3-reset').onclick=function(){ clearAll(); acc=0; };
$('sg3-burst').onclick=function(){
    for(var i=0;i<40;i++){ newAtom(-i*5); }
    if(!playing){ setPlay(true); }
};
$('sg3-speed').oninput=function(){ speed=+this.value; };
document.querySelectorAll('.sg3-anim button[data-f]').forEach(function(bt){
    bt.onclick=function(){ setFilter(bt.getAttribute('data-f')); };
});
build();
setFilter('x');
if(reduce){
    setPlay(false);
}else{
    last=performance.now();
    raf=requestAnimationFrame(frame);
}
})();
</script>
@end(animation)

If the second apparatus is aligned with the original \(z\)-axis, the atoms emerge through the upper output only. This is what we expect from repeating the same measurement.

But what happens when the second apparatus is oriented along the \(x\)-axis? The beam now separates into two components, with equal probabilities for the two outcomes in the ideal model. The same is true for an apparatus oriented along the \(y\)-axis.

@subsection{So what are the results?, label = subsection-label}

We can summarize these results for atoms prepared in the \( +z \) output, which we denote by \(\lvert z,+\rangle\):

\[
P(+x\mid +z)=P(-x\mid +z)=\frac{1}{2}.
\]

\[
P(+y\mid +z)=P(-y\mid +z)=\frac{1}{2}.
\]

@subsection{A general result, label = subsection-label}

So far, we have considered only measurement axes that are parallel or perpendicular to the original \(z\)-axis. But these are only special cases.

Let the second apparatus be oriented along a direction \(\mathbf n\) that makes an angle \(\theta\) with the \(z\)-axis. We can now investigate how the probabilities of the two outcomes vary as we change this angle.

@begin(animation, label = stern-gerlach-angle)
<style>
.sg4-anim { width: 100%; color: var(--fg); box-sizing: border-box; padding: 4px 8px 16px; }
.sg4-anim figure { margin: 0; padding: 8px 4px 8px; overflow: hidden; }
.sg4-anim svg { display: block; width: 100%; max-width: 680px; height: auto; margin: 0 auto; }
.sg4-anim {
    --sg-c1: #2f6db5;
    --sg-c3: #c9821f;
}
:root[data-theme="dark"] .sg4-anim {
    --sg-c1: #4f86d1;
    --sg-c3: #d9962f;
}
.sg4-anim .ln  { stroke: var(--fg); stroke-width: 1.5; fill: none; }
.sg4-anim .guide { stroke: var(--muted); stroke-width: 1; stroke-dasharray: 3 4; opacity: .45; fill: none; }
.sg4-anim .pole { fill: color-mix(in srgb, var(--muted) 38%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg4-anim .body { fill: color-mix(in srgb, var(--muted) 22%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg4-anim .plate { fill: var(--fg); }
.sg4-anim .det { fill: color-mix(in srgb, var(--muted) 30%, var(--card)); stroke: var(--fg); stroke-width: 1.6; }
.sg4-anim .trk { fill: none; stroke: var(--muted); stroke-width: 1; opacity: .6; }
.sg4-anim .fieldln { stroke: var(--muted); stroke-width: 1.1; stroke-dasharray: 3 3; fill: none; opacity: .8; }
.sg4-anim .frm { fill: var(--card); stroke: var(--fg); stroke-width: 1.4; }
.sg4-anim .gr { stroke: var(--muted); stroke-width: 1; opacity: .25; fill: none; }
.sg4-anim .tx { font-family: var(--sans); font-size: 9.5px; fill: var(--muted); }
.sg4-anim .fl {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    font-size: 12px; line-height: 1; white-space: nowrap;
    font-family: var(--serif);
    color: var(--fg);
}
.sg4-anim .fl .katex { font-size: 1em; }
.sg4-anim .controls {
    display: flex; align-items: center; gap: 8px; flex-wrap: wrap;
    width: 100%; max-width: 640px; margin: 10px auto 0;
}
.sg4-anim button {
    font-family: var(--sans); font-size: .85rem; color: var(--fg);
    background: var(--card); border: 1px solid var(--rule);
    border-radius: 8px; padding: 6px 11px; cursor: pointer; white-space: nowrap;
}
.sg4-anim button:hover { border-color: var(--fg); }
.sg4-anim button:focus-visible,
.sg4-anim input:focus-visible { outline: 2px solid var(--link); outline-offset: 2px; }
.sg4-anim button.play { min-width: 68px; }
.sg4-anim button[aria-current="true"] { background: var(--link); border-color: var(--link); color: var(--bg); }
.sg4-anim label.spd { font-family: var(--sans); font-size: .85rem; color: var(--muted); display: flex; align-items: center; gap: 6px; flex: 1; min-width: 150px; }
.sg4-anim label.spd b { font-weight: 400; color: var(--fg); min-width: 3.2em; }
.sg4-anim input[type="range"] { flex: 1; min-width: 70px; accent-color: var(--link); }
@media (max-width: 520px) {
    .sg4-anim figure { padding-left: 0; padding-right: 0; }
    .sg4-anim .controls { gap: 6px; }
    .sg4-anim button { font-size: .8rem; padding: 5px 9px; }
}
</style>
<div class="sg4-anim">
<figure>
<svg id="sg4-svg" viewBox="0 -72 400 342" role="img" aria-label="A z filter followed by a Stern-Gerlach device tilted by an angle theta, with the outcome probabilities plotted against theta"></svg>
</figure>
<div class="controls">
<label class="spd">&theta; <input id="sg4-theta" type="range" min="0" max="180" step="1" value="90" aria-label="Angle theta in degrees"> <b id="sg4-thv">90&deg;</b></label>
</div>
<div class="controls">
<button id="sg4-play" class="play">Pause</button>
<button id="sg4-sweep">Sweep &theta;</button>
<button data-th="0">0&deg;</button>
<button data-th="90">90&deg;</button>
<button data-th="180">180&deg;</button>
<button id="sg4-burst">Burst</button>
<button id="sg4-reset">Reset</button>
<label class="spd">Speed <input id="sg4-speed" type="range" min="0.5" max="4" step="0.1" value="1.5" aria-label="Speed"></label>
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
/* beam axis is y = 0; up on screen is negative y */
var XO=44, M1=68, M1E=128, COL=146, RET0=151, RET1=194;
var M2=198, M2E=258, SCX=324, U=11, MAXA=90;
var DET_Y=2*U, BW=46, BX=346;
/* plot of the outcome probabilities */
var PX0=52, PX1=300, PY0=232, PY1=116;
var theta=Math.PI/2, playing=true, sweeping=false, sdir=1, speed=1.5, raf=0, last=0, acc=0;
var atoms=[], outs=[];
var svg, LA, labU, labD, barU, barD, fU, fD, flashU=0, flashD=0;
var nArrow, nHead, nArc, nLab, thLab, mark, thU, thD, mU, mD;
var reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
function el(t,at,par){
    var e=document.createElementNS(NS,t);
    for(var k in at){ e.setAttribute(k,at[k]); }
    if(par){ par.appendChild(e); }
    return e;
}
function tex(s){ return katex.renderToString(s,{throwOnError:false,output:'html'}); }
function cl(x){ return Math.max(0,Math.min(1,x)); }
function sm(u){ u=cl(u); return u*u*(3-2*u); }
function gs(){ return (Math.random()+Math.random()+Math.random()-1.5)/1.5; }
function pPlus(t){ var c=Math.cos(t/2); return c*c; }
function cvar(s){ return s>=0 ? '--sg-c3' : '--sg-c1'; }
function lab(par,t,w){
    var fo=el('foreignObject',{width:w,height:24},par);
    fo.style.overflow='visible';
    var d=document.createElement('div');
    d.className='fl';
    d.innerHTML=tex(t);
    fo.appendChild(d);
    fo.put=function(cx,cy){
        fo.setAttribute('x',cx-w/2);
        fo.setAttribute('y',cy-12);
        return fo;
    };
    return fo;
}
function txt(par,x,y,s,anchor){
    var e=el('text',{x:x,y:y,'text-anchor':anchor||'middle',class:'tx'},par);
    e.textContent=s;
    return e;
}
/* two identical, mirror-image poles about the beam axis */
function magnet(mx){
    el('polygon',{points:[mx-8,-46, mx+68,-46, mx+68,-30, mx+46,-17, mx+14,-17, mx-8,-30].join(' '),class:'pole'},svg);
    el('polygon',{points:[mx-8,46,  mx+68,46,  mx+68,30,  mx+46,17,  mx+14,17,  mx-8,30 ].join(' '),class:'pole'},svg);
    [14,22,30,38,46].forEach(function(d){
        el('line',{x1:mx+d,y1:16,x2:mx+d,y2:-16,class:'fieldln'},svg);
    });
    lab(svg,'N',24).put(mx+30,-33);
    lab(svg,'S',24).put(mx+30,33);
}
function PXof(t){ return PX0+(PX1-PX0)*t/Math.PI; }
function PYof(p){ return PY0-(PY0-PY1)*p; }
function build(){
    svg=$('sg4-svg');
    svg.innerHTML='';
    var i;
    /* source and entrance slits */
    el('line',{x1:34,y1:0,x2:M1,y2:0,class:'guide'},svg);
    el('rect',{x:6,y:-14,width:28,height:28,rx:4,class:'body'},svg);
    el('rect',{x:32,y:-4,width:4,height:8,style:'fill:var(--card)'},svg);
    el('rect',{x:50,y:-22,width:5,height:17,class:'plate'},svg);
    el('rect',{x:50,y:5,width:5,height:17,class:'plate'},svg);
    /* first filter, fixed along z; the slit passes only +z */
    magnet(M1);
    lab(svg,'\\mathsf{SG}_{z}',60).put(M1+30,-59);
    el('rect',{x:COL,y:-46,width:5,height:31,class:'plate'},svg);
    el('rect',{x:COL,y:-7,width:5,height:53,class:'plate'},svg);
    lab(svg,'\\lvert{+}z\\rangle',50).put(172,-24);
    /* second filter, tilted by theta from z */
    magnet(M2);
    lab(svg,'\\mathsf{SG}_{\\theta}',60).put(M2+30,-59);
    /* detectors with bars showing their share of the recent counts */
    [-1,1].forEach(function(sg){
        var yd=sg*DET_Y;
        el('rect',{x:SCX+2,y:yd-9,width:10,height:18,class:'det'},svg);
        var f=el('rect',{x:SCX+2,y:yd-9,width:10,height:18,style:'fill:var('+cvar(-sg)+');opacity:0'},svg);
        el('rect',{x:BX,y:yd-4,width:BW,height:8,class:'trk'},svg);
        var b=el('rect',{x:BX,y:yd-4,width:0,height:8,style:'fill:var('+cvar(-sg)+');opacity:.85'},svg);
        var l=lab(svg,sg<0 ? '{+}\\hat n' : '{-}\\hat n',40).put(BX+BW/2,yd+(sg<0?-17:17));
        if(sg<0){ fU=f; barU=b; } else { fD=f; barD=b; }
    });
    /* legend: z, x and the tilted axis n */
    el('line',{x1:26,y1:52,x2:26,y2:28,class:'ln'},svg);
    el('line',{x1:26,y1:52,x2:50,y2:52,class:'ln'},svg);
    el('polygon',{points:'26,25 23,31 29,31',style:'fill:var(--fg)'},svg);
    el('polygon',{points:'53,52 47,49 47,55',style:'fill:var(--fg)'},svg);
    lab(svg,'z',16).put(26,19);
    lab(svg,'x',16).put(52,63);
    nArc=el('path',{fill:'none',style:'stroke:var(--fg)','stroke-width':1},svg);
    nArrow=el('line',{x1:26,y1:52,style:'stroke:var(--sg-c3)','stroke-width':2.2},svg);
    nHead=el('polygon',{style:'fill:var(--sg-c3)'},svg);
    nLab=lab(svg,'\\hat n',16);
    thLab=lab(svg,'\\theta',14);
    txt(svg,40,80,'spin axes','start');
    LA=el('g',{},svg);
    /* probability plot below */
    txt(svg,(PX0+PX1)/2,106,'outcome probabilities of the second filter');
    el('rect',{x:PX0,y:PY1,width:PX1-PX0,height:PY0-PY1,class:'frm'},svg);
    el('line',{x1:PX0,y1:PYof(.5),x2:PX1,y2:PYof(.5),class:'guide'},svg);
    el('line',{x1:PXof(Math.PI/2),y1:PY1,x2:PXof(Math.PI/2),y2:PY0,class:'gr'},svg);
    [0,Math.PI/2,Math.PI].forEach(function(t,k){
        el('line',{x1:PXof(t),y1:PY0,x2:PXof(t),y2:PY0+4,class:'ln'},svg);
        lab(svg,['0','\\tfrac{\\pi}{2}','\\pi'][k],24).put(PXof(t),PY0+14);
    });
    [0,.5,1].forEach(function(p,k){
        el('line',{x1:PX0-4,y1:PYof(p),x2:PX0,y2:PYof(p),class:'ln'},svg);
        lab(svg,['0','\\tfrac12','1'][k],20).put(PX0-14,PYof(p));
    });
    lab(svg,'\\theta',16).put((PX0+PX1)/2,PY0+32);
    lab(svg,'P',16).put(20,(PY0+PY1)/2);
    var dP='',dM='',N=80;
    for(i=0;i<=N;i++){
        var t=Math.PI*i/N, x=PXof(t);
        dP+=(i?'L':'M')+x+','+PYof(pPlus(t))+' ';
        dM+=(i?'L':'M')+x+','+PYof(1-pPlus(t))+' ';
    }
    el('path',{d:dP,fill:'none',style:'stroke:var(--sg-c3)','stroke-width':2},svg);
    el('path',{d:dM,fill:'none',style:'stroke:var(--sg-c1)','stroke-width':2},svg);
    el('rect',{x:306,y:134,width:9,height:3,style:'fill:var(--sg-c3)'},svg);
    lab(svg,'P_{+}=\\cos^{2}\\tfrac{\\theta}{2}',82).put(358,136);
    el('rect',{x:306,y:190,width:9,height:3,style:'fill:var(--sg-c1)'},svg);
    lab(svg,'P_{-}=\\sin^{2}\\tfrac{\\theta}{2}',82).put(358,192);
    /* current theta: marker, theory points (open) and measured points (filled) */
    mark=el('line',{y1:PY1,y2:PY0,style:'stroke:var(--fg)','stroke-width':1.2,'stroke-dasharray':'4 3'},svg);
    thU=el('circle',{r:4.2,style:'fill:var(--card);stroke:var(--sg-c3);stroke-width:1.8'},svg);
    thD=el('circle',{r:4.2,style:'fill:var(--card);stroke:var(--sg-c1);stroke-width:1.8'},svg);
    mU=el('circle',{r:2.6,style:'fill:var(--sg-c3);opacity:0'},svg);
    mD=el('circle',{r:2.6,style:'fill:var(--sg-c1);opacity:0'},svg);
    txt(svg,PX1-4,PY0-5,'open: theory, filled: measured','end');
}
function updateTheta(){
    var s=Math.sin(theta), c=Math.cos(theta), O=[26,52];
    var tx=O[0]+26*s, ty=O[1]-26*c;
    nArrow.setAttribute('x2',tx-6*s); nArrow.setAttribute('y2',ty+6*c);
    var bx=tx-7*s, by=ty+7*c;
    nHead.setAttribute('points',[tx,ty, bx+3.2*c,by+3.2*s, bx-3.2*c,by-3.2*s].join(' '));
    var th=Math.min(theta,Math.PI-0.002), r=13;
    nArc.setAttribute('d','M'+O[0]+','+(O[1]-r)+' A'+r+','+r+' 0 0 1 '+(O[0]+r*Math.sin(th))+','+(O[1]-r*Math.cos(th)));
    nLab.put(O[0]+40*s,O[1]-40*c);
    thLab.put(O[0]+22*Math.sin(theta/2)+4,O[1]-22*Math.cos(theta/2)-2);
    nArrow.style.opacity=theta<0.03 ? 0 : 1;
    var x=PXof(theta), pu=pPlus(theta);
    mark.setAttribute('x1',x); mark.setAttribute('x2',x);
    thU.setAttribute('cx',x); thU.setAttribute('cy',PYof(pu));
    thD.setAttribute('cx',x); thD.setAttribute('cy',PYof(1-pu));
    mU.setAttribute('cx',x); mD.setAttribute('cx',x);
    $('sg4-thv').textContent=Math.round(theta*180/Math.PI)+'\u00b0';
    $('sg4-theta').value=Math.round(theta*180/Math.PI);
}
function yOf(a,x){
    var D=U*a.k;
    if(x<=M1){ return a.y0; }
    if(x<=M1E){ return a.y0-a.s1*D*sm((x-M1)/(M1E-M1)); }
    if(x<=RET0){ return a.y0-a.s1*D; }
    if(x<=RET1){ return a.y0-D*(1-sm((x-RET0)/(RET1-RET0))); }
    if(x<=M2){ return a.y0; }
    if(x<=M2E){ return a.y0-a.s2*D*sm((x-M2)/(M2E-M2)); }
    return a.y0-a.s2*D*(1+sm((x-M2E)/(SCX-M2E)));
}
function needle(g,v,s){
    var L=5.2;
    var nd=el('line',{'stroke-width':1.2,'stroke-linecap':'round',stroke:'var(--fg)'},g);
    var hd=el('circle',{r:1.5,style:'fill:var(--fg)'},g);
    var vx=v[0]*s*L, vy=v[1]*s*L;
    nd.setAttribute('x1',-vx); nd.setAttribute('y1',-vy);
    nd.setAttribute('x2',vx);  nd.setAttribute('y2',vy);
    hd.setAttribute('cx',vx);  hd.setAttribute('cy',vy);
    nd.style.opacity=0; hd.style.opacity=0;
    return {nd:nd,hd:hd};
}
function newAtom(t0){
    var s1=Math.random()<.5 ? 1 : -1;
    var s2=Math.random()<pPlus(theta) ? 1 : -1;
    var g=el('g',{},LA);
    var ring=el('circle',{r:4.3,fill:'none',stroke:'var(--muted)','stroke-width':1,'stroke-dasharray':'2 2'},g);
    var body=el('circle',{r:2.8,style:'fill:var(--muted)'},g);
    atoms.push({
        s1:s1, s2:s2, t:t0||0, y0:gs()*1.0, k:1+0.04*gs(),
        dead:false, fade:1, g:g, ring:ring, body:body,
        n0:needle(g,[0,-1],s1),
        n1:needle(g,[Math.sin(theta),-Math.cos(theta)],s2)
    });
}
function place(a){
    if(a.t<0){ a.g.style.display='none'; return; }
    a.g.style.display='';
    var x=XO+a.t, y=yOf(a,x);
    a.g.setAttribute('transform','translate('+x+','+y+')');
    var m1=cl((x-M1)/16), m2=cl((x-M2)/16);
    a.ring.style.opacity=1-m1;
    a.n0.nd.style.opacity=m1*(1-m2); a.n0.hd.style.opacity=m1*(1-m2);
    a.n1.nd.style.opacity=m2;        a.n1.hd.style.opacity=m2;
    a.body.style.fill = m2>0
        ? 'color-mix(in srgb,var('+cvar(a.s2)+') '+Math.round(100*m2)+'%,var('+cvar(a.s1)+'))'
        : 'color-mix(in srgb,var('+cvar(a.s1)+') '+Math.round(100*m1)+'%,var(--muted))';
    a.g.style.opacity=a.dead ? a.fade : 1;
}
function drawStats(){
    var W=sweeping ? 60 : 400;
    while(outs.length>W){ outs.shift(); }
    var u=0, i;
    for(i=0;i<outs.length;i++){ if(outs[i]>0){ u++; } }
    var tot=outs.length;
    barU.setAttribute('width',tot ? u/tot*BW : 0);
    barD.setAttribute('width',tot ? (tot-u)/tot*BW : 0);
    var x=PXof(theta);
    mU.style.opacity=tot ? 1 : 0; mD.style.opacity=tot ? 1 : 0;
    if(tot){
        mU.setAttribute('cx',x); mU.setAttribute('cy',PYof(u/tot));
        mD.setAttribute('cx',x); mD.setAttribute('cy',PYof((tot-u)/tot));
    }
}
function clearAll(){
    atoms.forEach(function(a){ if(a.g.parentNode){ LA.removeChild(a.g); } });
    atoms=[]; outs=[]; flashU=0; flashD=0;
    drawStats();
}
function step(dt){
    if(sweeping){
        theta+=sdir*dt*0.55;
        if(theta>=Math.PI){ theta=Math.PI; sdir=-1; }
        if(theta<=0){ theta=0; sdir=1; }
        updateTheta();
    }
    acc+=dt;
    while(acc>=.1){
        acc-=.1;
        if(atoms.length<MAXA){ newAtom(0); }
    }
    for(var i=atoms.length-1;i>=0;i--){
        var a=atoms[i];
        if(a.dead){
            a.fade-=dt*4;
            if(a.fade<=0){ LA.removeChild(a.g); atoms.splice(i,1); continue; }
            place(a);
            continue;
        }
        a.t+=95*dt;
        var x=XO+a.t;
        if(a.s1<0 && x>=COL){ a.t=COL-XO; a.dead=true; place(a); continue; }
        if(x>=SCX){
            outs.push(a.s2);
            if(a.s2>0){ flashU=1; } else { flashD=1; }
            LA.removeChild(a.g);
            atoms.splice(i,1);
            continue;
        }
        place(a);
    }
    flashU=Math.max(0,flashU-dt*5); flashD=Math.max(0,flashD-dt*5);
    fU.style.opacity=flashU; fD.style.opacity=flashD;
    drawStats();
}
function frame(now){
    raf=requestAnimationFrame(frame);
    var dt=Math.min(.05,(now-last)/1000);
    last=now;
    if(!playing){ return; }
    step(dt*speed);
}
function setTheta(deg){
    theta=deg*Math.PI/180;
    updateTheta();
    clearAll();
    if(reduce){ instant(300); }
}
function instant(n){
    for(var i=0;i<n;i++){
        if(Math.random()<.5){ outs.push(Math.random()<pPlus(theta) ? 1 : -1); }
    }
    drawStats();
}
function setPlay(on){
    playing=on;
    $('sg4-play').textContent=on ? 'Pause' : 'Play';
}
$('sg4-play').onclick=function(){ setPlay(!playing); };
$('sg4-reset').onclick=function(){ clearAll(); acc=0; };
$('sg4-burst').onclick=function(){
    for(var i=0;i<40;i++){ newAtom(-i*5); }
    if(!playing){ setPlay(true); }
};
$('sg4-speed').oninput=function(){ speed=+this.value; };
$('sg4-theta').oninput=function(){
    sweeping=false;
    $('sg4-sweep').setAttribute('aria-current','false');
    setTheta(+this.value);
};
$('sg4-sweep').onclick=function(){
    sweeping=!sweeping;
    this.setAttribute('aria-current',String(sweeping));
    if(sweeping){ clearAll(); if(!playing){ setPlay(true); } }
};
document.querySelectorAll('.sg4-anim button[data-th]').forEach(function(bt){
    bt.onclick=function(){
        sweeping=false;
        $('sg4-sweep').setAttribute('aria-current','false');
        setTheta(+bt.getAttribute('data-th'));
    };
});
build();
updateTheta();
drawStats();
if(reduce){
    instant(300);
    setPlay(false);
}else{
    last=performance.now();
    raf=requestAnimationFrame(frame);
}
})();
</script>
@end(animation)

For an ideal spin-\(\tfrac12\) system, the quantum model predicts the following angular dependence:

\[
P(+_{\mathbf n}\mid +z)=\cos^2\left(\frac{\theta}{2}\right)
\]

Here, \(+_{\mathbf n}\) denotes the positive outcome along the second measurement direction, and \(\theta\) is the angle between that direction and the original \(z\)-axis.
