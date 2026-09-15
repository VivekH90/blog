@documenttitle{Mathematics, banner = https://raw.githubusercontent.com/VivekH90/mushrooms/master/resources/mathout/complex_analysis/lvl_one/complex_integration_basics/input/mushroom.png}

@button{Home, href = /, color = #111111}
@button{Archives, href = /archives, color = #4f6fd8}
@button{GitHub, href = https://github.com/VivekH90/blog, color = #4f9d69}

@title{Complex Integration}

@section{Fundamentals, color = #d21683, label = fundamentals}

@subsection{Arc Length and Contour Integrals, label = arc-length-contour-integrals}

@definition{Parametric Curves, label = parametric-curves}
A curve in the complex plane is a continuous map \(z:\mathbb{R}\to\mathbb{C}\) given by
\[
z(t)=x(t)+iy(t).
\]
This is referred to as a parametric curve.

@remark{Reparametrization, label = reparametrization}
We can reparameterize a curve without changing its underlying geometric path. Let \(t=\phi(\tau)\), where \(\phi'(\tau)>0\). If the original curve is \(z(t)\), the new curve \(Z(\tau)\) is
\[
Z(\tau)=z(\phi(\tau)).
\]
Since \(\phi'(\tau)>0\), the reparametrization preserves the orientation of the curve.

@definition{Arc Length of a Smooth Curve, label = arc-length}
A curve is smooth if its derivative \(z'(t)\) exists, is continuous, and satisfies \(z'(t)\neq0\) for all \(t\). For such a curve, the arc length \(L\) from \(t=a\) to \(t=b\) is
\[
L=\int_a^b |z'(t)|\,dt.
\]
The unit tangent vector along the curve is
\[
T=\frac{z'(t)}{|z'(t)|}.
\]

@definition{Contour Integral, label = contour-integral}
Given a contour \(C\) parameterized by \(z(t)\) for \(t\in[a,b]\), the line integral of a complex function \(f(z)\) along \(C\) is defined by
\[
\int_C f(z)\,dz=\int_a^b f(z(t))z'(t)\,dt.
\]

@lemma{Triangle Inequality for Integrals, label = triangle-inequality}
For any integrable function \(w(t)\),
\[
\left|\int_a^b w(t)\,dt\right|\leq\int_a^b |w(t)|\,dt.
\]

@proof{}
Suppose the complex integral has magnitude \(\rho_0\) and phase \(\theta_0\), so that
\[
\int_a^b w(t)\,dt=\rho_0e^{i\theta_0}.
\]
Multiplying by \(e^{-i\theta_0}\) gives
\[
\rho_0=\int_a^b w(t)e^{-i\theta_0}\,dt.
\]
Taking real parts,
\[
\rho_0=\int_a^b\operatorname{Re}\!\left(w(t)e^{-i\theta_0}\right)dt.
\]
Since the real part of a complex number is bounded above by its modulus,
\[
\rho_0\leq\int_a^b\left|w(t)e^{-i\theta_0}\right|dt=\int_a^b|w(t)|\,dt.
\]

@theorem{The ML Inequality, label = ml-inequality}
Let \(C\) be a contour of length \(L\). If \(|f(z)|\leq M\) for all \(z\) on \(C\), then
\[
\left|\int_C f(z)\,dz\right|\leq ML.
\]

@proof{}
Expanding the contour integral using a parametrization \(z=z(t)\),
\[
\left|\int_C f(z)\,dz\right|=\left|\int_a^b f(z(t))z'(t)\,dt\right|.
\]
Applying the triangle inequality,
\[
\left|\int_a^b f(z(t))z'(t)\,dt\right|\leq\int_a^b|f(z(t))|\,|z'(t)|\,dt.
\]
Because \(|f(z)|\leq M\) on \(C\),
\[
\int_a^b|f(z(t))|\,|z'(t)|\,dt\leq M\int_a^b|z'(t)|\,dt=ML.
\]

@subsection{Cauchy-Goursat Theorem, label = cauchy-goursat}

@definition{Anti-derivative, label = antiderivative}
A function \(F(z)\) is called an anti-derivative of \(f(z)\) on a domain \(D\) if
\[
F'(z)=f(z),\qquad\forall z\in D.
\]

@theorem{Fundamental Theorem for Complex Line Integrals, label = fundamental-line-integral}
Let \(f(z)\) be continuous on a domain \(D\). If \(f(z)\) possesses an anti-derivative \(F(z)\) on \(D\), then for any contour \(C\) connecting \(z_1\) to \(z_2\),
\[
\int_{z_1}^{z_2}f(z)\,dz=F(z_2)-F(z_1).
\]
In particular, for any closed contour \(C\),
\[
\oint_C f(z)\,dz=0.
\]
The theorem does not assert that an anti-derivative always exists. It states what the integral becomes when one does exist.

@definition{Simply Connected and Multiply Connected Domains, label = connectivity}
A domain \(D\) is simply connected if every simple closed contour \(C\subset D\) encloses a region that lies entirely within \(D\). Informally, there are no holes. A domain is multiply connected if this property fails, so the domain contains holes that contours cannot shrink across.

@image{src = https://raw.githubusercontent.com/VivekH90/mushrooms/master/resources/mathout/complex_analysis/lvl_one/complex_integration_basics/input/simply_connected.png, alt = Diagram of a simply connected region, caption = Simply connected region, label = simply-connected-figure}

@image{src = https://raw.githubusercontent.com/VivekH90/mushrooms/master/resources/mathout/complex_analysis/lvl_one/complex_integration_basics/input/multiply_connected.png, alt = Diagram of a multiply connected region, caption = Multiply connected region, label = multiply-connected-figure}

@theorem{Cauchy-Goursat Theorem, label = cauchy-goursat-theorem}
Let \(D\) be a simply connected domain. If \(f(z)\) is analytic on \(D\), then for any simple closed contour \(C\subset D\),
\[
\oint_C f(z)\,dz=0.
\]

@proof{}
Write \(f(z)=u(x,y)+iv(x,y)\) and split the contour integral into real and imaginary parts:
\[
\oint_C f(z)\,dz=\oint_C(u\,dx-v\,dy)+i\oint_C(v\,dx+u\,dy).
\]
Since \(f\) is analytic, the Cauchy-Riemann equations give
\[
u_x=v_y,\qquad u_y=-v_x.
\]
Thus the relevant differential forms have matching mixed partials. For example,
\[
\frac{\partial u}{\partial y}=u_y=-v_x=\frac{\partial(-v)}{\partial x}.
\]
The simply connected hypothesis is essential when passing from these local differential conditions to global exactness.

The Cauchy-Goursat theorem is closely tied to the existence of anti-derivatives on simply connected domains.

@theorem{Deformation of Contours, label = deformation-of-contours}
Suppose \(C\) is a simple closed contour containing disjoint simple closed contours \(C_1,\ldots,C_n\) in its interior. If \(f(z)\) is analytic on the region between \(C\) and the inner contours, then
\[
\oint_C f(z)\,dz+\sum_{k=1}^n\oint_{C_k}f(z)\,dz=0.
\]

@image{src = https://raw.githubusercontent.com/VivekH90/mushrooms/master/resources/mathout/complex_analysis/lvl_one/complex_integration_basics/input/cauchy1.png, alt = Contour surrounding a hole in the domain, caption = We wish to evaluate the integral around a contour that contains a hole of the domain., label = cauchy1}

@image{src = https://raw.githubusercontent.com/VivekH90/mushrooms/master/resources/mathout/complex_analysis/lvl_one/complex_integration_basics/input/cauchy2.png, alt = Decomposition of a contour into smaller contours, caption = The contour is decomposed into pieces that avoid holes in their respective subdomains., label = cauchy2}

@corollary{Topological Invariance, label = topological-invariance}
If \(C_1\) and \(C_2\) are positively oriented simple closed contours, with \(C_1\) entirely inside \(C_2\), then for an analytic function \(f(z)\),
\[
\oint_{C_2}f(z)\,dz=\oint_{C_1}f(z)\,dz.
\]
Thus contour integrals are invariant under continuous deformations through regions of analyticity, provided no singularity is crossed.

The Fundamental Theorem for complex line integrals does not generally hold in multiply connected domains. The value of an integral may depend on the topology of the domain and on whether the contour encloses singularities.

@subsection{Cauchy Integral Formula, label = cauchy-integral-formula}

@example{The Fundamental Integral, label = fundamental-integral}
Consider
\[
\oint_C\frac{1}{z}\,dz
\]
around a positively oriented simple closed curve enclosing the origin. By topological invariance, shrink \(C\) to a small circle \(C_\epsilon\) of radius \(\epsilon\) centered at the origin. Parameterize it by \(z=\epsilon e^{i\theta}\), \(0\leq\theta\leq2\pi\), so that \(dz=i\epsilon e^{i\theta}d\theta\). Then
\[
\oint_C\frac{dz}{z}=\oint_{C_\epsilon}\frac{dz}{z}=\int_0^{2\pi}\frac{i\epsilon e^{i\theta}}{\epsilon e^{i\theta}}\,d\theta=\int_0^{2\pi}i\,d\theta=2\pi i.
\]
This calculation is the basic model for the Cauchy integral formula.

@theorem{Cauchy's Integral Formula, label = cauchys-integral-formula}
Let \(D\) be a simply connected domain. Suppose \(f(z)\) is analytic on \(D\), and let \(C\subset D\) be a positively oriented simple closed contour. For any point \(z_0\) strictly inside \(C\),
\[
f(z_0)=\frac{1}{2\pi i}\oint_C\frac{f(z)}{z-z_0}\,dz.
\]

@proof{}
We isolate \(f(z_0)\) by considering
\[
k=\oint_C\frac{f(z)}{z-z_0}\,dz-f(z_0)\oint_C\frac{dz}{z-z_0}.
\]
Since
\[
\oint_C\frac{dz}{z-z_0}=2\pi i,
\]
we obtain
\[
k=\oint_C\frac{f(z)-f(z_0)}{z-z_0}\,dz.
\]
Let \(C_1\) be a small circle of radius \(r\) centered at \(z_0\). By continuity of \(f\), for every \(\epsilon>0\) we can choose \(r\) small enough that \(|f(z)-f(z_0)|<\epsilon\) on \(C_1\). Hence, by the ML inequality,
\[
|k|\leq\oint_{C_1}\frac{|f(z)-f(z_0)|}{|z-z_0|}|dz|<\frac{\epsilon}{r}\oint_{C_1}|dz|.
\]
The circumference of \(C_1\) is \(2\pi r\), so
\[
|k|<2\pi\epsilon.
\]
As \(\epsilon\) is arbitrary, \(k=0\). Therefore
\[
\oint_C\frac{f(z)}{z-z_0}\,dz=2\pi i f(z_0),
\]
which yields the formula.

@theorem{Cauchy's Integral Formula for Derivatives, label = cauchys-derivatives}
By differentiating under the integral sign, the \(n\)-th derivative satisfies
\[
\oint_C\frac{f(z)}{(z-z_0)^{n+1}}\,dz=\frac{2\pi i}{n!}f^{(n)}(z_0).
\]
This may also be established by induction on \(n\). In particular, analyticity is inherited by the derivatives.

@theorem{Cauchy's Estimate, label = cauchys-estimate}
Let \(f\) be analytic inside a circle \(C_R\) of radius \(R\) centered at \(z_0\). If \(M_R\) is the maximum value of \(|f(z)|\) on \(C_R\), then
\[
|f^{(n)}(z_0)|\leq\frac{n!M_R}{R^n}.
\]

@proof{}
Starting from the derivative formula,
\[
f^{(n)}(z_0)=\frac{n!}{2\pi i}\oint_{C_R}\frac{f(z)}{(z-z_0)^{n+1}}\,dz.
\]
Taking moduli and applying the ML inequality,
\[
|f^{(n)}(z_0)|\leq\frac{n!}{2\pi}\oint_{C_R}\left|\frac{f(z)}{(z-z_0)^{n+1}}\right||dz|.
\]
On \(C_R\), we have \(|f(z)|\leq M_R\) and \(|z-z_0|=R\), while the circumference is \(2\pi R\). Thus
\[
|f^{(n)}(z_0)|\leq\frac{n!}{2\pi}\frac{M_R}{R^{n+1}}(2\pi R)=\frac{n!M_R}{R^n}.
\]

@section{Problem Solving, color = #b22626, label = problem-solving}

@theorem{Liouville's Theorem, label = liouvilles-theorem}
If \(f\) is entire and bounded, so that \(|f(z)|\leq M\) for all \(z\in\mathbb{C}\), then \(f\) is constant.

@proof{}
By Cauchy's estimate with \(n=1\), applied on a circle of radius \(R\) centered at an arbitrary point \(z\),
\[
|f'(z)|\leq\frac{M}{R}.
\]
Because \(f\) is entire, \(R\) can be arbitrarily large. Letting \(R\to\infty\),
\[
|f'(z)|\leq\lim_{R\to\infty}\frac{M}{R}=0.
\]
Therefore \(f'(z)=0\) everywhere, and hence \(f\) is constant.

@theorem{Morera's Theorem, label = moreras-theorem}
Let \(f\) be continuous on a domain \(D\). If
\[
\oint_C f(z)\,dz=0
\]
for every closed contour \(C\subset D\), then \(f\) is analytic throughout \(D\).

@theorem{Complex Representation of Area, label = complex-area}
Let \(C\) be a positively oriented simple closed contour. The area enclosed by \(C\) is
\[
\operatorname{Area}=\frac{1}{2i}\oint_C\overline{z}\,dz.
\]

@proof{}
Write \(\overline{z}=x-iy\) and \(dz=dx+i\,dy\). Then
\[
\frac{1}{2i}\oint_C(x-iy)(dx+i\,dy)=\frac{1}{2i}\left[\oint_C(x\,dx+y\,dy)+i\oint_C(x\,dy-y\,dx)\right].
\]
The first term is an exact differential and integrates to zero around a closed contour. Hence
\[
\frac{1}{2i}\left[0+i\oint_C(x\,dy-y\,dx)\right]=\frac12\oint_C(x\,dy-y\,dx).
\]
Green's theorem identifies the remaining integral with the enclosed area.

@subsection{Constructions, label = constructions}

@theorem{Fundamental Theorem of Algebra, label = fundamental-theorem-algebra}
Every non-constant polynomial \(P(z)\) of degree \(n\geq1\),
\[
P(z)=a_nz^n+a_{n-1}z^{n-1}+\cdots+a_1z+a_0,
\]
has at least one complex root \(z_0\) such that \(P(z_0)=0\).

@remark{Strategy}
A useful construction is
\[
f(z)=\frac{1}{P(z)}.
\]
Assuming that \(P\) never vanishes makes \(f\) entire, after which Liouville's theorem can be used to obtain a contradiction.

@proof{}
Assume that \(P\) has no roots. Then \(f(z)=1/P(z)\) is entire. For sufficiently large \(|z|\), the leading term dominates, so \(|P(z)|\to\infty\) and consequently \(|f(z)|\to0\). Thus there is an \(R>0\) such that \(|f(z)|<1\) for \(|z|>R\).

On the compact disk \(|z|\leq R\), the function \(f\) is continuous, so it attains a finite maximum \(M_0\). Hence \(f\) is bounded on all of \(\mathbb{C}\). Liouville's theorem forces \(f\) to be constant, so \(P\) must be constant, contradicting \(\deg P\geq1\). Therefore \(P\) has a complex root.

@corollary{Fundamental Theorem of Algebra, label = fundamental-algebra-counting}
A polynomial of degree \(n\geq1\) has exactly \(n\) complex roots, counted with multiplicity.

@proof{}
Proceed by induction on \(n\). By the existence part of the fundamental theorem of algebra, choose a root \(z_0\) of \(P\). Then
\[
P(z)-P(z_0)=(z-z_0)Q(z),
\]
where \(Q\) is a polynomial of degree \(n-1\). Since \(P(z_0)=0\),
\[
P(z)=(z-z_0)Q(z).
\]
By the induction hypothesis, \(Q\) has exactly \(n-1\) roots counted with multiplicity. Together with \(z_0\), this gives exactly \(n\) roots for \(P\).

@theorem{Minimum Modulus Principle, label = minimum-modulus}
Let \(f(z)\) be continuous on a closed bounded region \(R\), analytic and non-constant in its interior, and suppose \(f(z)\neq0\) on \(R\). Then \(|f(z)|\) attains its minimum value on the boundary of \(R\), not in the interior.

@remark{Strategy}
Construct
\[
g(z)=\frac{1}{f(z)}
\]
and apply the maximum-modulus principle to \(g\).

@proof{}
Suppose \(|f(z)|\) attains its minimum in the interior at \(z_0\), with \(m=|f(z_0)|\). Then
\[
|g(z)|=\frac{1}{|f(z)|}\leq\frac1m=|g(z_0)|,
\]
so \(|g|\) has an interior maximum. The maximum-modulus principle forces \(g\), and hence \(f\), to be constant, contradicting the hypothesis. Therefore the minimum occurs on the boundary.

@theorem{Boundary Minima of Harmonic Components, label = harmonic-boundary}
Let \(f(z)=u(x,y)+iv(x,y)\) be continuous on a closed bounded region \(R\), analytic and non-constant in its interior. Then both \(u\) and \(v\) attain their minima and maxima on the boundary of \(R\), never at an interior extremum.

@remark{Strategy}
The standard constructions are
\[
g(z)=e^{-f(z)},\qquad e^{if(z)},\qquad e^{f(z)},\qquad e^{-if(z)},
\]
chosen according to which component and which extremum is being studied.

@proof{}
For example, suppose \(u\) has an interior minimum at \(z_0\). For \(g(z)=e^{-f(z)}\),
\[
|g(z)|=e^{-u(x,y)}.
\]
A minimum of \(u\) is therefore a maximum of \(|g|\). By the maximum-modulus principle, \(g\) is constant, forcing \(f\) to be constant, a contradiction. The other cases follow by choosing the corresponding exponential construction.

@relatedlinks{Mark Two, href = https://github.com/VivekH90/mark-two}
@relatedlinks{Source notes, href = https://github.com/VivekH90/mushrooms/tree/master/resources/mathout/complex_analysis/lvl_one/complex_integration_basics}
