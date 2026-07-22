# Exercise 1.37

Here is the procedure that calculates k-term finite continue fractions:

```scheme
(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-iter (+ i 1))))))
  
  (cont-frac-iter 1))
```
- **a)** `k=12` yields $0.618025751072961$, which is accurate to 4 decimal
places to $\frac 1 \phi$.
- **b)** The previous procedure is recursive. The following one is iterative:

```scheme
(define (cont-frac n d k)
  (define (cont-frac-iter i q)
    (if (= i 1)
        q
        (let ((next-q (/ (n (- i 1)) (+ (d (- i 1)) q))))
          (cont-frac-iter (- i 1) next-q))))
  
  (cont-frac-iter k (/ (n k) (d k))))
```

The iterative procedure is harder to read and was harder to figure out than the
recursive one, as usual.
