#lang racket
(require rackunit)
(require racket/trace)
(provide subbag?)

;;inputs: two lists, S & B
;;outputs: true if all elements in S appear in B regardless of order.
;;         false if they dont
(define (subbag? S B)
  (cond [(empty? S) #t] ;;if the code runs through all of S, return true
        [(equal? (member (first S) B) #f);;if first of S isnt member of B, automatically break recurrsion and return false
                 #f]
        [else (subbag? (remove (first S) S) (remove (first S) B))])); else, remove the first of S from S and B and continue recursing

;; scrabble-tile-bag  
;;   letter tile scores and counts from the game of Scrabble
;;   the counts aren't needed they're obtained from
;;   http://en.wikipedia.org/wiki/Image:Scrabble_tiles_en.jpg
;;
(define scrabble-tile-bag
  '((#\a 1 9) (#\b 3 2) (#\c 3 2) (#\d 2 4) (#\e 1 12)
   (#\f 4 2) (#\g 2 3) (#\h 4 2) (#\i 1 9) (#\j 8 1)
   (#\k 5 1) (#\l 1 4) (#\m 3 2) (#\n 1 6) (#\o 1 8)
   (#\p 3 2) (#\q 10 1)(#\r 1 6) (#\s 1 4) (#\t 1 6)
   (#\u 1 4) (#\v 4 2) (#\w 4 2) (#\x 8 1) (#\y 4 2)
   (#\z 10 1) (#\_ 0 2)) )

;;helper 1: assoc
;;input: a number/char/symbol, e, and a list of lists, A
;;output: returns the sublist that starts with e
(define (assoc e A)
  (cond [(empty? A) #f]
        [(equal? (first (first A)) e) (first A)]
        [else (assoc e (rest A))]))

;;helper 2: score letter
;;input: a letter
;;output: the score of that letter
(define (score-letter k)
  (second (assoc k scrabble-tile-bag)))

;;helper 3
;;input: a word
;;output: the sum of the scores of each letter of W
(define (score-word W)
  (listscore (string->list W)))
(define (listscore L)
  (cond [(empty? L) 0]
        [(+ (score-letter (first L)) (listscore (rest L)))]))
;;helper 4
;;input: a rack word, rack, and a list of candidates to be checked for highest score
;;output: a list of scored words
(define (score rack WL)
  (cond [(empty? WL) '()]
        [(subbag? (string->list (first WL)) (string->list rack))
         (cons (list  (first WL) (score-word (first WL))) (score rack (rest WL)))]
        [else (score rack (rest WL))]))
;(trace score)
;(check-equal? (score "academy" '("ace" "ade" "cad" "cay" "day"))  '("cay" 8))

;;helper 5
;;input: a list of list of words and scores, L, and ("" 0) as a starting maximum scored scrabble
;;output: the word-score pair of the highest scored scrabble
(define (find-max L maxL)
  (cond [(empty? L) maxL]
        [(> (second (first L)) (last maxL)) (find-max (rest L) (first L))]
        [else (find-max (rest L) maxL)]))

;;input: a rack word, rack, and a list of candidates to be checked for highest score
;;output: the highest scoring word along with the points
(define (best-word rack WL)
  (find-max (score rack WL) '("" 0)))
  
                                            

;provided tests
(check-equal? (subbag? '()      '(s p a m s))   true)
(check-equal? (subbag? '(s s)   '(s p a m s))   true)
(check-equal? (subbag? '(s m)   '(s p a m s))   true)
(check-equal? (subbag? '(a p)   '(s p a m s))   true)
(check-equal? (subbag? '(a m a) '(s p a m s))   false)
(check-equal? (subbag? '(a s)   '(s a))         true)

(check-equal? (assoc 3   '((0 jan) (1 feb) (2 mar) (3 apr)))  '(3 apr))
(check-equal? (assoc 5 '((1 jan) (2 feb) (3 mar) (4 apr)))  false)

(check-equal? (score-letter '#\w) 4)
(check-equal? (score-word "zzz")  30)
(check-equal? (score-word "fortytwo") 17)
(check-equal? (score-word "twelve")  12)

(check-equal? (best-word "academy" '("ace" "ade" "cad" "cay" "day"))  '("cay" 8))
(check-equal? (best-word "appler" (list "peal" "peel" "ape" "paper")) '("paper" 9))
(check-equal? (best-word "paler" (list "peal" "peel" "ape" "paper"))  '("peal" 6))
(check-equal? (best-word "kwyjibo" '("ace" "ade" "cad" "cay" "day"))  '("" 0))


;additional tests
(check-equal? (subbag? '()      '())   true)
(check-equal? (subbag? '(s p a m s)      '(s p a m s))   true)
(check-equal? (subbag? '('(1 2) 2)      '(2 '(2 1)))   false)

(check-equal? (find-max '(("ace" 5) ("ade" 4) ("cad" 6) ("cay" 8) ("day" 7)) '("" 0)) '("cay" 8))
(check-equal? (score "academy" '("ace" "ade" "cad" "cay" "day"))  '(("ace" 5) ("ade" 4) ("cad" 6) ("cay" 8) ("day" 7)))
(check-equal? (best-word "appler" '()) '("" 0))




