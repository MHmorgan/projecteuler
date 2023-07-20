#lang racket

(require math/base)
(require math/number-theory)

(define MAX 10000)
(define LOWEST 2)

; Divisor sum without the number itself.
(define (divsum n)
  (- (divisor-sum n) n))

(define (amicable? a)
  (let ([b (divsum a)])
    (and (not (= a b))
         (= a (divsum b)))))

; Return a list of all the amicable numbers between [LOWEST,MAX)
(define (amicable-numbers)
  (let loop ([nums '()] [n LOWEST])
    (let ([next (add1 n)])
      (cond [(>= n MAX) nums]
            [(amicable? n)
             (loop (cons n nums) next)]
            [else (loop nums next)]))))

; Calculate solution
(define numbers (amicable-numbers))
(displayln numbers)
(printf "Sum: ~s~n" (sum numbers))
