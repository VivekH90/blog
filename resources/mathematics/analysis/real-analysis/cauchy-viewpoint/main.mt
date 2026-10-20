@documenttitle{Mathematics}
@doctype(notes)
@author{Vivek Kalita}
@date{4 October 2026}
@title{Cauchy's view on sequences}
@description{A rudimentary exploration of the ideas of Cauchy sequences and Cauchy criterion}
@tags{Real Analysis, Cauchy Criterion, Cauchy Sequences}

@section{Introduction, label = introduction}

We know that a sequence eventually gets arbitrarily close to its limit. Suppose that
\[
a_n \to L
\]
For large \(n\), \(a_n\) is close to \(L\). So, by intuition, we can say that for sufficiently large \(m,n\), the difference \(|a_m-a_n|\) should become arbitrarily small.

By this intuition we can define the convergence of a sequence without mentioning its limit.

@begin(definition = Cauchy Sequence)

A sequence \((a_n)\) is @bold{Cauchy} if for every \(\epsilon>0\), there exists \(N\in\mathbb N\) such that

\[
m,n\ge N \implies |a_n-a_m|<\epsilon.
\]

@end(definition)

In fact, we can show that the definition of Cauchy and a convergent sequence are equivalent to each other.

@section{The Cauchy Criterion, label = cauchy-criterion}

@begin(theorem = Cauchy Criterion for Sequences)

A sequence \((a_n)\) of real numbers is convergent if and only if it is Cauchy.

@end(theorem)

@begin(proof)

@begin(enumerate)

@item{
\(\implies\)

Suppose \(a_n\to L\). Let \(\epsilon>0\). Then there exists \(N\in\mathbb N\) such that

\[
n\ge N \implies |a_n-L|<\frac{\epsilon}{2}.
\]

Hence, for \(m,n\ge N\),

\[
|a_n-a_m|
\le |a_n-L|+|a_m-L|
<\epsilon.
\]

Thus \((a_n)\) is Cauchy.
}

@item{
\(\impliedby\)

Suppose \((a_n)\) is Cauchy. Then \((a_n)\) is bounded, so by the Bolzano--Weierstrass theorem it has a convergent subsequence \(a_{n_k}\to L\).

Let \(\epsilon>0\). Since \((a_n)\) is Cauchy, there exists \(N\in\mathbb N\) such that

\[
m,n\ge N \implies |a_n-a_m|<\frac{\epsilon}{2}.
\]

Since \(a_{n_k}\to L\), choose \(k\) large enough that

\[
n_k\ge N
\qquad\text{and}\qquad
|a_{n_k}-L|<\frac{\epsilon}{2}.
\]

Then, for \(n\ge N\),

\[
|a_n-L|
\le |a_n-a_{n_k}|+|a_{n_k}-L|
<\epsilon.
\]

Therefore \(a_n\to L\).
}

@end(enumerate)

@end(proof)