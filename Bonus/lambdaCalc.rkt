;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lambdaCalc) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define True (λ(x y)x))
(define False (λ(x y)y))
(define Not (λ(b)(b False True)))
(define And (λ(x y)(x (y True False) False)))
(define Or (λ(x y)(x True (y True False))))


(define Y (λ(f)((λ(x)(f (x x)))(λ(x)(f (x x))))))

;(define factorial (λ(n)(Y (λ (f)(cond [(= n 1) 1][else (* n (f (sub1 n)))])))))

;(factorial 5)

(define Y-combinator-recursion-factorial
    (Y
     (lambda (factorial)
       (lambda (n)
         (cond ((= n 0) 1)
               ((= n 1) 1)
               (else (* n (factorial (- n 1)))))))))


