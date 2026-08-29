# Exercise 1.40

The procedure `cubic` can be defined as so:

```scheme
(define (cubic a b c)
  (lambda (x)
          (+ (* x x x) (* a x x) (* b x) c)))
```
