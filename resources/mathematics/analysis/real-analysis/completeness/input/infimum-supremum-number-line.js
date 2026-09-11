(() => {
const canvas=document.getElementById("infimum-supremum-number-line"); if(!canvas)return;
const ctx=canvas.getContext("2d"), figure=canvas.closest("figure")||canvas.parentElement;
figure.style.position="relative";
const overlay=document.createElement("div");Object.assign(overlay.style,{position:"absolute",inset:"0",pointerEvents:"none"});figure.appendChild(overlay);
function label(html,x,y,opt={}){const e=document.createElement("div");e.innerHTML=html;Object.assign(e.style,{position:"absolute",left:x+"px",top:y+"px",transform:"translateX(-50%)",textAlign:"center",whiteSpace:opt.wrap?"normal":"nowrap",fontSize:opt.size||"18px",color:opt.color||"#273247",lineHeight:"1.3"});if(opt.width)e.style.width=opt.width+"px";overlay.appendChild(e);}
function typeset(){if(window.MathJax&&MathJax.typesetPromise)MathJax.typesetPromise([overlay]);}
function draw(){
 const dpr=devicePixelRatio||1,w=canvas.clientWidth,h=canvas.clientHeight;canvas.width=w*dpr;canvas.height=h*dpr;ctx.setTransform(dpr,0,0,dpr,0,0);
 const min=-2.5,max=3.5,y=150,L=45,R=w-45,s=Math.SQRT2,x=v=>L+(v-min)/(max-min)*(R-L),ix=x(-s),sx=x(s);
 ctx.clearRect(0,0,w,h);ctx.lineWidth=2;ctx.lineCap="round";ctx.fillStyle="rgba(47,150,114,.18)";ctx.fillRect(ix,y-18,sx-ix,36);
 ctx.strokeStyle=ctx.fillStyle="#273247";ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(R,y);ctx.stroke();
 ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(L+10,y-6);ctx.lineTo(L+10,y+6);ctx.closePath();ctx.fill();ctx.beginPath();ctx.moveTo(R,y);ctx.lineTo(R-10,y-6);ctx.lineTo(R-10,y+6);ctx.closePath();ctx.fill();
 for(let n=-2;n<=3;n++){const px=x(n);ctx.beginPath();ctx.moveTo(px,y-8);ctx.lineTo(px,y+8);ctx.stroke();}
 ctx.fillStyle="#C44E52";ctx.beginPath();ctx.arc(sx,y,7,0,2*Math.PI);ctx.fill();
 const hs=8,st=y-10;ctx.strokeStyle=ctx.fillStyle="#C44E52";ctx.beginPath();ctx.moveTo(sx,85);ctx.lineTo(sx,st);ctx.stroke();ctx.beginPath();ctx.moveTo(sx,st);ctx.lineTo(sx-hs,st-hs);ctx.lineTo(sx+hs,st-hs);ctx.closePath();ctx.fill();
 const it=y+10;ctx.strokeStyle=ctx.fillStyle="#4575B4";ctx.beginPath();ctx.moveTo(ix,245);ctx.lineTo(ix,it);ctx.stroke();ctx.beginPath();ctx.moveTo(ix,it);ctx.lineTo(ix-hs,it+hs);ctx.lineTo(ix+hs,it+hs);ctx.closePath();ctx.fill();
 overlay.innerHTML="";
 for(let n=-2;n<=3;n++)label("\\("+n+"\\)",x(n),y+19);
 label("\\(\\sqrt{2}=\\sup(A)\\)",sx,58,{color:"#C44E52"});
 label("\\(\\inf A=-\\sqrt{2}\\)",ix,275,{color:"#4575B4"});
 label("Figure: The infimum and supremum of the set \\(A=\\{x:x^2<2\\}\\).",w/2,h-28,{size:"16px",width:w-30,wrap:true});
 typeset();
}
draw();addEventListener("resize",draw);addEventListener("load",typeset,{once:true});
})();