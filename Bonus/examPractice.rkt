;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname examPractice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(check-expect (increasing-list 4) '( (0) (0 1) (0 1 2) (0 1 2 3)))

(define (increasing-list n)
  (build-list n (lambda (x) (build-list (add1 x) identity))))




;(check-expect (digits->num '(5)) 5)
;(check-expect (digits->num '(1 2 3)) 123)

(define (digits->num lon)
  (string->number (list->string (map number->string lon))))

;(check-expect (count #\a (list #\a #\b #\a 5)) 2)

(define (count item list)
  (length (filter (lambda (x) (equal? item x)) list)))

;(check-expect (count-chars #\a (list "Aardvark" #\a "ba" (list #\a "a") "hail") ) 4)

(define (count-chars char loa)
  (local [(define all-strings (map string->list (filter string? loa)))
          (define char-counts (map (lambda (loc) (count char loa)) all-strings))]
    (foldr + 0 char-counts)))


;;;;;;;;;;;;;;;;Graphs;;;;;;;;;;;;;;;;;;;;;

(define graph '((A (B C F))
                (B ())
                (C (A B))
                (D (A C F))))

(define (neighbours node graph)
  (local [(define found (filter (lambda (x) (sumbol=? (first x) v) ) g))]
    (node)))

(define (delete-node))





























