#lang racket

(define pie 3.14)

(define a-radius 8.4)

(define an-area
  (* pie
     (* a-radius a-radius)))

(define area-of-circle
  (lambda (r)
    (* pie
       (* r r))))

(define area-of-rectangle
  (lambda (width)
    (lambda (height)
      (* width height))))

(define abs
  (lambda (x)
    (let ((x-is-negative (< x 0)))
      (cond
        (x-is-negative (- x))
        (else x)))))

(define remainder
  (lambda (x y)
    (cond
      ((< x y) x)
      (else (remainder (- x y) y)))))