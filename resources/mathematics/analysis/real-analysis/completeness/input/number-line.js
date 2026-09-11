(() => {
const canvas=document.getElementById("upper-bound-number-line"); if(!canvas)return;
const ctx=canvas.getContext("2d"), figure=canvas.closest("figure")||canvas.parentElement;
figure.style.position="relative";
const overlay=document.createElement("div"); Object.assign(overlay.style,{position:"absolute",inset:"0",pointerEvents:"none"}); figure.appendChild(overlay);
function label(html,x,y,opt={}){const e=document.createElement("div");e.innerHTML=html;Object.assign(e.style,{position:"absolute",left:x+"px",top:y+"px",transform:"translateX(-50%)",textAlign:"center",whiteSpace:opt.wrap?"normal":"nowrap",fontSize:opt.size||"18px",color:"#273247",lineHeight:"1.3"});if(opt.width)e.style.width=opt.width+"px";overlay.appendChild(e);}
function typeset(){if(window.MathJax&&MathJax.typesetPromise)MathJax.typesetPromise([overlay]);}
function draw(){
 const dpr=devicePixelRatio||1,w=canvas.clientWidth,h=canvas.clientHeight;canvas.width=w*dpr;canvas.height=h*dpr;ctx.setTransform(dpr,0,0,dpr,0,0);
 const min=-1.5,max=4.5,y=130,L=45,R=w-45,x=v=>L+(v-min)/(max-min)*(R-L);
 ctx.clearRect(0,0,w,h);ctx.strokeStyle=ctx.fillStyle="#273247";ctx.lineWidth=2;ctx.lineCap="round";
 ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(R,y);ctx.stroke();
 ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(L+9,y-6);ctx.lineTo(L+9,y+6);ctx.closePath();ctx.fill();
 ctx.beginPath();ctx.moveTo(R,y);ctx.lineTo(R-9,y-6);ctx.lineTo(R-9,y+6);ctx.closePath();ctx.fill();
 for(let n=-1;n<=4;n++){const px=x(n);ctx.beginPath();ctx.moveTo(px,y-7);ctx.lineTo(px,y+7);ctx.stroke();}
 for(let n=1;n<=3;n++){ctx.beginPath();ctx.arc(x(n),y,6,0,2*Math.PI);ctx.fill();}
 const bx=x(4),tip=y-10;ctx.beginPath();ctx.moveTo(bx,85);ctx.lineTo(bx,tip);ctx.stroke();ctx.beginPath();ctx.moveTo(bx,tip);ctx.lineTo(bx-7,tip-10);ctx.lineTo(bx+7,tip-10);ctx.closePath();ctx.fill();
 overlay.innerHTML="";
 [1,2,3].forEach(n=>label("\\("+n+"\\)",x(n),y+18));
 label("an upper bound for \\(A\\): \\(b=4\\)",bx,58);
 label("Figure: For the set \\(A=\\{1,2,3\\}\\), \\(b=4\\) is an upper bound. Note that \\(5,10,\\ldots\\) are also upper bounds.",w/2,h-49,{size:"16px",width:w-30,wrap:true});
 typeset();
}
draw();addEventListener("resize",draw);addEventListener("load",typeset,{once:true});
})();