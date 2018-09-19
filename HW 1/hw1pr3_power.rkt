#lang racket
(require racket/trace)
(provide power)
(provide fast-power)

;; *************************************
;;   Part B - Power
;; *************************************
; power computes base to the pow are returns the result
; using recurssion
(define (power base pow)
  (cond [(= pow 0) 1] ; checks the condition for pow = 0 and returns 1
        [else (* base (power base (- pow 1)))])) ; recurses for when ever pow>0

;; *************************************
;;   Part C - Fast-Power
;; *************************************
; this eliminates less recursive calls by utilizing let*
(define (fast-power base pow)
  (cond [(= pow 0) 1]
        [(odd? pow) (* base (fast-power base (- pow 1)))]
        [(even? pow)
         (let* ([newBase (fast-power base (/ pow 2))]) (* newBase newBase))]))

        