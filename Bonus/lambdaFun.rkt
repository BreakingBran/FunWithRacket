;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lambdaFun) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(define numbers '(1 2 3 4 5 6 7 8 9))

(filter odd? numbers)

(filter (local [(define (name-used-once x) (odd? x))] name-used-once) numbers)

(define make-adder (λ (x) (λ (y) ( + x y ))))

(define add13 (make-adder 13))

(add13 1)

(define (mult-table nr nc)
  (build-list nr
              (lambda (i)
                (build-list nc
                            (lambda (j)
                              (* i j))))))

