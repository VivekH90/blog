@documenttitle{Physics}
@doctype(notes)
@author{Vivek Kalita}
@date{18 October 2026}
@title{Introduction to Radiation}
@description{Introduction to the production of radiation in classical electrodynamic theory}
@tags{Electrodynamics, Radiation}

@section{Introduction, label = section-label}

A charge at rest produces a Coulomb field proportional to \(1/R^2\). 

For a charge moving with constant velocity, the resulting field is a Lorentz-transformed version of the Coulomb field1. It thus retains the \(1/R^2\) dependence. 

The charge also produces a magnetic field. The two fields are related by 
\[
\mathbf B=\frac{1}{c^2}\mathbf v\times\mathbf E
\]
Thus, the magnetic field also retains the \(1/R^2\) dependence.

@begin(animation, label = uniform-velocity-charge)

<style>

.uc-anim { width: 100%; color: var(--fg); box-sizing: border-box; padding: 4px 8px 16px; }
.uc-anim figure { margin: 0; padding: 8px 4px 8px; }

.uc-anim .wrap {
    position: relative; width: 100%; max-width: 680px; aspect-ratio: 400 / 384;
    margin: 0 auto; background: var(--card); border-radius: 6px; overflow: hidden;
}
.uc-anim .wrap canvas { position: absolute; left: 0; top: 0; width: 100%; height: 65.1%; display: block; }
.uc-anim .wrap svg { position: absolute; left: 0; top: 0; width: 100%; height: 100%; display: block; }

.uc-anim .frm { fill: none; stroke: #fff; stroke-opacity: .85; stroke-width: 2.4; }
.uc-anim .halo { fill: none; stroke: rgba(0,0,0,.55); stroke-width: 2.8; stroke-linecap: round; stroke-linejoin: round; }
.uc-anim .vec { fill: none; stroke: #fff; stroke-width: 1.15; stroke-linecap: round; stroke-linejoin: round; }
.uc-anim .lnh { fill: none; stroke: rgba(0,0,0,.5); stroke-width: 3; stroke-linecap: round; stroke-linejoin: round; }
.uc-anim .lnw { fill: none; stroke: #fff; stroke-width: 1.4; stroke-linecap: round; stroke-linejoin: round; }
.uc-anim .pc { fill: none; stroke: #fff; stroke-width: 1.1; stroke-dasharray: 4 4; opacity: .75; }
.uc-anim .pd { fill: var(--sg-c3); stroke: #fff; stroke-width: 1.6; }
.uc-anim .qring { fill: #ff4d3d; stroke: #fff; stroke-width: 1.6; }
.uc-anim .qsign { stroke: #fff; stroke-width: 1.7; stroke-linecap: round; }
.uc-anim .vel { stroke: #34d27b; stroke-width: 2.4; stroke-linecap: round; fill: none; }
.uc-anim .velh { fill: #34d27b; }

.uc-anim .wrap.nomap .frm { stroke: var(--fg); stroke-opacity: 1; }
.uc-anim .wrap.nomap .halo, .uc-anim .wrap.nomap .lnh { stroke: var(--card); }
.uc-anim .wrap.nomap .vec, .uc-anim .wrap.nomap .lnw { stroke: var(--fg); }
.uc-anim .wrap.nomap .pc { stroke: var(--fg); }
.uc-anim .wrap.nomap .pd { stroke: var(--fg); }
.uc-anim .wrap.nomap .pl { color: var(--fg); text-shadow: none; }

.uc-anim {
    --sg-c1: #2f6db5;
    --sg-c3: #c9821f;
}
:root[data-theme="dark"] .uc-anim {
    --sg-c1: #4f86d1;
    --sg-c3: #d9962f;
}

.uc-anim .ax { stroke: var(--muted); stroke-width: 1; fill: none; }
.uc-anim .ref { stroke: var(--muted); stroke-width: 1.2; stroke-dasharray: 3 3; fill: none; }
.uc-anim .curve { stroke: var(--sg-c3); stroke-width: 2.2; stroke-linejoin: round; fill: color-mix(in srgb, var(--sg-c3) 16%, var(--card)); }
.uc-anim .ray { stroke: var(--sg-c3); stroke-width: 1; opacity: .7; fill: none; }
.uc-anim .tx { font-family: var(--sans); font-size: 9.5px; fill: var(--muted); }

.uc-anim .fl {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    font-size: 13px; line-height: 1; white-space: nowrap;
    font-family: var(--serif);
    color: var(--fg);
}
.uc-anim .fl .katex { font-size: 1em; }
.uc-anim .pl { color: #fff; text-shadow: 0 0 3px rgba(0,0,0,.85), 0 0 2px rgba(0,0,0,.85); }

.uc-anim .controls {
    display: flex; align-items: center; gap: 8px; flex-wrap: wrap;
    width: 100%; max-width: 680px; margin: 10px auto 0;
}

.uc-anim button {
    font-family: var(--sans); font-size: .85rem; color: var(--fg);
    background: var(--card); border: 1px solid var(--rule);
    border-radius: 8px; padding: 6px 11px; cursor: pointer; white-space: nowrap;
}
.uc-anim button:hover { border-color: var(--fg); }
.uc-anim button:focus-visible,
.uc-anim input:focus-visible { outline: 2px solid var(--link); outline-offset: 2px; }
.uc-anim button.play { min-width: 68px; }
.uc-anim button[aria-current="true"] { background: var(--link); border-color: var(--link); color: var(--bg); }
.uc-anim label.rt { font-family: var(--serif); font-size: 1rem; color: var(--fg); display: flex; align-items: center; gap: 10px; flex: 1; min-width: 220px; }
.uc-anim label.rt .katex { font-size: 1.05em; }
.uc-anim label.rt b { font-weight: 400; min-width: 2.8em; font-family: var(--serif); }
.uc-anim input[type="range"] { flex: 1; min-width: 90px; accent-color: var(--link); }

@media (max-width: 520px) {
    .uc-anim figure { padding-left: 0; padding-right: 0; }
    .uc-anim .controls { gap: 6px; }
    .uc-anim button { font-size: .8rem; padding: 5px 9px; }
}

</style>

<div class="uc-anim">

<figure>
<div class="wrap" id="uc-wrap">
<canvas id="uc-cv" width="200" height="125"></canvas>
<svg id="uc-svg" viewBox="0 0 400 384" role="img" aria-label="Electric field of a point charge moving at constant velocity: a heat map of the field strength, field vectors and field lines, and a polar plot of the field strength against angle"></svg>
</div>
</figure>

<div class="controls">
<label class="rt"><span id="uc-lab"></span>
<input id="uc-beta" type="range" min="0" max="0.99" step="0.01" value="0.9" aria-label="Speed of the charge as a fraction of the speed of light">
<b id="uc-val"></b></label>
</div>

<div class="controls">
<button id="uc-play" class="play">Pause</button>
<button id="uc-map">Heat map</button>
<button id="uc-vec">Vectors</button>
<button id="uc-lin">Field lines</button>
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

/* units: c = 1, q/(4 pi eps0) = 1. Uniform motion along +x with speed B.
   Field at displacement (x, y) from the charge's PRESENT position (Heaviside):
   E = gamma * r / (gamma^2 x^2 + y^2)^(3/2) */
var B=0.9, G=1/Math.sqrt(1-0.9*0.9), ex=0, ey=0;

function setBeta(b){ B=b; G=1/Math.sqrt(1-b*b); }

function field(x,y){
    var d=G*G*x*x+y*y;
    if(d<1e-6){ d=1e-6; }
    var k=G/(d*Math.sqrt(d));
    ex=k*x; ey=k*y;
}

/* strength at fixed distance R from the charge, in units of q/R^2, at angle psi to the motion */
function fpsi(psi){
    var s=Math.sin(psi);
    return (1-B*B)/Math.pow(1-B*B*s*s,1.5);
}


/* screen geometry: 25 px per unit, the map covers x in [-8,8], y in [-5,5] */
var K=25, MW=400, MH=250, CY=125, XH=8, YH=5, GW=200, GH=125, VIS=5;
var PCX=290, PCY=322, PR=34;                       /* polar plot centre and unit radius */
var xq=0, travel=0, probe=0, playing=true, showMap=true, showVec=true, showLin=true, raf=0, last=0;
var svg, cv, ctx, img, dyn, haloV, vecP, lnH, lnW, pcirc, pdot, qC, qH, qV, velL, velH, velLab;
var curve, ray, pdotP, valEl, vecs=[];
var reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;

function el(t,at,par){
    var e=document.createElementNS(NS,t);
    for(var k in at){ e.setAttribute(k,at[k]); }
    if(par){ par.appendChild(e); }
    return e;
}
function tex(s){ return katex.renderToString(s,{throwOnError:false,output:'html'}); }

function lab(par,t,w,cls,color){
    var fo=el('foreignObject',{width:w,height:24},par);
    fo.style.overflow='visible';
    var d=document.createElement('div');
    d.className='fl'+(cls ? ' '+cls : '');
    if(color){ d.style.color=color; }
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

/* inferno-style colour map */
var STOPS=[[0,0,4],[40,11,84],[101,21,110],[159,42,99],[212,72,66],[245,125,21],[250,193,39],[252,255,164]];
var LUT=new Uint8Array(768);
(function(){
    for(var i=0;i<256;i++){
        var p=i/255*(STOPS.length-1), k=Math.min(STOPS.length-2,Math.floor(p)), f=p-k;
        for(var c=0;c<3;c++){ LUT[3*i+c]=Math.round(STOPS[k][c]+(STOPS[k+1][c]-STOPS[k][c])*f); }
    }
})();

/* log scale: weak fields at the dark end, the charge's own field at the bright end */
function level(mag){
    var v=(Math.log(mag+1e-9)*0.4342944819+2.25)/2.65;
    return v<0 ? 0 : v>1 ? 1 : v;
}

/* radius on the polar plot: logarithmic, the dashed circle is the field of a charge at rest */
function rp(f){ return Math.max(1.5,PR+20*Math.log(f)*0.4342944819); }

function build(){
    svg=$('uc-svg'); cv=$('uc-cv'); ctx=cv.getContext('2d');
    img=ctx.createImageData(GW,GH);
    var i, defs='<defs><linearGradient id="uc-grad" x1="0" x2="1" y1="0" y2="0">';
    for(i=0;i<STOPS.length;i++){
        defs+='<stop offset="'+(i/(STOPS.length-1))+'" stop-color="rgb('+STOPS[i].join(',')+')"/>';
    }
    svg.innerHTML=defs+'</linearGradient><clipPath id="uc-clip"><rect x="0" y="0" width="'+MW+'" height="'+MH+'"/></clipPath></defs>';

    /* everything that moves with the charge sits in one clipped, fadeable group */
    dyn=el('g',{'clip-path':'url(#uc-clip)'},svg);
    lnH=el('path',{class:'lnh'},dyn);
    lnW=el('path',{class:'lnw'},dyn);
    haloV=el('path',{class:'halo'},dyn);
    vecP=el('path',{class:'vec'},dyn);
    pcirc=el('circle',{r:2*K,class:'pc'},dyn);
    pdot=el('circle',{r:4,class:'pd'},dyn);
    velL=el('line',{class:'vel'},dyn);
    velH=el('polygon',{class:'velh'},dyn);
    velLab=lab(dyn,'\\mathbf{v}',16,'pl');
    qC=el('circle',{r:6,class:'qring'},dyn);
    qH=el('line',{class:'qsign'},dyn);
    qV=el('line',{class:'qsign'},dyn);

    el('rect',{x:0,y:0,width:MW,height:MH,class:'frm'},svg);

    /* colour bar */
    el('rect',{x:34,y:300,width:120,height:8,fill:'url(#uc-grad)',stroke:'var(--fg)','stroke-width':.7},svg);
    var t1=el('text',{x:26,y:307.6,'text-anchor':'end',class:'tx'},svg); t1.textContent='weak';
    var t2=el('text',{x:162,y:307.6,'text-anchor':'start',class:'tx'},svg); t2.textContent='strong';
    lab(svg,'\\lvert\\mathbf{E}\\rvert',60).put(94,324);

    /* polar plot of |E| R^2 against the angle psi from the direction of motion */
    el('line',{x1:PCX-60,y1:PCY,x2:PCX+60,y2:PCY,class:'ax'},svg);
    el('line',{x1:PCX,y1:PCY-55,x2:PCX,y2:PCY+55,class:'ax'},svg);
    el('circle',{cx:PCX,cy:PCY,r:PR,class:'ref'},svg);
    curve=el('path',{class:'curve'},svg);
    ray=el('line',{x1:PCX,y1:PCY,class:'ray'},svg);
    pdotP=el('circle',{r:3.6,style:'fill:var(--sg-c3);stroke:var(--card);stroke-width:1.4'},svg);
    lab(svg,'x',14).put(PCX+68,PCY);
    lab(svg,'E(\\psi)',44).put(PCX-46,266);
    /* legend */
    el('line',{x1:34,y1:350,x2:62,y2:350,class:'ref'},svg);
    lab(svg,'\\beta=0',40).put(88,350);
    el('line',{x1:34,y1:368,x2:62,y2:368,style:'stroke:var(--sg-c3);stroke-width:2.2'},svg);
    lab(svg,'\\beta',20).put(78,368);

    /* grid of field vectors, one per unit length */
    vecs=[];
    var gx,gy;
    for(gy=-4.5;gy<=4.5;gy+=1){
        for(gx=-7.5;gx<=7.5;gx+=1){ vecs.push([gx,gy]); }
    }
}

function drawCurve(){
    var s=[], i, psi, f, r;
    for(i=0;i<=180;i++){
        psi=2*Math.PI*i/180;
        r=rp(fpsi(psi));
        s.push((i ? 'L' : 'M')+(PCX+r*Math.cos(psi)).toFixed(2)+','+(PCY-r*Math.sin(psi)).toFixed(2));
    }
    curve.setAttribute('d',s.join('')+'Z');
}

function drawMap(){
    var i,j,X,Y,p=0,idx,d=img.data;
    for(j=0;j<GH;j++){
        Y=YH-(j+.5)*2*YH/GH;
        for(i=0;i<GW;i++){
            X=-XH+(i+.5)*2*XH/GW;
            field(X-xq,Y);
            idx=(level(Math.sqrt(ex*ex+ey*ey))*255)|0;
            d[p]=LUT[3*idx]; d[p+1]=LUT[3*idx+1]; d[p+2]=LUT[3*idx+2]; d[p+3]=255;
            p+=4;
        }
    }
    ctx.putImageData(img,0,0);
}

function arrowPath(px,py,ux,uy,len){
    var tx0=px-ux*len/2, ty0=py-uy*len/2, tx1=px+ux*len/2, ty1=py+uy*len/2;
    var hs=Math.min(5.5,len*.42), hx=tx1-ux*hs, hy=ty1-uy*hs;
    return 'M'+tx0.toFixed(1)+','+ty0.toFixed(1)+'L'+tx1.toFixed(1)+','+ty1.toFixed(1)+
           'M'+(hx-uy*hs*.5).toFixed(1)+','+(hy+ux*hs*.5).toFixed(1)+
           'L'+tx1.toFixed(1)+','+ty1.toFixed(1)+
           'L'+(hx+uy*hs*.5).toFixed(1)+','+(hy-ux*hs*.5).toFixed(1);
}

function drawVecs(){
    var s=[], i, v, m, ux, uy;
    for(i=0;i<vecs.length;i++){
        v=vecs[i];
        field(v[0]-xq,v[1]);
        m=Math.sqrt(ex*ex+ey*ey);
        if(m<1e-9){ continue; }
        ux=ex/m; uy=-ey/m;                       /* screen y points down */
        s.push(arrowPath(MW/2+v[0]*K,CY-v[1]*K,ux,uy,(0.28+0.58*level(m))*K));
    }
    var d=s.join('');
    haloV.setAttribute('d',d);
    vecP.setAttribute('d',d);
}

/* straight field lines through the present position; equal flux between neighbours:
   rest-frame angles with equally spaced cos(theta'), then direction (cos th'/gamma, sin th') */
function drawLines(){
    var N=8, s=[], j, th, dx, dy, n, sg, cx=MW/2+xq*K, L=15*K, r0=.45*K, rc=2.7*K, c=7;
    for(j=0;j<N;j++){
        th=Math.acos(1-(2*j+1)/N);
        dx=Math.cos(th)/G; dy=Math.sin(th);
        n=Math.sqrt(dx*dx+dy*dy); dx/=n; dy/=n;
        for(sg=-1;sg<=1;sg+=2){
            var ux=dx, uy=-sg*dy;               /* screen direction */
            s.push('M'+(cx+ux*r0).toFixed(1)+','+(CY+uy*r0).toFixed(1)+'L'+(cx+ux*L).toFixed(1)+','+(CY+uy*L).toFixed(1));
            var qx=cx+ux*rc, qy=CY+uy*rc;
            s.push('M'+(qx-ux*c-uy*c*.45).toFixed(1)+','+(qy-uy*c+ux*c*.45).toFixed(1)+
                   'L'+qx.toFixed(1)+','+qy.toFixed(1)+
                   'L'+(qx-ux*c+uy*c*.45).toFixed(1)+','+(qy-uy*c-ux*c*.45).toFixed(1));
        }
    }
    var d=s.join('');
    lnH.setAttribute('d',d);
    lnW.setAttribute('d',d);
}

function drawCharge(){
    var sx=MW/2+xq*K;
    qC.setAttribute('cx',sx); qC.setAttribute('cy',CY);
    qH.setAttribute('x1',sx-3); qH.setAttribute('x2',sx+3); qH.setAttribute('y1',CY); qH.setAttribute('y2',CY);
    qV.setAttribute('x1',sx); qV.setAttribute('x2',sx); qV.setAttribute('y1',CY-3); qV.setAttribute('y2',CY+3);
    /* velocity arrow, longer for faster motion */
    var show=B>.03, vis=show ? '' : 'none';
    velL.style.display=vis; velH.style.display=vis; velLab.style.display=vis;
    if(show){
        var len=10+34*B, y=CY-15, x1=sx+len;
        velL.setAttribute('x1',sx); velL.setAttribute('x2',x1-3); velL.setAttribute('y1',y); velL.setAttribute('y2',y);
        velH.setAttribute('points',[x1,y, x1-6,y-3.4, x1-6,y+3.4].join(' '));
        velLab.put(x1+9,y-8);
    }
    /* probe: a ring of radius two units around the present position, and its point on the polar plot */
    pcirc.setAttribute('cx',sx); pcirc.setAttribute('cy',CY);
    pdot.setAttribute('cx',sx+2*K*Math.cos(probe)); pdot.setAttribute('cy',CY-2*K*Math.sin(probe));
    var r=rp(fpsi(probe)), px=PCX+r*Math.cos(probe), py=PCY-r*Math.sin(probe);
    pdotP.setAttribute('cx',px); pdotP.setAttribute('cy',py);
    ray.setAttribute('x2',px); ray.setAttribute('y2',py);
}

function render(){
    var x=xq, fade=1;
    if(B>.03 && !reduce){ fade=Math.max(0,Math.min(1,(x+9)/1)*Math.min(1,(9-x)/1)); }
    cv.style.opacity=fade; dyn.style.opacity=fade;
    if(showMap){ drawMap(); }
    if(showVec){ drawVecs(); }
    if(showLin){ drawLines(); }
    drawCharge();
}

function frame(now){
    raf=requestAnimationFrame(frame);
    var dt=Math.min(.05,(now-last)/1000);
    last=now;
    if(!playing){ return; }
    probe=(probe+dt*.9)%(2*Math.PI);
    if(B>.03){
        travel+=dt*B*VIS;
        if(travel>18){ travel-=18; }
        xq=-9+travel;
    }else{
        xq=0;
    }
    render();
}

function setPlay(on){
    playing=on;
    $('uc-play').textContent=on ? 'Pause' : 'Play';
}

function sync(){
    $('uc-wrap').className='wrap'+(showMap ? '' : ' nomap');
    cv.style.visibility=showMap ? 'visible' : 'hidden';
    haloV.style.display=showVec ? '' : 'none';
    vecP.style.display=showVec ? '' : 'none';
    lnH.style.display=showLin ? '' : 'none';
    lnW.style.display=showLin ? '' : 'none';
    $('uc-map').setAttribute('aria-current',String(showMap));
    $('uc-vec').setAttribute('aria-current',String(showVec));
    $('uc-lin').setAttribute('aria-current',String(showLin));
    drawCurve();
    $('uc-val').innerHTML=tex(B.toFixed(2));
    if(B<=.03){ xq=0; travel=9; }
    render();
}

$('uc-play').onclick=function(){ setPlay(!playing); };
$('uc-map').onclick=function(){ showMap=!showMap; sync(); };
$('uc-vec').onclick=function(){ showVec=!showVec; sync(); };
$('uc-lin').onclick=function(){ showLin=!showLin; sync(); };
$('uc-beta').oninput=function(){
    setBeta(+this.value);
    sync();
};

$('uc-lab').innerHTML=tex('v/c');

build();
setBeta(+$('uc-beta').value);
travel=9; xq=0;
sync();

if(reduce){
    xq=-2;
    setPlay(false);
    render();
}else{
    last=performance.now();
    raf=requestAnimationFrame(frame);
}

})();
</script>

@end(animation)

The important question is whether this field could carry a non-zero amount of energy to arbitrarily large distances. This is measured by the electromagnetic flux, the Poynting vector.  And it is proportional to \(\mathbf{E} \times \mathbf B\), would scale as \(1/R^4\). Consequently, the net power per unit time crossing a sphere of radius \(R\) would scale as \(1/R^2\). 

This would tend to zero as \(R \rightarrow \infty\). Thus, charges moving with constant velocity do not radiate energy. 

This, however, is not the case for accelerating charges. 

If the charge suddenly changes its velocity, it produces a disturbance in the field. 

@begin(animation, label = accelerating-charge)


<style>

.ec-anim { width: 100%; color: var(--fg); box-sizing: border-box; padding: 4px 8px 16px; }
.ec-anim figure { margin: 0; padding: 8px 4px 8px; }

.ec-anim .wrap {
    position: relative; width: 100%; max-width: 680px; aspect-ratio: 400 / 284;
    margin: 0 auto; background: var(--card); border-radius: 6px; overflow: hidden;
}
.ec-anim .wrap canvas { position: absolute; left: 0; top: 0; width: 100%; height: 88.03%; display: block; }
.ec-anim .wrap svg { position: absolute; left: 0; top: 0; width: 100%; height: 100%; display: block; }

.ec-anim .frm { fill: none; stroke: #fff; stroke-opacity: .85; stroke-width: 2.4; }
.ec-anim .wrap.nomap .frm { stroke: var(--fg); stroke-opacity: 1; }
.ec-anim .halo { fill: none; stroke: rgba(0,0,0,.55); stroke-width: 2.8; stroke-linecap: round; stroke-linejoin: round; }
.ec-anim .vec { fill: none; stroke: #fff; stroke-width: 1.15; stroke-linecap: round; stroke-linejoin: round; }
.ec-anim .wrap.nomap .halo { stroke: var(--card); }
.ec-anim .wrap.nomap .vec { stroke: var(--fg); }
.ec-anim .qring { fill: #ff4d3d; stroke: #fff; stroke-width: 1.6; }
.ec-anim .qsign { stroke: #fff; stroke-width: 1.7; stroke-linecap: round; }
.ec-anim .acc { stroke: #7fe3ff; stroke-width: 2.2; stroke-linecap: round; fill: none; }
.ec-anim .acch { fill: #7fe3ff; }
.ec-anim .tx { font-family: var(--sans); font-size: 9.5px; fill: var(--muted); }

.ec-anim .fl {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    font-size: 13px; line-height: 1; white-space: nowrap;
    font-family: var(--serif);
    color: var(--fg);
}
.ec-anim .fl .katex { font-size: 1em; }
.ec-anim .pl { color: #fff; text-shadow: 0 0 3px rgba(0,0,0,.85), 0 0 2px rgba(0,0,0,.85); }

.ec-anim .controls {
    display: flex; align-items: center; gap: 8px; flex-wrap: wrap;
    width: 100%; max-width: 680px; margin: 10px auto 0;
}

.ec-anim button {
    font-family: var(--sans); font-size: .85rem; color: var(--fg);
    background: var(--card); border: 1px solid var(--rule);
    border-radius: 8px; padding: 6px 11px; cursor: pointer; white-space: nowrap;
}
.ec-anim button:hover { border-color: var(--fg); }
.ec-anim button:focus-visible { outline: 2px solid var(--link); outline-offset: 2px; }
.ec-anim button.play { min-width: 68px; }
.ec-anim button[aria-current="true"] { background: var(--link); border-color: var(--link); color: var(--bg); }

@media (max-width: 520px) {
    .ec-anim figure { padding-left: 0; padding-right: 0; }
    .ec-anim .controls { gap: 6px; }
    .ec-anim button { font-size: .8rem; padding: 5px 9px; }
}

</style>

<div class="ec-anim">

<figure>
<div class="wrap" id="ec-wrap">
<canvas id="ec-cv" width="200" height="125"></canvas>
<svg id="ec-svg" viewBox="0 0 400 284" role="img" aria-label="Electric field of an accelerating point charge, shown as a heat map of the field strength and as field vectors"></svg>
</div>
</figure>

<div class="controls">
<button id="ec-play" class="play">Pause</button>
<button data-mode="o">Oscillate</button>
<button data-mode="k">Kick</button>
</div>

<div class="controls">
<button id="ec-map">Heat map</button>
<button id="ec-vec">Vectors</button>
<button id="ec-rad">Radiation only</button>
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

/* units: c = 1, charge q/(4 pi eps0) = 1. The charge moves along the x axis;
   the field is evaluated in the plane of the page (z = 0) from the retarded position. */
var OM=2*Math.PI/5, AO=0.55/OM;
var V=0.55, D=0.7, T1=1, T2=4, T3=5.5, T4=8.5, P=19.5;
var mode='o', radOnly=false;
var tx=0, tb=0, ta=0, ex=0, ey=0;

function S(u){ return u<=0 ? 0 : u>=1 ? 1 : u*u*(3-2*u); }
function dS(u){ return (u<=0||u>=1) ? 0 : 6*u*(1-u); }
function IS(u){ return u<=0 ? 0 : u<1 ? u*u*u-u*u*u*u/2 : u-.5; }

/* position, velocity and acceleration of the charge at time t */
function traj(t){
    if(mode==='o'){
        var ph=OM*t;
        tx=AO*Math.sin(ph);
        tb=AO*OM*Math.cos(ph);
        ta=-AO*OM*OM*Math.sin(ph);
    }else{
        t=t-P*Math.floor(t/P);
        var a1=(t-T1)/D, a2=(t-T2)/D, a3=(t-T3)/D, a4=(t-T4)/D;
        tb=V*(S(a1)-S(a2)-S(a3)+S(a4));
        ta=V/D*(dS(a1)-dS(a2)-dS(a3)+dS(a4));
        tx=V*D*(IS(a1)-IS(a2)-IS(a3)+IS(a4));
    }
}

/* Lienard-Wiechert field at (X,Y) and time t; result in ex, ey */
function field(X,Y,t){
    var i, dx, R, tau, g, kap, nx, ny, k3;
    traj(t);
    dx=X-tx; R=Math.sqrt(dx*dx+Y*Y);
    tau=t-R;
    for(i=0;i<4;i++){
        traj(tau);
        dx=X-tx; R=Math.sqrt(dx*dx+Y*Y);
        if(R<1e-3){ R=1e-3; }
        g=t-tau-R;
        kap=1-(dx/R)*tb;
        tau+=g/kap;
    }
    traj(tau);
    dx=X-tx; R=Math.sqrt(dx*dx+Y*Y);
    if(R<1e-3){ R=1e-3; }
    nx=dx/R; ny=Y/R;
    kap=1-nx*tb;
    k3=kap*kap*kap;
    /* radiation (acceleration) part: a/(kappa^3 R) (-ny^2, nx ny) */
    var rx=-ta*ny*ny/(k3*R), ry=ta*nx*ny/(k3*R);
    if(radOnly){ ex=rx; ey=ry; return; }
    /* velocity part: (n - beta)(1 - beta^2)/(kappa^3 R^2) */
    var q=(1-tb*tb)/(k3*R*R);
    ex=(nx-tb)*q+rx;
    ey=ny*q+ry;
}


/* screen geometry: 25 px per unit, the map covers x in [-8,8], y in [-5,5] */
var K=25, MW=400, MH=250, CY=125, XH=8, YH=5, GW=200, GH=125, TS=2;
var simT=0, playing=true, showMap=true, showVec=true, raf=0, last=0;
var svg, cv, ctx, img, haloP, vecP, qC, qH, qV, accL, accH, accLab, eLab, vecs=[];
var reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;

function el(t,at,par){
    var e=document.createElementNS(NS,t);
    for(var k in at){ e.setAttribute(k,at[k]); }
    if(par){ par.appendChild(e); }
    return e;
}
function tex(s){ return katex.renderToString(s,{throwOnError:false,output:'html'}); }

function lab(par,t,w,cls){
    var fo=el('foreignObject',{width:w,height:24},par);
    fo.style.overflow='visible';
    var d=document.createElement('div');
    d.className='fl'+(cls ? ' '+cls : '');
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

/* inferno-style colour map */
var STOPS=[[0,0,4],[40,11,84],[101,21,110],[159,42,99],[212,72,66],[245,125,21],[250,193,39],[252,255,164]];
var LUT=new Uint8Array(768);
(function(){
    for(var i=0;i<256;i++){
        var p=i/255*(STOPS.length-1), k=Math.min(STOPS.length-2,Math.floor(p)), f=p-k;
        for(var c=0;c<3;c++){ LUT[3*i+c]=Math.round(STOPS[k][c]+(STOPS[k+1][c]-STOPS[k][c])*f); }
    }
})();

/* log scale: weak fields at the dark end, the charge's own field at the bright end */
function level(mag){
    var v=(Math.log(mag+1e-9)*0.4342944819+1.9)/2.4;
    return v<0 ? 0 : v>1 ? 1 : v;
}

function build(){
    svg=$('ec-svg'); cv=$('ec-cv'); ctx=cv.getContext('2d');
    img=ctx.createImageData(GW,GH);
    var i, defs='<defs><linearGradient id="ec-grad" x1="0" x2="1" y1="0" y2="0">';
    for(i=0;i<STOPS.length;i++){
        defs+='<stop offset="'+(i/(STOPS.length-1))+'" stop-color="rgb('+STOPS[i].join(',')+')"/>';
    }
    svg.innerHTML=defs+'</linearGradient></defs>';

    haloP=el('path',{class:'halo'},svg);
    vecP=el('path',{class:'vec'},svg);

    el('rect',{x:0,y:0,width:MW,height:MH,class:'frm'},svg);

    /* colour bar */
    el('rect',{x:140,y:260,width:120,height:8,fill:'url(#ec-grad)',stroke:'var(--fg)','stroke-width':.7},svg);
    var t1=el('text',{x:132,y:267.6,'text-anchor':'end',class:'tx'},svg); t1.textContent='weak';
    var t2=el('text',{x:268,y:267.6,'text-anchor':'start',class:'tx'},svg); t2.textContent='strong';
    eLab=lab(svg,'\\lvert\\mathbf{E}\\rvert',60).put(200,278);

    /* acceleration arrow */
    accL=el('line',{class:'acc'},svg);
    accH=el('polygon',{class:'acch'},svg);
    accLab=lab(svg,'\\mathbf{a}',16,'pl');

    /* the charge */
    qC=el('circle',{r:6,class:'qring'},svg);
    qH=el('line',{class:'qsign'},svg);
    qV=el('line',{class:'qsign'},svg);

    /* grid of field vectors, one per unit length */
    vecs=[];
    var gx,gy;
    for(gy=-4.5;gy<=4.5;gy+=1){
        for(gx=-7.5;gx<=7.5;gx+=1){ vecs.push([gx,gy]); }
    }
}

function drawMap(){
    var i,j,X,Y,p=0,idx,d=img.data;
    for(j=0;j<GH;j++){
        Y=YH-(j+.5)*2*YH/GH;
        for(i=0;i<GW;i++){
            X=-XH+(i+.5)*2*XH/GW;
            field(X,Y,simT);
            idx=(level(Math.sqrt(ex*ex+ey*ey))*255)|0;
            d[p]=LUT[3*idx]; d[p+1]=LUT[3*idx+1]; d[p+2]=LUT[3*idx+2]; d[p+3]=255;
            p+=4;
        }
    }
    ctx.putImageData(img,0,0);
}

function drawVecs(){
    var s=[], i, v, px, py, m, len, ux, uy, hx, hy, tx0, ty0, tx1, ty1, hs;
    for(i=0;i<vecs.length;i++){
        v=vecs[i];
        field(v[0],v[1],simT);
        m=Math.sqrt(ex*ex+ey*ey);
        if(m<1e-9){ continue; }
        ux=ex/m; uy=-ey/m;                      /* screen y points down */
        len=(0.28+0.58*level(m))*K;             /* length in px encodes strength */
        px=MW/2+v[0]*K; py=CY-v[1]*K;
        tx0=px-ux*len/2; ty0=py-uy*len/2;
        tx1=px+ux*len/2; ty1=py+uy*len/2;
        hs=Math.min(5.5,len*.42);
        hx=tx1-ux*hs; hy=ty1-uy*hs;
        s.push('M'+tx0.toFixed(1)+','+ty0.toFixed(1)+'L'+tx1.toFixed(1)+','+ty1.toFixed(1)+
               'M'+(hx-uy*hs*.5).toFixed(1)+','+(hy+ux*hs*.5).toFixed(1)+
               'L'+tx1.toFixed(1)+','+ty1.toFixed(1)+
               'L'+(hx+uy*hs*.5).toFixed(1)+','+(hy-ux*hs*.5).toFixed(1));
    }
    var d=s.join('');
    haloP.setAttribute('d',d);
    vecP.setAttribute('d',d);
}

function drawCharge(){
    traj(simT);
    var sx=MW/2+tx*K;
    qC.setAttribute('cx',sx); qC.setAttribute('cy',CY);
    qH.setAttribute('x1',sx-3); qH.setAttribute('x2',sx+3); qH.setAttribute('y1',CY); qH.setAttribute('y2',CY);
    qV.setAttribute('x1',sx); qV.setAttribute('x2',sx); qV.setAttribute('y1',CY-3); qV.setAttribute('y2',CY+3);
    var a=ta, show=Math.abs(a)>.03;
    var vis=show ? '' : 'none';
    accL.style.display=vis; accH.style.display=vis; accLab.style.display=vis;
    if(show){
        var dir=a>0 ? 1 : -1, len=10+30*Math.min(1,Math.abs(a)/.6), y=CY-15;
        var x1=sx+dir*len;
        accL.setAttribute('x1',sx); accL.setAttribute('x2',x1-dir*3); accL.setAttribute('y1',y); accL.setAttribute('y2',y);
        accH.setAttribute('points',[x1,y, x1-dir*6,y-3.4, x1-dir*6,y+3.4].join(' '));
        accLab.put(x1+dir*9,y-8);
    }
}

function render(){
    if(showMap){ drawMap(); }
    if(showVec){ drawVecs(); }
    drawCharge();
}

function frame(now){
    raf=requestAnimationFrame(frame);
    var dt=Math.min(.05,(now-last)/1000);
    last=now;
    if(!playing){ return; }
    simT+=dt*TS;
    simT=mode==='o' ? simT%(2*Math.PI/OM) : simT%P;
    render();
}

function setPlay(on){
    playing=on;
    $('ec-play').textContent=on ? 'Pause' : 'Play';
}

function sync(){
    $('ec-wrap').className='wrap'+(showMap ? '' : ' nomap');
    cv.style.visibility=showMap ? 'visible' : 'hidden';
    haloP.style.display=showVec ? '' : 'none';
    vecP.style.display=showVec ? '' : 'none';
    $('ec-map').setAttribute('aria-current',String(showMap));
    $('ec-vec').setAttribute('aria-current',String(showVec));
    $('ec-rad').setAttribute('aria-current',String(radOnly));
    document.querySelectorAll('.ec-anim button[data-mode]').forEach(function(bt){
        bt.setAttribute('aria-current',String(bt.getAttribute('data-mode')===mode));
    });
    eLab.set(radOnly ? '\\lvert\\mathbf{E}_{\\mathrm{rad}}\\rvert' : '\\lvert\\mathbf{E}\\rvert');
    render();
}

$('ec-play').onclick=function(){ setPlay(!playing); };
$('ec-map').onclick=function(){ showMap=!showMap; sync(); };
$('ec-vec').onclick=function(){ showVec=!showVec; sync(); };
$('ec-rad').onclick=function(){ radOnly=!radOnly; sync(); };
document.querySelectorAll('.ec-anim button[data-mode]').forEach(function(bt){
    bt.onclick=function(){
        mode=bt.getAttribute('data-mode');
        simT=0;
        sync();
    };
});

build();
sync();

if(reduce){
    simT=3.1;
    setPlay(false);
    render();
}else{
    last=performance.now();
    raf=requestAnimationFrame(frame);
}

})();
</script>

@end(animation)

This disturbance scales as \(1/R\) (as we will soon see), so that the Poynting vector due to this disturbance scales as \(1/R^2\). Consequently, the power crossing a sphere can remain finite and nonzero as its radius tends to infinity. This is the essential feature of @bold{radiation}.