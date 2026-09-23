@documenttitle{Physics, banner = background.png, color = #f9f5f8}

@button{Home, href = /, color = #5b3a8a}
@button{Archives, href = /archives, color = #7652a8}
@button{GitHub, href = https://github.com/VivekH90/blog, color = #70458f}

@title{Lagrange's equation for the electromagnetic field}

@section{Lagrange's equation for a single variable, color = #7b4fb3, label = single-variable}

The starting point of Lagrangian mechanics is the @bold{principle of stationary action}. We consider a dynamical variable \(q(t)\) and define the action

\[
S[q] = \int_{t_1}^{t_2} L(q,\dot q,t)\,dt.
\]

The physical trajectory is the one for which the action is stationary under small variations of the path,

\[
\delta S = 0.
\]

It is important to be precise about what is held fixed in this variation. The endpoints of the trajectory are fixed,

\[
\delta q(t_1)=\delta q(t_2)=0.
\]

We are @italic{not} assuming that every trial path has the same energy. The fixed-endpoint condition is what removes the boundary term in the variation. For a Lagrangian with no explicit time dependence, conservation of energy is instead a @bold{consequence} of the Euler--Lagrange equation.

@subsection{Deriving the Euler--Lagrange equation, label = single-variable-derivation}

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

Hence the @bold{Euler--Lagrange equation} is

\[
\frac{d}{dt}
\left(
\frac{\partial L}{\partial \dot q}
\right)
-
\frac{\partial L}{\partial q}
=0.
\]

This is the basic equation we will generalize to fields. The central structural idea is that stationarity of an action turns a variational problem into a differential equation. For electromagnetism, the dynamical variable will no longer be a single function \(q(t)\), but a field with several components depending on spacetime.


@section{Lagrange's equation for multiple variables, color = #7b4fb3, label = multiple-variables}

The single-variable Euler--Lagrange equation can be extended naturally when the Lagrangian depends on several independent dynamical variables. Consider two fields \(u(x,y)\) and \(v(x,y)\), with the action

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

The important point is that \(u\) and \(v\) are @bold{independent fields}. Therefore, when the action is varied, the variations \(\delta u\) and \(\delta v\) can be chosen independently.

@subsection{Variation of the action, label = multiple-variable-variation}

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

Since variation commutes with differentiation,

\[
\delta u_x=\frac{\partial(\delta u)}{\partial x},
\qquad
\delta u_y=\frac{\partial(\delta u)}{\partial y},
\]

and similarly,

\[
\delta v_x=\frac{\partial(\delta v)}{\partial x},
\qquad
\delta v_y=\frac{\partial(\delta v)}{\partial y}.
\]

We can therefore integrate each derivative term by parts. Assuming that the variations vanish on the boundary of \(G\), all boundary terms disappear. The variation becomes

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

Because \(\delta u\) and \(\delta v\) are independent and arbitrary in the interior of \(G\), each coefficient must vanish separately. We therefore obtain two Euler--Lagrange equations:

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

Thus, @bold{each independent field contributes its own Euler--Lagrange equation}. This is the key step toward electromagnetism: the electromagnetic potential will be treated as a collection of field components, each of which is varied independently.
