#lang racket
(require rackunit)
(require "hw1pr3_power.rkt")

; student tests
(check-equal? (power 1 0) 1)
(check-equal? (power 0 1) 0)
(check-equal? (power 2 2) 4)
(check-equal? (power 10 3) 1000)

(check-equal? (fast-power 1 0) 1)
(check-equal? (fast-power 0 1) 0)
(check-equal? (fast-power 2 2) 4)
(check-equal? (fast-power 10 3) 1000)


; provided tests
(check-equal? (fast-power 2 10) 1024)
(check-equal? (fast-power 42 10) 17080198121677824)
(check-equal? (fast-power 2 10) 1024)
(check-equal? (fast-power 42 10) 17080198121677824)
