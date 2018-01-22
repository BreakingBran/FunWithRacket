# FunWithRacket
Some fun things I did with racket

This takes a string and splits it into all 2^n combinations of the word:
- Built using no explicit recursion or loops

(define (omit2.1 str) 
  (foldr (λ(x y)(cons (list->string (map third (filter (λ(s)(first s)) x))) y)) empty
         (build-list (expt 2 (length (string->list str)))(λ(n)(foldr (λ(x y)(local [(define s (cadar y))](cons (list (cond [(odd? s) #t][else #f]) (floor(/ s 2)) x) y)))(list (list #f n 0))(string->list str))))))

Example:
>>(omit2.1 "abc") => (list "" "c" "b" "bc" "a" "ac" "ab" "abc")
>>(omit2.1 "abcde")
=> (list "" "e" "d" "de" "c" "ce" "cd" "cde" "b" "be" "bd" "bde" "bc" "bce" "bcd" "bcde" "a" "ae" "ad" "ade" "ac" "ace" "acd" "acde" "ab" "abe" "abd" "abde" "abc" "abce" "abcd" "abcde")
