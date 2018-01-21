;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname examPractice2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))


(define-struct n (k v l r))

(define tree1 (make-n 5 "a"
                      (make-n 1 "a" '() '())
                      (make-n 6 "a"
                                '()
                                (make-n 14 "a" '() '()))))

(check-expect (add-n 0 "a" tree1)
              (make-n 5 "a"
                      (make-n 1 "a"
                                (make-n 0 "a" '() '())
                                '())
                      (make-n 6 "a"
                                '()
                                (make-n 14 "a" '() '()))))

(check-expect (add-n 13 "b" tree1)
              (make-n 5 "a"
                      (make-n 1 "a" '() '())
                      (make-n 6 "a"
                                '()
                                (make-n 14 "a" (make-n 13 "b" '() '()) '()))))

(check-expect (add-n 14 "b" tree1)
              (make-n 5 "a"
                      (make-n 1 "a" '() '())
                      (make-n 6 "a"
                                '()
                                (make-n 14 "b" '() '()))))

(define (add-n k v tree)
  (cond [(empty? tree) (make-n k v '() '())]
        [else (local [(define t-k (n-k tree))
                      (define t-v (n-v tree))
                      (define t-l (n-l tree))
                      (define t-r (n-r tree))]
                (cond [(= k t-k) (make-n k v t-l t-r)]
                      [(< k t-k) (make-n t-k t-v (add-n k v t-l) t-r)]
                      [(> k t-k) (make-n t-k t-v t-l (add-n k v t-r))]))]))