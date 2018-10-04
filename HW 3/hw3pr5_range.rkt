#lang racket
(require rackunit)
(provide make-range-predicate)
(provide value1to3?)
(provide value1to100?)

; make-range-predicate
; input: low - the low (exclusive) lower bounds.
;        high - the high (exclusive) upper bounds.
; output: a function that takes one input and returns true 
;         if the input is between the values low and high.
;         (and returns false if the input is less than or 
;         equal to low or is greater than or equal to high.)
(define (make-range-predicate low high)
  (λ (x) (if (and (< x high) (> x low)) #t #f)))

; provided defintions calling make-range-predicate
(define value1to3?   (make-range-predicate 0 4))
(define value1to100? (make-range-predicate 0 101))

; provided test cases for value1to3? and value1to100?
(check-equal? (value1to3? 0)  false)
(check-equal? (value1to3? 1)  true)
(check-equal? (value1to3? 2)  true)
(check-equal? (value1to3? 3)  true)
(check-equal? (value1to3? 4)  false)
(check-equal? (value1to3? 42) false)

(check-equal? (value1to100? 0)   false)
(check-equal? (value1to100? 1)   true)
(check-equal? (value1to100? 20)  true)
(check-equal? (value1to100? 42)  true)
(check-equal? (value1to100? 100) true)
(check-equal? (value1to100? 101) false)
(check-equal? (value1to100? 999) false)
