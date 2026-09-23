@documenttitle{Physics, banner = background.png, color = #f9f5f8}

@button{Home, href = /, color = #5b3a8a}
@button{Archives, href = /archives, color = #7652a8}
@button{GitHub, href = https://github.com/VivekH90/blog, color = #70458f}

@title{Generalisation of Lagrange's equation}

@section{Lagrange's equation for a single variable, color = #7b4fb3, label = single-variable}

@axiom{Principle of Least Action, label = least-action}
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

@image{src = input/least-action.png, alt = least-action, caption = , label = least action, width = 60%, height = auto}

@proof{}
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

@section{Lagrange's equation for multiple variables, color = #7b4fb3, label = multiple-variables}

@theorem{Theorem Title, label = theorem-label}
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

@proof{}

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


@subsection{The 4-vector generalization, label = four-vector-generalization}

@corollary{4-vector generalization}
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

@proof{}
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
