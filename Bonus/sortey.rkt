;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sortey) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (randomlist n mx)
  (cond
    [(= n 0) empty]
    [else
     (cons (+ 1 (random mx))
           (randomlist (- n 1) mx))]))

(define r1 (randomlist 1000000 100))

;; (quick-sort lon) sorts lon in non-decreasing order
;; quick-sort: (listof Num)!(listof Num)
(define (quick-sort lon)
  (cond [(empty? lon) empty]
        [else (local
                [(define pivot (first lon))
                 (define less (filter (lambda (x) (< x pivot)) (rest lon)))
                 (define greater (filter (lambda (x) (> x pivot)) (rest lon)))]
                (append (quick-sort less)
                        (filter (λ(x)(= x pivot)) lon)
                        (quick-sort greater)))]))

(define a1 (current-seconds))

(define a (quick-sort r1))

(define a2 (current-seconds))

(define (quick-sort2 lon)
  (cond [(empty? lon) empty]
        [else (local
                [(define pivot (first lon))
                 (define less (filter (lambda (x) (< x pivot)) (rest lon)))
                 (define greater (filter (lambda (x) (>= x pivot)) (rest lon)))]
                (append (quick-sort less)
                        (list pivot)
                        (quick-sort greater)))]))

(define b1 (current-seconds))

(define b (quick-sort2 r1))

(define b2 (current-seconds))

(define c1 (current-seconds))

(define c (quicksort r1 <))

(define c2 (current-seconds))

(- a2 a1)

(- b2 b1)

(- c2 c1)
