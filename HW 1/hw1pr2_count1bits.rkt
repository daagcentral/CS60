#lang racket
(provide count1bits)


;; count1bits returns the number of 1s in the
;; binary representation of N without converting
;; it to a binary representation. It does so by
;; seeing if the number is odd (right most digit in binary == 1)
;; and if it is, it counts 1 and divides by 2 to move everything
;; one binary place to the right. 
(define (count1bits N) 
     (cond [(= N 1) 1] ;when there's no longer anything to divide
           [(= N 0) 0] ; in cases we get a N = 0, we return 0
           [(odd? N) (+ 1 (count1bits (/ (- N 1) 2)))] ; checks if N is odd and recursses
           [(even? N) (count1bits (/ N 2))])) ; recurssion on even
           
