;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Omit2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #t)))
(define (omit2.1 str) 
  (foldr (λ(x y)(cons (list->string (map third (filter (λ(s)(first s)) x))) y)) empty
         (build-list (expt 2 (length (string->list str)))(λ(n)(foldr (λ(x y)(local [(define s (cadar y))](cons (list (cond [(odd? s) #t][else #f]) (floor(/ s 2)) x) y)))(list (list #f n 0))(string->list str))))))
