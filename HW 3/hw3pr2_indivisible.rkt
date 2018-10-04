#lang racket
(require rackunit)
(provide indivisible)

;input: a divider and a list of numbers
;output: a list of numbers in X that arent divisible by e

(define (indivisible e L)
  ( filter (λ(x) (if (= (modulo x e) 0) #f #t)) L))

; additional tests
(check-equal? (indivisible 1 '( 2123 13 12344 45 4126 1237 48 1239 14440 )) '())
(check-equal? (indivisible 2 '( 2123 13 123443 45 41263 1237 483 1239 144403 )) '( 2123 13 123443 45 41263 1237 483 1239 144403 ))


; provided tests
(check-equal? (indivisible 3 '( 2 3 4 5 6 7 8 9 10 )) '(2 4 5 7 8 10))
