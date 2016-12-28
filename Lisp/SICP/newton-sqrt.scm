;;; This is an example from SICP.
;;; A series of simple functions to build Newton's method of approximating square roots.

;;; Here is a square root function using (expt) for comparison.

(define (sqrt x)
  (expt x 1/2))

;;; Here are the functions necessary to perform the approximation.

(define (newton-sqrt guess x)
  (if (good-enough? guess x)
      guess
      (newton-sqrt (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

;;; Defining if in terms of a cond rather than the special form
;;; will cause the procedure to recurse infinitely.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (newton-sqrt-new-if guess x)
  (new-if (good-enough? guess x)
	  guess
	  (newton-sqrt-new-if (improve guess x) x)))

(define (my-sqrt x)
  (newton-sqrt 1.0 x))

(define (sqrt-new-if x)
  (newton-sqrt-new-if 1.0 x))

;;; Reimplementation using a different end-test.

(define (better-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess 0.0001)))

(define (better-newton-sqrt guess x)
  (if (better-enough? guess x)
      guess
      (better-newton-sqrt (improve guess x) x)))

(define (my-better-sqrt x)
  (better-newton-sqrt 1.0 x))


;;; Exercise 1.8: Newton's Method for Cube Roots

(define (cube-root-test x)
  (expt x 1/3))

(define (newton-cube-root y x)
  (if (good-enough-cube? y x)
      y
      (newton-cube-root (newton-cube-approx y x) x)))

(define (good-enough-cube? y x)
  (< (abs (- (newton-cube-approx y x) y))
      (* y 0.001)))

(define (newton-cube-approx y x)
  (/ (+ (/ x (* y y)) (* y 2)) 3))

(define (my-cube-root x)
  (newton-cube-root 1.0 x))
