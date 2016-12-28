;;; Fibonacci algorithms for Coursera course

(defun naive-fib(n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(t (+ (naive-fib (- n 1)) (naive-fib (- n 2))))))
