;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fun-w-btree) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define-struct int-node (key left right))
(define b1
  (make-int-node 3
                 (make-int-node 4
                                empty
                                (make-int-node 1 empty empty))
                 (make-int-node 6
                                (make-int-node 8 empty empty)
                                (make-int-node 10
                                               (make-int-node 2 empty empty)
                                               empty))))

(define (min-key t)
  (cond [(empty? t) false]
        [else (local [(define min-left (min-key (int-node-left t)))
                      (define min-right (min-key (int-node-right t)))
                      (define num (int-node-key t))]
                (cond [(and (false? min-left) (false? min-right)) num]
                      [(and (false? min-left) (not (false? min-right)))
                       (min num min-right)]
                      [(and (not (false? min-left)) (false? min-right))
                       (min num min-left)]
                      [else (min min-left min-right num)]))]))