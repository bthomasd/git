;;; Max Pairwise Product algorithm
;;; Coursera course

(defun max-pairwise-product (lst)
  (* (list-max lst) (list-max (remove (list-max lst) lst :count 1 :from-end t))))

(defun list-max (lst)
  (reduce #'max lst))
