(define (make-serial-number-generator)
  (  let ((current-serial-number 0))
     (lambda ()
      (set! current-serial-number (+ current-serial-number 1))
      current-serial-number
     )
  )
)

