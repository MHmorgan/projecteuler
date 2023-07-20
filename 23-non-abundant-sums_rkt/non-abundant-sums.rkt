#lang racket

(require math/base)
(require math/number-theory)

; Lower proven limit of numbers which is the sum of two
; abundant numbers.
;(define LIMIT 28123)
(define LIMIT 1000)

(define LOW 2)

(define (is-abundant? n)
  (let ([sum (- (divisor-sum n) n)])
	(> sum n)))

; List of all abundant numbers below LIMIT
(define abundant-numbers
  (let loop ([numbers '()] [n (- LIMIT 1)])
    (let ([next (- n 1)])
      (cond [(< n LOW) numbers]
            [(is-abundant? n) (loop (cons n numbers) next)]
            [else (loop numbers next)]))))

;(define (is-abundant-sum? n)
;  (let outer ([anums abundant-numbers])
;    (let inner ([numbers (cdr anums)] [val (car anums)])
;      '())
;    

; The sum of all the positive integers which cannot be
; written as the sum of two abundant numbers.
;
; * All even N > 46 can be written as a sum of 2 abundant numbers
;
;(define solution
;  (sum
;   (let loop ([numbers '()] [n 2])
;     (let ([next (+ n 1)])
;       (cond [(and (> n 46) (even? n))  ; All even n > 46 are a sum of two abundant numbers
;              (loop numbers next)]
      
(let loop ([lst '()] [n 2])
  (cond [(>= n 8000) lst]
        [(and (is-abundant? n) (odd? n)) (loop (cons n lst) (+ n 1))]
        [else (loop lst (+ n 1))]))
         
