#lang racket
(require rackunit)
(provide prefix?)
(provide sublist?)

;; input: P = a list of items
;;        L = another list of items
;; output: True if all of P appears in the begining of L. False if otherwise.
(define (prefix? P L)
  (cond [(empty? P) #t] ;; base case 1
        [(empty? L) #f] ;; base case 2
        [(equal? (first P) (first L)) (prefix? (rest P) (rest L))]; Recursses to check whether the things in P appear in the first few of L.
                                                                  ; Returns true if they are
        [else #f])) ;; returns false if the previous check fails


;; input: P = a list of items
;;        L = another list of items
;; output: True if all of P appears in L with the same order. In other words, it returns true if P is a subset of L. Returns false otherwise.
(define (sublist? P L)
  (cond [(empty? P) #t] ;base case 1
        [(empty? L) #f] ;base case 2
        [(equal? (first P) (first L)) (prefix? P L)] ; Recursses to check when the first of L = first of P
                                                     ; then calls Prefix? to check whether P is a prefix of whatever's left of L.
        [else (sublist? (rest P) L)])) ; recursses for whenever the first of P isnt equal to first of whatever's left of L 
;provided tests
(check-true  (prefix? '()    '(s p a m)))
(check-true  (prefix? '(s p) '(s p a m)))
(check-false (prefix? '(s m) '(s p a m)))
(check-false (prefix? '(p a) '(s p a m)))

(check-true  (sublist? '()    '(s p a m)))
(check-true  (sublist? '(s p) '(s p a m)))
(check-false (sublist? '(s m) '(s p a m)))
(check-true  (sublist? '(p a) '(s p a m)))


;additional tests
(check-false (prefix? '(s p a m)    '()))
(check-true  (prefix? '((1 2) 2)    '((1 2) 2)))
(check-false  (prefix? '((1 2) 2)    '(1 2 2)))

(check-false  (sublist? '(spam)    '()))
(check-true  (sublist? '(s p a m) '(s p a m)))

