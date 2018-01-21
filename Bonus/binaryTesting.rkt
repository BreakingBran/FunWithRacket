;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname binaryTesting) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;(define (dec->bin dec)
;  (foldr (λ(x y)(cond[(number? y)(cond [(odd? y) '(1 (sub1 y))][else '(0 y)])]
;                     [else ])) dec '(3 2 1 0)))


(define (dec->binOLD dec)
  (local [(define d (floor (/ dec 2)))]
    (foldr
     (λ(x y)(local [(define s (second(first y)))(define t (expt 2 x))(define d (floor (/ s 2)))](cond[(< s 0) (cons '(0 -1) y)][(integer? (/ s t)) (cons (list 0 s) y)][else (cons (list 1 (- s t))y)])))
     (list (list (cond [(odd? dec) 1][else 0]) d))
     '(4 3 2))))


(define (dec->bin dec)
  (local [(define d (floor (/ dec 2)))]
    (foldr (λ(x y)(local [(define s (cond [(empty? y) dec][else (second(first y))]))(define d (floor (/ s 2)))](cons (list (cond [(odd? s) 1][else 0]) d x) y)))
           empty
           (list #\a #\b #\c #\d))))