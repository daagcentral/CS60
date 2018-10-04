#lang racket
(require rackunit)
(provide superreverse)
;;input: a list with lists in it
;;output: the reverse of everything inside L but not L itself
(define (superreverse L)
  (map reverse L))


;provided tests
(check-equal? (superreverse '( (1 2 3) (4 5 6) (#\k #\o #\o #\l) (#\a #\m) ))
    '( (3 2 1) (6 5 4) (#\l #\o #\o #\k) (#\m #\a) ) )
(check-equal? (superreverse '( (1 2 3) (4 5 6 (7 8) 9 ) ))
    '( (3 2 1) (9 (7 8) 6 5 4) ) )

;additional tests
(check-equal? (superreverse '( (1) () (#\a) (#\a #\m) ))
                            '( (1) () (#\a) (#\m #\a) ))
(check-equal? (superreverse '(()))
                            '(()))