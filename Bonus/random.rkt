;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname random) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (make-posn2 x y)
  (local [(define symbol-2-value (λ (s) (cond [(symbol=? 'x s) x]
                                              [(symbol=? 'y s) y])))]
    symbol-2-value))

(define p1 (make-posn2 3 4))

(p1 'x)
(p1 'y)