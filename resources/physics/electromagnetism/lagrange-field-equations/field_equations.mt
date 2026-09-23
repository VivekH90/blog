@documenttitle{Physics, banner = background.png, color = #f9f5f8}

@button{Home, href = /, color = #5b3a8a}
@button{Archives, href = /archives, color = #7652a8}
@button{GitHub, href = https://github.com/VivekH90/blog, color = #70458f}

@title{Lagrange's equation for the electromagnetic field}

@section{Lagrange's equation for a single variable, color = #7b4fb3, label = single-variable}

The starting point of Lagrangian mechanics is the @bold{principle of stationary action}. We consider a dynamical variable (q(t)) and define the action

[
S[q] = int_{t_1}^{t_2} Ligl(q,dot q,tigr),dt.
]

The physical trajectory is the one for which the action is stationary under small variations of the path,

[
delta S = 0.
]

It is important to be precise about what is held fixed in this variation. The endpoints of the trajectory are fixed,

[
delta q(t_1)=delta q(t_2)=0.
]

We are @italic{not} assuming that every trial path has the same energy. The fixed-endpoint condition is what removes the boundary term in the variation. For a Lagrangian with no explicit time dependence, conservation of energy is instead a @bold{consequence} of the Euler--Lagrange equation.

@subsection{Deriving the Euler--Lagrange equation, label = single-variable-derivation}

Under the variation

[
q(t)
ightarrow q(t)+delta q(t),
]

the action changes by

[
delta S
=
int_{t_1}^{t_2}
left(
rac{partial L}{partial q},delta q
+
rac{partial L}{partial dot q},deltadot q

ight)dt.
]

Since variation and differentiation commute,

[
deltadot q
=
rac{d}{dt}(delta q).
]

Therefore,

[
delta S
=
int_{t_1}^{t_2}
left[
rac{partial L}{partial q},delta q
+
rac{partial L}{partial dot q}
rac{d}{dt}(delta q)

ight]dt.
]

Integrating the second term by parts gives

[
delta S
=
int_{t_1}^{t_2}
left[
rac{partial L}{partial q}
-
rac{d}{dt}
left(
rac{partial L}{partial dot q}

ight)

ight]delta q,dt
+
left[
rac{partial L}{partial dot q},delta q

ight]_{t_1}^{t_2}.
]

Because the endpoint variations vanish,

[
delta q(t_1)=delta q(t_2)=0,
]

the boundary term is zero. The remaining variation must vanish for arbitrary (delta q(t)), so the coefficient of (delta q) must vanish:

[
rac{partial L}{partial q}
-
rac{d}{dt}
left(
rac{partial L}{partial dot q}

ight)
=0.
]

Hence the @bold{Euler--Lagrange equation} is

[
oxed{
rac{d}{dt}
left(
rac{partial L}{partial dot q}

ight)
-
rac{partial L}{partial q}
=0
}.
]

This is the basic equation we will generalize to fields. The central structural idea is that stationarity of an action turns a variational problem into a differential equation. For electromagnetism, the dynamical variable will no longer be a single function (q(t)), but a field with several components depending on spacetime.
