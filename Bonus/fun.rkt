;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fun) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(define (increasing-lists x)
  (map (λ(x)(build-list x identity)) (build-list (add1 x) (λ(x)(add1 x)))))

(define (digitits->num lon)
  (string->number (foldr (λ(x y)(string-append (number->string x) y)) "" lon)))

(define (count elem list)
  (length (filter (λ(x)(equal? x elem)) list)))

(define (count-chars char loa)
  (local [(define string-list (filter string? loa))]
    (foldr (λ(x y)(+ (count char (string->list x)) y)) 0 string-list)))

(define (count-n char loa)
  (cond [(empty? loa) 0]
        [(cons? (first loa)) (+(count-n char (first loa))
                               (count-n char (rest loa)))]
        [(string? (first loa)) (+ (count char (string->list (first loa)))
                                  (count-n char (rest loa)))]
        [else (count-n char (rest loa))]))

(define g1
  '((A (B C F))
    (B ())
    (C (A B))
    (D (A C F))
    (E (A B C))
    (F (A))))

(define (delete-node v g)
  (local [(define omit-node-g (filter (λ(x)(not (symbol=? v (first x)))) g))]
    (map (λ(x)(cons (first x) (list (filter (λ(l) (not (symbol=? v l))) (second x))))) omit-node-g)))



