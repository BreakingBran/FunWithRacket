;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname foldl2.0) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (foldl2 f b l)
  (cond [(empty? l) b]
        [else (append (foldl2 f b (rest l)) (list (f (first l))))]))

(foldl2 identity empty '( 1 2 3 4))

(define (find-route orig dest G)
  (cond [(symbol=? orig dest) (list orig)]
        [else (local [(define nbrs (neighbours orig G))
                      (define route (find-route/list nbrs dest G))]
                (cond [(false? route) route]
                      [else (cons orig route)]))]))

(define (neighbours v G)
(cond [(empty? G) (error "vertex not in graph")]
[(symbol=? v (first (first G))) (second (first G))]
[else (neighbours v (rest G))]))


(define (find-route/list los dest G)
  (cond [(empty? los) false]
        [else (local [(define route (find-route (first los) dest G))]
                (cond [(false? route)
                       (find-route/list (rest los) dest G)]
                      [else  route]))]))

(define G '((A (C D E))
            (B (E J))
            (C ())
            (D (F J))
            (E (K))
            (F (K H))
            (H ())
            (J (H))
            (K ())))
