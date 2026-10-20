@documenttitle{Mathematics}
@doctype(notes)
@author{Vivek Kalita}
@date{2 October 2026}
@title{Density of Rational Numbers}
@description{A rudimentary exploration of the notion of density of numbers}
@tags{Real Analysis, Rational numbers, Ordered Fields}

@section{Introduction, label = introduction}

Before we characterise what "being dense" mathematically is, let's look at a few examples.

Take the numbers \(0.4375866...\) and \(0.4375868...\). It's easy to find a rational number between them. As an example, we have \(0.4375867\). It has a terminating decimal expansion. Can you find one between \(0.4375866...\) and \(0.4375867\)? Of course you can.

In fact, if you take any two numbers, no matter how close they are, just by intuition you can say that there is a rational between them. That essentially is the idea of a set being @bold{dense}.

Consider \(0.4\) and \(0.5\). Is there any natural number between them? No.

So, essentially, we have stumbled upon a very subtle difference between the sets \(\mathbb{N}\) and \(\mathbb{Q}\): their @bold{density} in \(\mathbb{R}\).

Let's consider this notion more formally:

@begin(definition = Dense Set, label = dense-set)

Let \(F\) be an ordered field and let \(A\subseteq F\). We say that \(A\) is dense in \(F\) if, for every \(a,b\in F\) with

\[
a<b,
\]

there exists \(x\in A\) such that

\[
a<x<b.
\]

@end(definition)

Now, to show that rational numbers are in fact @bold{dense} in \(\mathbb R\), we just need to be able to construct a number of the form:

\[
\frac{m}{n},
\]

where \(m,n\in\mathbb{Z}\) and \(n\neq 0\), between any two numbers \(a\) and \(b\).

@section{Archimedean Property, label = archimedean-property}

To find a number of the form \(\frac{m}{n}\), it suffices to show that there is an \(m\in\mathbb Z\) such that:

\[
na < m < nb
\]

This is equivalent to saying that for any interval \((a,b)\), we could find a number \(n \in \mathbb N\) such that:

\[
\frac{1}{n} < b-a
\]

This is the @bold{Archimedean property} of the real numbers:

@begin(definition = Archimedean Property)

An ordered field \(F\) is called @bold{Archimedean} if for every \(x\in F\), there exists \(n\in\mathbb N\) such that

\[
x < n\cdot 1_F,
\]

where \(n\cdot 1_F\) denotes

\[
\underbrace{1_F+\cdots+1_F}_{n\text{ times}}.
\]

@end(definition)

@begin(theorem = The Real Numbers Are Archimedean, label = real-numbers-are-archimedean)

The ordered field \(\mathbb R\) is @bold{Archimedean}. That is, for every \(x\in\mathbb R\), there exists \(n\in\mathbb N\) such that

\[
x<n.
\]

@end(theorem)

@begin(proof)

Let

\[
S=\mathbb N.
\]

Suppose, for contradiction, that \(\mathbb R\) is not Archimedean. Then there exists \(x\in\mathbb R\) such that

\[
n\le x
\]

for every \(n\in\mathbb N\). Thus, \(S\) is bounded above.

Since \(\mathbb R\) is complete, \(S\) has a least upper bound. Let

\[
\alpha=\sup S.
\]

Then \(\alpha-1<\alpha\). Since \(\alpha\) is the least upper bound of \(S\), \(\alpha-1\) cannot be an upper bound of \(S\). Hence, there exists \(n\in\mathbb N\) such that

\[
\alpha-1<n \implies \alpha<n+1.
\]

But \(n+1\in\mathbb N=S\), so \(n+1\le\alpha\), since \(\alpha\) is an upper bound of \(S\).

Therefore,

\[
\alpha<n+1\le\alpha,
\]

which is impossible.

Hence, \(S=\mathbb N\) is not bounded above in \(\mathbb R\). Therefore, for every \(x\in\mathbb R\), there exists \(n\in\mathbb N\) such that

\[
x<n.
\]

Thus, \(\mathbb R\) is Archimedean.

@end(proof)

@begin(corollary = Reciprocal Form of the Archimedean Property, label = reciprocal-archimedean-property)

For every \(\varepsilon>0\), there exists \(n\in\mathbb N\) such that

\[
\frac{1}{n}<\varepsilon.
\]

@end(corollary)

Now that we know there always exists an \(n\) such that:

\[
\frac{1}{n} < b - a \implies 1 < n(b - a)
\]

so, for any two numbers \(a,b\), we can always create an interval greater than \(1\). (Note that these were fairly obvious, but, for the sake of rigour, we had to invoke the Archimedean property, which again was a consequence of the axiom of completeness.)

For completeness, we construct the integer \(m\) explicitly. Take

\[
m=\lfloor na\rfloor+1.
\]

By the definition of the floor function,

\[
\lfloor na\rfloor\le na<\lfloor na\rfloor+1 = m \le na+1<nb.
\]

Therefore, we have explicitly constructed an integer \(m\) such that

\[
na<m<nb.
\]

Dividing throughout by \(n>0\), we obtain

\[
a<\frac{m}{n}<b.
\]

Thus, \(m/n\) is a rational number lying strictly between \(a\) and \(b\).

@section{Rational numbers are dense, label = Rational numbers are dense}

For the sake of formality, here is the complete proof that we constructed so far:

@begin(theorem = Density of the Rational Numbers, label = density-of-q-in-r)

For every \(a,b\in\mathbb R\) with

\[
a<b,
\]

there exists \(q\in\mathbb Q\) such that

\[
a<q<b.
\]

@end(theorem)

@begin(proof)

Let \(a,b\in\mathbb R\) with \(a<b\). Then

\[
b-a>0.
\]

By the Archimedean property, there exists \(n\in\mathbb N\) such that

\[
\frac{1}{n}<b-a.
\]

Multiplying by \(n>0\), we obtain

\[
1<n(b-a),
\]

and hence

\[
na+1<nb.
\]

Now, construct the integer \(m\) explicitly by taking

\[
m=\lfloor na\rfloor+1.
\]

By the definition of the floor function,

\[
\lfloor na\rfloor\le na<\lfloor na\rfloor+1,
\]

so

\[
na<m.
\]

Also,

\[
m=\lfloor na\rfloor+1\le na+1<nb.
\]

Therefore,

\[
na<m<nb.
\]

Dividing throughout by \(n>0\), we obtain

\[
a<\frac{m}{n}<b.
\]

Since \(m\in\mathbb Z\) and \(n\in\mathbb N\subset\mathbb Z\) with \(n\neq0\),

\[
\frac{m}{n}\in\mathbb Q.
\]

Taking

\[
q=\frac{m}{n},
\]

we have found a rational number \(q\) such that

\[
a<q<b.
\]

Hence, \(\mathbb Q\) is dense in \(\mathbb R\).

@end(proof)

@section{A final thought, label = A final thought}

It is, in fact, very interesting to note that the cardinality of \(\mathbb N\) and \(\mathbb Q\) is the same, i.e. there exists a one-to-one function between them.

Essentially, we can construct a dense set from a set that is @bold{not dense}. Note that this could always be done for sets which are infinite in size. 