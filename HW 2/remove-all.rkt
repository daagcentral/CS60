#lang racket
(require rackunit)
(provide remove-all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove-all
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove-all
;;  inputs: e = char, symbol, or numbre that we want to remove from a list and
;           L = a list of things we will recurse through to remove all appearances of e.
;;  output: a list with everything in L except all e's
(define (remove-all e L)
  (cond[(empty? L) '()] ; base case
       [(equal? e (first L)) (remove-all e (rest L))] ; if equal, move to check the rest of list
       [else
        (cons (first L) (remove-all e (rest L)))])) ; if different, construct a new list and put number in it. continue to recursse
      


; provided tests
(check-equal? (remove-all "i" '("a" "l" "i" "i" "i" "e" "n")) 
              '("a" "l" "e" "n"))
(check-equal? (remove-all "i" '( ("a" "l" "i") "i" "i" "e" "n")) 
              '(("a" "l" "i") "e" "n"))
(check-equal? (remove-all 0 '(1 0 1 0 1 0))  
              '(1 1 1))

; additional tests
(check-equal? (remove-all 0 '())
              '())
(check-equal? (remove-all '() '())
              '())
(check-equal? (remove-all '() '(1 0 5))
              '(1 0 5))