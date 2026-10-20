@documenttitle{Physics}
@doctype(notes)
@author{Vivek Kalita}
@date{17 October 2026}
@title{Energy Transmission in One-Dimensional Strings}
@description{Energy conservation, travelling waves, Fourier spectra, and transmission at a junction between strings.}
@tags{Classical Mechanics, Wave Mechanics, Energy Conservation, Fourier Analysis}

@section{1. Introduction, label = introduction}

The aim of this article is to understand the basic ideas of energy propagation and transmission in one-dimensional strings. We would also explore the idea of impedance, which essentially captures how a medium responds to a travelling disturbance.

@section{2. Energy and Related Concepts, label = energy}

@subsection{2.1. The Lagrangian and Hamiltonian Description, label = lagrangian-hamiltonian}

For a linear string with mass density \(\mu\) and tension \(T\), the Lagrangian density is given by

\[
\mathcal{L}
=\frac12\mu\left(\frac{\partial y}{\partial t}\right)^2
-\frac12T\left(\frac{\partial y}{\partial x}\right)^2.
\]

From this, we obtain the conjugate momentum density:

\[
\pi(x,t)=\frac{\partial\mathcal{L}}{\partial y_t}
=\mu y_t.
\]

The Hamiltonian density is therefore

\[
\mathcal{H}=\pi y_t-\mathcal{L},
\]

so that

\[
\mathcal{H}
=\frac{\pi^2}{2\mu}+\frac{T}{2}y_x^2
=\frac12\mu y_t^2+\frac12T y_x^2.
\]

@subsection{2.2. Power and Local Energy Conservation: The Discrete Picture, label = discrete-energy}

At first, one might think that the energy within every small segment of a string must be conserved, so that no energy is transferred into or out of it.

This, however, is not the case.

To see why, consider a discrete model of the string.

The force on the \(n\)-th particle, to first order, is given by

\[
F_n=\frac{T}{a}(y_{n+1}-y_n)
-\frac{T}{a}(y_n-y_{n-1}),
\]

where \(a\) is the separation between adjacent masses.

Define

\[
q_n=y_{n+1}-y_n,\qquad
q_{n-1}=y_n-y_{n-1}.
\]

The kinetic energy of the \(n\)-th particle is

\[
K_n=\frac12m\dot y_n^2.
\]

Hence,

\[
\frac{dK_n}{dt}
=m\dot y_n\ddot y_n
=\frac{T}{a}\dot y_n(q_n-q_{n-1}).
\]

Likewise, the potential energy can be written as

\[
U_n=\frac{T}{4a}(q_{n-1}^2+q_n^2).
\]

Differentiating, we obtain

\[
\frac{dU_n}{dt}
=\frac{T}{2a}
\left(q_{n-1}\dot q_{n-1}+q_n\dot q_n\right).
\]

The total energy associated with the \(n\)-th particle is \(E_n=K_n+U_n\). Therefore,

\[
\begin{aligned}
\frac{dE_n}{dt}
&=\frac{dK_n}{dt}+\frac{dU_n}{dt}\\
&=\frac{T}{2a}\big[
q_n(\dot y_{n+1}+\dot y_n)\\
&\qquad-q_{n-1}(\dot y_n+\dot y_{n-1})
\big].
\end{aligned}
\]

In general, this is not zero:

\[
\frac{dE_n}{dt}\neq0.
\]

However, we can define the energy fluxes across the adjacent links as

\[
P_{n+\frac12}
=-\frac{T}{2a}q_n(\dot y_{n+1}+\dot y_n),
\]

and

\[
P_{n-\frac12}
=-\frac{T}{2a}q_{n-1}(\dot y_n+\dot y_{n-1}).
\]

Our energy equation becomes

\[
\frac{dE_n}{dt}
=P_{n-\frac12}-P_{n+\frac12}.
\]

For an isolated string, we see that

\[
\sum_n\frac{dE_n}{dt}=0.
\]

Hence, the total energy is conserved.

@subsection{2.3. The Continuum Limit, label = continuum-limit}

Let

\[
x=na,\qquad y_n\longrightarrow y,\qquad a\longrightarrow0.
\]

Then,

\[
y_{n+1}-y_n\sim a\frac{\partial y}{\partial x},
\]

and

\[
\dot y_{n+1}+\dot y_n
\sim2\frac{\partial y}{\partial t}.
\]

Thus,

\[
\begin{aligned}
P_{n+\frac12}
&\sim-\frac{T}{2a}
\left(a\frac{\partial y}{\partial x}\right)
\left(2\frac{\partial y}{\partial t}\right).
\end{aligned}
\]

Consequently, the energy flux becomes

\[
P(x,t)=-T\frac{\partial y}{\partial x}
\frac{\partial y}{\partial t}.
\]

The discrete energy conservation equation,

\[
\frac{dE_n}{dt}
=P_{n-\frac12}-P_{n+\frac12},
\]

becomes the local energy conservation equation

\[
\frac{\partial u}{\partial t}
+\frac{\partial P}{\partial x}=0,
\]

where \(u(x,t)\) is the energy per unit length.

@subsection{2.4. A Single Travelling Wave, label = single-travelling-wave}

For a right-moving sinusoidal wave,

\[
y(x,t)=A\cos(kx-\omega t),
\qquad \omega=vk,
\]

we have

\[
P(x,t)=TA^2k\omega\sin^2(kx-\omega t).
\]

Taking the time average gives

\[
\begin{aligned}
\langle P\rangle
&=\frac12TA^2k\omega\\
&=\frac12\mu v\omega^2A^2,
\end{aligned}
\]

where \(v=\sqrt{T/\mu}\).

@subsection{2.5. Superposition and the Fourier Spectrum, label = superposition-fourier-spectrum}

For two waves,

\[
y=A_1\cos\theta_1+A_2\cos\theta_2,
\]

where

\[
\theta_j=k_jx-\omega_jt,
\]

we have

\[
\begin{aligned}
P={}&TA_1^2k_1\omega_1\sin^2\theta_1\\
&+TA_2^2k_2\omega_2\sin^2\theta_2\\
&+TA_1A_2(k_1\omega_2+k_2\omega_1)
\sin\theta_1\sin\theta_2.
\end{aligned}
\]

For distinct frequencies, the time average of the cross term vanishes. Hence,

\[
\langle P\rangle
=\frac12TA_1^2k_1\omega_1
+\frac12TA_2^2k_2\omega_2.
\]

In general, for discrete Fourier modes,

\[
y=\sum_j A_j\cos\theta_j,
\]

the average power is

\[
\langle P\rangle
=\frac12\sum_j TA_j^2k_j\omega_j,
\]

assuming distinct frequencies so that the cross terms average to zero.

@subsection{2.6. A Complete Fourier Spectrum, label = complete-fourier-spectrum}

A complete Fourier spectrum is represented by

\[
y(x,t)=\frac{1}{\sqrt{2\pi}}
\int_{-\infty}^{+\infty}
A(k)e^{ik(x-vt)}\,dk.
\]

For a right-moving profile,

\[
y_t=-vy_x.
\]

The instantaneous power is therefore

\[
P(x,t)=Tv[y_x(x,t)]^2.
\]

Using the Fourier representation,

\[
P(x,t)=\frac{Tv}{2\pi}
\left|
\int_{-\infty}^{+\infty}
ikA(k)e^{ik(x-vt)}\,dk
\right|^2.
\]

Parseval's theorem then gives the total energy:

\[
E=T\int_{-\infty}^{+\infty}
k^2|A(k)|^2\,dk.
\]

@section{3. A Discontinuous Medium, label = discontinuous-medium}

Consider two strings joined at \(x=0\).

The left string has mass density \(\mu_L\), and the right string has mass density \(\mu_R\). The tension must be the same in both strings because the junction does not move horizontally.

The boundary conditions are

\[
y_L(0,t)=y_R(0,t),
\]

and

\[
\frac{\partial y_L(0,t)}{\partial x}
=\frac{\partial y_R(0,t)}{\partial x}.
\]

For a wave incident from the left,

\[
y_L=A_I\cos(k_Lx-\omega t)
+A_R\cos(k_Lx+\omega t),
\qquad x<0,
\]

and

\[
y_R=A_T\cos(k_Rx-\omega t),
\qquad x>0.
\]

Applying the boundary conditions, we obtain

\[
A_I+A_R=A_T,
\]

and

\[
k_L(A_I-A_R)=k_RA_T.
\]

Defining the reflection and transmission coefficients by

\[
r=\frac{A_R}{A_I},
\qquad
t=\frac{A_T}{A_I},
\]

we find

\[
r=\frac{k_L-k_R}{k_L+k_R}
=\frac{\sqrt{\mu_L}-\sqrt{\mu_R}}
{\sqrt{\mu_L}+\sqrt{\mu_R}},
\]

and

\[
t=\frac{2k_L}{k_L+k_R}
=\frac{2\sqrt{\mu_L}}
{\sqrt{\mu_L}+\sqrt{\mu_R}}.
\]

Here, we have used \(k=\omega\sqrt{\mu/T}\), with equal tension and equal angular frequency in both strings.

@subsection{3.1. Transmission of Energy and Power, label = transmission-energy-power}

Define

\[
\phi_I=k_Lx-\omega t,
\]

\[
\phi_R=k_Lx+\omega t,
\]

and

\[
\phi_T=k_Rx-\omega t.
\]

The energy density in the left string is

\[
u_L=\mu_L\omega^2
\left(
A_I^2\sin^2\phi_I+
A_R^2\sin^2\phi_R
\right),
\]

so that

\[
\langle u_L\rangle
=\frac12\mu_L\omega^2(A_I^2+A_R^2).
\]

In the right string,

\[
u_R=\mu_R\omega^2A_T^2\sin^2\phi_T,
\]

and therefore

\[
\langle u_R\rangle
=\frac12\mu_R\omega^2A_T^2.
\]

The power fluxes are given by

\[
P_L=Tk_L\omega
\left(
A_I^2\sin^2\phi_I
-A_R^2\sin^2\phi_R
\right),
\]

and

\[
P_R=Tk_R\omega A_T^2\sin^2\phi_T.
\]

At the junction, the squared sine factors coincide because

\[
\sin^2(-\omega t)=\sin^2(\omega t).
\]

The amplitude relations also give

\[
k_L(A_I^2-A_R^2)=k_RA_T^2.
\]

Consequently,

\[
P_L(0,t)
=Tk_L\omega(A_I^2-A_R^2)\sin^2\omega t,
\]

while

\[
P_R(0,t)
=Tk_R\omega A_T^2\sin^2\omega t.
\]

Thus,

\[
P_L(0,t)=P_R(0,t).
\]

The reflected and transmitted fractions of the incident power are

\[
\begin{aligned}
R
&=\frac{\langle P_{\mathrm{ref}}\rangle}
{\langle P_I\rangle}\\
&=\left(
\frac{\sqrt{\mu_L}-\sqrt{\mu_R}}
{\sqrt{\mu_L}+\sqrt{\mu_R}}
\right)^2,
\end{aligned}
\]

and

\[
\begin{aligned}
\mathcal{T}
&=\frac{\langle P_T\rangle}{\langle P_I\rangle}\\
&=\frac{4\sqrt{\mu_L\mu_R}}
{\left(\sqrt{\mu_L}+\sqrt{\mu_R}\right)^2}.
\end{aligned}
\]

In particular,

\[
R+\mathcal{T}=1.
\]

This confirms that, for an ideal junction without energy dissipation, the incident energy is divided between reflection and transmission.