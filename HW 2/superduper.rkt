#lang racket
(require rackunit)
(provide superreverse)
;;inputs: any list
;;outputs: a list with first level inner lists reversed  
(define (superreverse L)
  (cond [(empty? L) '()] ; base case
        [(list? (first L))
                (cons (reverse (first L)) (superreverse (rest L)))] ; if first element is a list, reverse it and recurse
         [else (cons (first L) (superreverse (rest L)))])) ; if the first element isnt a list, leave it as a it is and continue recursing 


;;inputs: any list
;;outputs: a list with all inner lists reversed    
(define (duperreverse L)
  (cond [(empty? L) '()] ; base case
        [(list? (first L)) 
                (append (duperreverse (rest L)) (list (duperreverse (first L))))] ; when the first is a list, it recurses on first and rest.
                                                                                  ; It puts the first after the rest so it flips as it recurses
        [else (append (duperreverse (rest L)) (list (first L)))])) ; does the same as the previous case but dosnt further check if theres an inner list. it just reverses

;provided
(check-equal? (superreverse '( (1 2 3) (4 5 6) (#\k #\o #\o #\l) (#\a #\m) ))
                            '( (3 2 1) (6 5 4) (#\l #\o #\o #\k) (#\m #\a) ))
(check-equal? (superreverse '( (1 2 3) (4 5 6 (7 8) 9 ) ))
                            '( (3 2 1) (9 (7 8) 6 5 4) ) )

(check-equal? (duperreverse '( (1 2 3) (4 5 6) 42 ("k" "o" "o" "l") ("a" "m") ))
    '(  ("m" "a") ("l" "o" "o" "k") 42 (6 5 4) (3 2 1) ) )
(check-equal? (duperreverse '( (1 2 3) (4 5 6 (7 8) 9 ) ))
    '( (9 (8 7) 6 5 4) (3 2 1) ) )

;additional
(check-equal? (superreverse '( (1) () #\a (#\a #\m) ))
                            '( (1) () #\a (#\m #\a) ))

(check-equal? (duperreverse '( (1) () #\a (#\a #\m) ))
    '( (#\m #\a) #\a () (1)))




