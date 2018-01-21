;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname steppingLambda) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;Trees

(define-struct int-node (value left right) )

(define b1old
  (make-int-node 3
                 (make-int-node 0
                                empty
                                (make-int-node 1 empty empty))
                 (make-int-node 4
                                empty
                                empty)))

(define b1
  '(3 (0 (() 1)) (4 () ())))

(define (nfoldr XYfunc YYfunc base nlist)
  (cond [(empty? nlist) base]
        [(list? (first nlist)) (YYfunc(nfoldr XYfunc YYfunc base (first nlist))
                                      (nfoldr XYfunc YYfunc base (rest nlist)))]
        [else (XYfunc (first nlist) (nfoldr XYfunc YYfunc base (rest nlist)))]))

(define (flatten valid-grid) (nfoldr cons append empty valid-grid))

(check-expect (min-key b1) 0)

(define (min-key btree)
  (foldr min -inf.0 (flatten btree)))