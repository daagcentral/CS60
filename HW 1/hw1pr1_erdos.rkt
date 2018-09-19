#lang racket

;; Two functions will be treated as publicly accessible
;;   (so that we can test them)
(provide erdos erdos-count)

;; erdos takes an int N. If N is even
;; erdos returns N/2. If it's odd, it returns
;; 3N+1
(define (erdos N)
  (cond [(empty? N) '()]
        [(= N 0) 1]
        [(= (modulo N 2) 0) (/ N 2)]
        [(= (modulo N 2) 1) (+ 1 (* 3 N))]))
  

;; erdos-count takes in an int N and
;; returns the smallest number of times
;; erdos must be iterated to arrive at a value of 1. 
(define (erdos-count N)
  (cond [(empty? N) '()]
        [(< N 0) "please prvide a positive N"]
        [(= N 1) 0]
        [else (+ 1 (erdos-count (erdos N)))]))

