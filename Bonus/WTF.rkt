#lang lazy

(define Y (λ(f)((λ(x)(f (x x)))(λ(x)(f (x x))))))
;(define Y (λ(b)
;            ((λ(f)(b(λ(x)((f f) x))))
;             (λ(f)(b(λ(x)((f f) x)))))))

(define Fact
  (Y (λ(fact) (λ(n) (if (zero? n) 1 (* n (fact (- n 1))))))))