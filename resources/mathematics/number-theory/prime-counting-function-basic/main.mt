@documenttitle{Mathematics}
@doctype(notes)
@author{Vivek Kalita}
@date{4 October 2026}
@title{Bertrand's Postulate}
@description{An elementary exploration of Bertrand's postulate using the central binomial coefficient and prime-exponent estimates.}
@tags{Bertrand's Postulate, Prime Counting Function, Number Theory, Prime Numbers}

@section{Bertrand's Theorem, label = bertrands-theorem}

I ask a simple question. Can an interval \((n,2n)\) be empty of primes?

To study this, we consider an integer that is large for one reason and would be smaller if such intervals were empty. In simple words, the size of this number depends on the existence of primes in \((n,2n)\).

The integer is the binomial coefficient

\[
B_n=\binom{2n}{n}.
\]


@begin(theorem = Bertrand's Theorem, label = bertrands-postulate)

For every integer \(n>1\), there exists a prime number \(p\) such that \(n<p<2n\).

@end(theorem)

We follow an elementary argument due to Erdős. The central idea is to assume that the interval \((n,2n)\) contains no primes and then derive a contradiction.

There are \(2n+1\) terms in the sum

\[
4^n=(1+1)^{2n}=\sum_{j=0}^{2n}\binom{2n}{j}.
\]

Since no term is larger than the central coefficient \(B_n\), we must have

\[
B_n\geq\frac{4^n}{2n+1}.
\]

This is a basic lower bound that we need to satisfy even without knowing anything about the primes.

@subsection{Counting Prime Exponents, label = counting-prime-exponents}

First, let us start with a basic question: what is the exponent of a prime \(p\) in the binomial coefficient \(B_n\)?

The question is quite subtle. To answer it, we need to ask a simpler question: what is the exponent of a prime \(p\) in \(n!\)?

This is a counting problem. Among the integers \(1,2,\ldots,n\), exactly \(\left\lfloor n/p\right\rfloor\) are divisible by \(p\). Each contributes at least one factor of \(p\) to \(n!\).

Thus, we write

\[
n_1=\left\lfloor\frac{n}{p}\right\rfloor.
\]

But some of these numbers may also be divisible by \(p^2\), contributing additional factors of \(p\). The number of multiples of \(p^2\) not exceeding \(n\) is

\[
n_2=\left\lfloor\frac{n}{p^2}\right\rfloor.
\]

We can continue in this way. Multiples of \(p^3\) contribute yet another factor, and so on. Counting these additional factors gives us the exponent of \(p\) in the factorization of \(n!\).

@begin(theorem = Legendre's Formula, label = legendre-formula)

Let \(p\) be a prime and \(n\) a positive integer. The exponent of \(p\) in the prime factorization of \(n!\) is given by

\[
v_p(n!)=\left\lfloor\frac{n}{p}\right\rfloor+\left\lfloor\frac{n}{p^2}\right\rfloor+\cdots
=\sum_{j\geq 1}\left\lfloor\frac{n}{p^j}\right\rfloor.
\]

@end(theorem)

Applying Legendre's formula to \(B_n\), we obtain

\[
v_p(B_n)=\sum_{j\geq 1}\left(\left\lfloor\frac{2n}{p^j}\right\rfloor-2\left\lfloor\frac{n}{p^j}\right\rfloor\right).
\]

This is manageable because it is easy to see that

\[
\lfloor 2y\rfloor-2\lfloor y\rfloor\in\{0,1\}.
\]

Once \(p^j>2n\), all later terms become zero. This gives a very rough bound:

\[
v_p(B_n)\leq\left\lfloor\log_p(2n)\right\rfloor.
\]

However, this bound is too weak for our proof.

@subsection{The p-adic Staircase, label = p-adic-staircase}

@begin(lemma = Lemma 4.1, label = lemma-41)

Let \(n\geq 5\) and let \(p\) be a prime satisfying

\[
\frac{2n}{3}<p\leq n.
\]

Then \(v_p(B_n)=0\).

@end(lemma)

@begin(proof)

Since \(p>2n/3\) and \(n\geq 5\),

\[
p^2>\left(\frac{2n}{3}\right)^2>2n.
\]

Hence, all terms with \(j\geq 2\) vanish in the formula for \(v_p(B_n)\). Only the first term can contribute.

Moreover,

\[
2\leq\frac{2n}{p}<3,\qquad 1\leq\frac{n}{p}<\frac{3}{2}.
\]

It follows that

\[
\left\lfloor\frac{2n}{p}\right\rfloor=2,\qquad
\left\lfloor\frac{n}{p}\right\rfloor=1.
\]

Therefore,

\[
v_p(B_n)=2-2=0,
\]

as required.

@end(proof)

Now assume that there are no primes in \((n,2n)\). The previous lemma shows that no prime in \((2n/3,n]\) divides \(B_n\).

We would proceed by staircasing and reducing the bound that we derived earlier.