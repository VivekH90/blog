@documenttitle{Physics, banner = background.png}

@author{Author}

@button{Home, href = /, color = #5b3a8a}
@button{Archives, href = /archives, color = #7652a8}
@button{GitHub, href = https://github.com/VivekH90/blog, color = #70458f}

@title{Electromagnetic Lagrangian}
@gallery{
    source = NASA,
    query = black hole,
    count = 7
}

@tags{Electromagnetism, Classical Field Theory, Lagrangian Mechanics}

@section{Lagrange's equation for a single variable, label = single-variable}

@begin(axiom = Principle of Least Action, label = least-action)
The physical trajectory of a system between two fixed endpoints is the path for which the action is stationary,

\[
\delta S = 0.
\]

where the action is defined by

\[
S[q] = \int_{t_1}^{t_2} L(q,\dot q,t)\,dt.
\]
And from the principle of least action, the equation of motion are given by:
\[
\frac{d}{dt}
\left(
\frac{\partial L}{\partial \dot q}
\right)
-
\frac{\partial L}{\partial q}
=0.
\]

@end(axiom)

@image{src = input/least-action.png, alt = least-action, caption = , label = least action, width = 60%, height = auto}

@begin(proof)
Under the variation

\[
q(t)\rightarrow q(t)+\delta q(t),
\]

the action changes by

\[
\delta S
=
\int_{t_1}^{t_2}
\left(
\frac{\partial L}{\partial q}\,\delta q
+
\frac{\partial L}{\partial \dot q}\,\delta\dot q
\right)dt.
\]

Since variation and differentiation commute,

\[
\delta\dot q
=
\frac{d}{dt}(\delta q).
\]

Therefore,

\[
\delta S
=
\int_{t_1}^{t_2}
\left[
\frac{\partial L}{\partial q}\,\delta q
+
\frac{\partial L}{\partial \dot q}
\frac{d}{dt}(\delta q)
\right]dt.
\]

Integrating the second term by parts gives

\[
\delta S
=
\int_{t_1}^{t_2}
\left[
\frac{\partial L}{\partial q}
-
\frac{d}{dt}
\left(
\frac{\partial L}{\partial \dot q}
\right)
\right]\delta q\,dt
+
\left[
\frac{\partial L}{\partial \dot q}\,\delta q
\right]_{t_1}^{t_2}.
\]

Because the endpoint variations vanish,

\[
\delta q(t_1)=\delta q(t_2)=0,
\]

the boundary term is zero. The remaining variation must vanish for arbitrary \(\delta q(t)\), so the coefficient of \(\delta q\) must vanish:

\[
\frac{\partial L}{\partial q}
-
\frac{d}{dt}
\left(
\frac{\partial L}{\partial \dot q}
\right)
=0.
\]

Hence the @bold{Euler-Lagrange equation} is

\[
\frac{d}{dt}
\left(
\frac{\partial L}{\partial \dot q}
\right)
-
\frac{\partial L}{\partial q}
=0.
\]

@end(proof)

@section{Lagrange's equation for multiple variables, label = multiple-variables}

@begin(theorem = Theorem Title, label = theorem-label)
The single-variable Euler-Lagrange equation can be extended naturally when the Lagrangian depends on several independent dynamical variables. Consider two @bold{independent fields} \(u(x,y)\) and \(v(x,y)\), with the action

\[
S[u,v]
=
\int_G
L(u,v,u_x,u_y,v_x,v_y)\,dx\,dy,
\]

where

\[
u_x=\frac{\partial u}{\partial x},
\qquad
u_y=\frac{\partial u}{\partial y},
\qquad
v_x=\frac{\partial v}{\partial x},
\qquad
v_y=\frac{\partial v}{\partial y}.
\]
and the @bold{Euler-Lagrange} equation are given by:

@begin(proof)
Consider the variations

\[
u\rightarrow u+\delta u,
\qquad
v\rightarrow v+\delta v.
\]

The variation of the action is

\[
\delta S
=
\int_G
\left[
\frac{\partial L}{\partial u}\,\delta u
+
\frac{\partial L}{\partial v}\,\delta v
+
\frac{\partial L}{\partial u_x}\,\delta u_x
+
\frac{\partial L}{\partial u_y}\,\delta u_y
+
\frac{\partial L}{\partial v_x}\,\delta v_x
+
\frac{\partial L}{\partial v_y}\,\delta v_y
\right]dx\,dy.
\]

 Assuming that the variations vanish on the boundary of \(G\), all boundary terms disappear. The variation becomes

\[
\delta S
=
\int_G
\left[
\frac{\partial L}{\partial u}
-
\frac{\partial}{\partial x}
\left(
\frac{\partial L}{\partial u_x}
\right)
-
\frac{\partial}{\partial y}
\left(
\frac{\partial L}{\partial u_y}
\right)
\right]\delta u\,dx\,dy
\]

\[
+
\int_G
\left[
\frac{\partial L}{\partial v}
-
\frac{\partial}{\partial x}
\left(
\frac{\partial L}{\partial v_x}
\right)
-
\frac{\partial}{\partial y}
\left(
\frac{\partial L}{\partial v_y}
\right)
\right]\delta v\,dx\,dy.
\]

Because \(\delta u\) and \(\delta v\) are independent and arbitrary in the interior of \(G\), each coefficient must vanish separately. We therefore obtain two Euler-Lagrange equations:

\[
\frac{\partial L}{\partial u}
-
\frac{\partial}{\partial x}
\left(
\frac{\partial L}{\partial u_x}
\right)
-
\frac{\partial}{\partial y}
\left(
\frac{\partial L}{\partial u_y}
\right)
=0,
\]

and

\[
\frac{\partial L}{\partial v}
-
\frac{\partial}{\partial x}
\left(
\frac{\partial L}{\partial v_x}
\right)
-
\frac{\partial}{\partial y}
\left(
\frac{\partial L}{\partial v_y}
\right)
=0.
\]

Thus, @bold{each independent field contributes its own Euler-Lagrange equation}. This is the key step toward electromagnetism: the electromagnetic potential will be treated as a collection of field components, each of which is varied independently.

@end(proof)

@end(theorem)

@subsection{The 4-vector generalization, label = four-vector-generalization}

@begin(corollary = 4-vector generalization)
Let the dynamical field be a vector \(a^\mu(x)\), with spacetime coordinates \(x^\nu\). Consider the action (note that Einstein-convention is implied everywhere)

\[
S[a]
=
\int_G
L\left(a^\mu,\partial_\nu a^\mu,x\right)\,d^4x.
\]
The Euler-Lagrange equations are given by:
\[
\frac{\partial L}{\partial a^\mu}
-
\partial_\nu
\left(
\frac{\partial L}{\partial(\partial_\nu a^\mu)}
\right)
=0.
\]

@begin(proof)
We vary the vector field according to

\[
a^\mu\rightarrow a^\mu+\delta a^\mu.
\]

The variation of the action is therefore

\[
\delta S
=
\int_G
\left[
\frac{\partial L}{\partial a^\mu}\,\delta a^\mu
+
\frac{\partial L}{\partial(\partial_\nu a^\mu)}
\delta(\partial_\nu a^\mu)
\right]d^4x.
\]

Because variation commutes with differentiation,

\[
\delta(\partial_\nu a^\mu)
=
\partial_\nu(\delta a^\mu).
\]

Therefore,

\[
\delta S
=
\int_G
\left[
\frac{\partial L}{\partial a^\mu}\,\delta a^\mu
+
\frac{\partial L}{\partial(\partial_\nu a^\mu)}
\partial_\nu(\delta a^\mu)
\right]d^4x.
\]

Integrating the second term by parts gives

\[
\delta S
=
\int_G
\frac{\partial L}{\partial a^\mu}\,\delta a^\mu\,d^4x
-
\int_G
\partial_\nu
\left(
\frac{\partial L}{\partial(\partial_\nu a^\mu)}
\right)
\delta a^\mu\,d^4x
+
\text{boundary term}.
\]

For variations satisfying \(\delta a^\mu=0\) on the boundary, the boundary term vanishes. Hence

\[
\delta S
=
\int_G
\left[
\frac{\partial L}{\partial a^\mu}
-
\partial_\nu
\left(
\frac{\partial L}{\partial(\partial_\nu a^\mu)}
\right)
\right]
\delta a^\mu\,d^4x.
\]

Since the components \(\delta a^\mu\) are arbitrary and independent, we obtain the generalized Euler-Lagrange equation

\[
\frac{\partial L}{\partial a^\mu}
-
\partial_\nu
\left(
\frac{\partial L}{\partial(\partial_\nu a^\mu)}
\right)
=0.
\]

This is the @bold{vector-field generalization} of the Euler-Lagrange equation. It is simply the several-field equation written compactly, with the component label \(\mu\).

@end(proof)

@end(corollary)

@section{Maxwell's equations, label = maxwell-equations}

@begin(axiom = Maxwell's equations, label = maxwell-equations-axiom)
The electromagnetic fields are governed by the four Maxwell equations:

\[
\nabla\cdot\mathbf E
=
\frac{\rho}{\varepsilon_0}.
\]

\[
\nabla\cdot\mathbf B
=0.
\]

\[
\nabla\times\mathbf E
=-\frac{\partial \mathbf B}{\partial t}.
\]

\[
\nabla\times\mathbf B
=\mu_0\mathbf J
+
\mu_0\varepsilon_0
\frac{\partial \mathbf E}{\partial t}.
\]

These four equations, together with the appropriate charge and current distributions \(\rho\) and \(\mathbf J\), completely specify the dynamics of the electric and magnetic fields. They are empirical laws: their form is based on experimental observations and on the laws established by Gauss, Faraday, Ampère, and others. Maxwell unified these results into a single system and introduced the displacement-current term in the fourth equation.

@end(axiom)

@begin(definition = Electric and magnetic fields from the potentials, label = potential-fields)
\[
\mathbf E
=
-\nabla\phi
-
\frac{\partial\mathbf A}{\partial t},
\qquad
\mathbf B
=\nabla\times\mathbf A.
\]

The scalar potential \(\phi\) and the vector potential \(\mathbf A\) can be combined into a single four-vector, the electromagnetic potential four-vector. Using \(x^0=ct\), we define

\[
A^\mu
=
\left(
\frac{\phi}{c},\mathbf A
\right)
=
\left(
\frac{\phi}{c},A_x,A_y,A_z
\right).
\]

Thus the temporal component of \(A^\mu\) contains the scalar potential, while the three spatial components are the components of the vector potential. With \(A^0=\phi/c\), we have \(\phi=cA^0\), and since \(x^0=ct\), differentiation with respect to time is \(\partial_t=c\partial_0\). Before introducing any new tensor, we can simply rewrite the electric and magnetic fields directly using these components.

@end(definition)

@subsection{Electric field in terms of the 4-potential, label = electric-field-four-potential}

Starting from

\[
\mathbf E
=
-\nabla\phi
-
\frac{\partial\mathbf A}{\partial t},
\]

we use

\[
\phi=cA^0,
\qquad
\frac{\partial}{\partial t}
=c\partial_0.
\]

Therefore,

\[
\mathbf E
=
-c\nabla A^0
-c\partial_0\mathbf A.
\]

Writing the spatial components explicitly,

\[
E_x
=
-c\left(
\partial_x A^0
+
\partial_0 A^1
\right),
\]

\[
E_y
=
-c\left(
\partial_y A^0
+
\partial_0 A^2
\right),
\]

\[
E_z
=
-c\left(
\partial_z A^0
+
\partial_0 A^3
\right).
\]

Hence, for \(i=1,2,3\),

\[
E_i
=
-c\left(
\partial_i A^0
+
\partial_0 A^i
\right).
\]

@subsection{Magnetic field in terms of the 4-potential, label = magnetic-field-four-potential}

Now consider

\[
\mathbf B
=
\nabla\times\mathbf A.
\]

In components,

\[
B_x
=
\partial_yA_z-\partial_zA_y,
\]

\[
B_y
=
\partial_zA_x-\partial_xA_z,
\]

\[
B_z
=
\partial_xA_y-\partial_yA_x.
\]

Since

\[
A^1=A_x,
\qquad
A^2=A_y,
\qquad
A^3=A_z,
\]

these three equations can be written compactly as

\[
B_i
=
\epsilon_{ijk}\,
\partial_j A^k,
\]

where \(\epsilon_{ijk}\) is the three-dimensional Levi-Civita symbol.

At this stage we have already expressed both \(\mathbf E\) and \(\mathbf B\) entirely in terms of derivatives of the four-potential. The expressions also show a useful pattern: the electric field involves the temporal component \(A^0\) and a spatial component \(A^i\), while the magnetic field involves two spatial components. We can package all of these combinations into a single antisymmetric four-dimensional object.

Define the electromagnetic field-strength tensor

\[
F^{\mu\nu}
=
\partial^\mu A^\nu
-
\partial^\nu A^\mu.
\]

For the metric convention \(\eta^{\mu\nu}=\operatorname{diag}(1,-1,-1,-1)\), the time-space components become

\[
F^{0i}
=
\partial^0A^i-\partial^iA^0
=
\partial_0A^i+\partial_iA^0.
\]

Comparing with the expression obtained above,

\[
E_i
=
-cF^{0i}.
\]

The purely spatial components contain the magnetic field. Since

\[
F^{ij}
=
\partial^iA^j-\partial^jA^i,
\]

we obtain

\[
F^{ij}
=
-\partial_iA^j+\partial_jA^i.
\]

Using

\[
B_k
=
\epsilon_{kij}\partial_iA^j,
\]

the spatial components can therefore be written as

\[
F^{ij}
=
-\epsilon_{ijk}B_k.
\]

Contracting with \(\epsilon_{ijk}\) gives

\[
B_i
=
-\frac{1}{2}
\epsilon_{ijk}F^{jk}.
\]

Hence both electromagnetic fields are contained in the derivatives of the potential four-vector: the electric field comes from the time-space components of \(F^{\mu\nu}\), while the magnetic field comes from its purely spatial components. The four-potential is not unique: a gauge transformation \(A^\mu\rightarrow A^\mu+\partial^\mu\Lambda\) leaves \(\mathbf E\) and \(\mathbf B\) unchanged.

