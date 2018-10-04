#lang racket
(require rackunit)
(provide matches)
(provide lotto-winner)

; matches  
; input: list-of-tickets - representing a lotto ticket
;          expected format:  '(name # # ... #)
;        winning-numbers - representing the winning numbers
;          expected format;  '(# # .. #)
; output: the number elements that match between 
;         list-of-tickets and winning-numbers
(define (matches list-of-tickets winning-numbers)
  (length 
   (filter (lambda (one-ticket) 
             (member one-ticket winning-numbers))
           list-of-tickets)))

; provided tests:
(check-equal? (matches '(cat 1)     '())       0)
(check-equal? (matches '(cat 1)     '(2 3 4))  0)
(check-equal? (matches '(cat 1)     '(1))      1)
(check-equal? (matches '(ace 2 3 4) '(3 42 2)) 2)
(check-equal? (matches '(ace 2 3 4) '(8 4 5))  1)

; lotto-winner 
; input: list-of-tickets - representing a list of lotto tickets
;         expected format: '((name1 # # ... #)... (nameN # # ... #)) 
;        winning-numbers - representing the winning numbers
;          expected format;  '(# # .. #)
; output: the name and number of matching tickets from the ticket 
;         with the most matches in winning-numbers
(define (lotto-winner list-of-tickets winning-numbers)
  (first (sort (putTogether ;since we're taking apart the names of the candidates from their numbers to find a match score, we have to cal putTogether that pairs the scores with names of candidates ba
   (map (λ(x) (matches x winning-numbers)) ;calls matching to get the number of matches for each candidate
        (map (λ (x) (rest x)) list-of-tickets) ) ;makes a list with list-of-tickets without the names of the condidates
   list-of-tickets ) #:key second >)))

;input: scores, S and a list of all candidates names with the numbers they drew
;output: name, score pair
(define (putTogether S L)
  (map (λ(x y) (list (first x) y)) L S))


;;provided
(check-equal? (lotto-winner
    '( (alice 2 4 16 33 42)  
       (bob 3 4 5 6 7) 
       (cdrthecat 3 15 16 41 42) )  
    '(2 3 15 32 42)) ; winning tickets
              '(cdrthecat 3)) ; <- output of lotto-winner

;;additional
(check-equal? (lotto-winner
    '( (alice 2 4 16 33 42)  
       (bob  3 15 16 41 42) 
       (cdrthecat 3 15 16 41 42) )  
    '(2 3 15 32 42)) 
              '(bob 3)) ; '(cdrthecat 3) can also be an answer

(check-equal? (lotto-winner
    '( (a 2 4)  
       (b  3 15) 
       (c 3 15 ) )  
    '(100 200 300 4000)) 
              '(a 0))


