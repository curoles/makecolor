;;; Author: Igor Lesik 2016
;;; Copyright: Igor Lesik 2016
;;;
;;; Lottery number generator.
;;;
;(use-modules (ice-9 format))
;(use-modules (srfi srfi-42))


;;; randomize random seed
(set! *random-state* (random-state-from-platform))

;;; function to roll dice with N sides once
(define (roll-dice sides)
    (random sides) ;;; return random number in [0,sides)
)

;;; make ordered list of all lottery numbers
(define (all-numbers lottery-range)
    (iota lottery-range)
)

;;; return list where nth element moved back
(define (list-mv-back lst n)
    (append (list-head lst n)       ;; [0..n-1]
            (list-tail lst (+ n 1)) ;; [n+1,..,last]      
            (list (list-ref lst n)) ;; [n]
    )
)

(define (play iter numbers)
    ;(display numbers)
    (cond(
        (= iter 0)
            numbers)
        (else
            (play (- iter 1) 
                  (list-mv-back numbers (roll-dice iter))
            )
    ))
)

(define (lottery-numbers lottery-range)
    (play lottery-range (all-numbers lottery-range))
)

