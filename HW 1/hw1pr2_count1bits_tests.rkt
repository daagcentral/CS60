#lang racket

(require rackunit)
(require "hw1pr2_count1bits.rkt")

; provided tests
(check-equal? (count1bits 6) 2)
(check-equal? (count1bits 7) 3)
(check-equal? (count1bits 42) 3)

; student tests
(check-equal? (count1bits 0) 0)
(check-equal? (count1bits 1) 1)
(check-equal? (count1bits 31) 5)

