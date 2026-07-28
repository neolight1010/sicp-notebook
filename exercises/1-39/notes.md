# Exercise 1.39

The following procedure calculates $\tan$ using the continued fraction
expression by J.H. Lambert:

```scheme
(define (tan-cf x k)
  (cont-frac
    (lambda (i) (if (= i 1) x (* -1 x x)))
    (lambda (i) (+ (* (- i 1) 2) 1))
    k))
```
