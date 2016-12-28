;;; Land of Lisp: Chapter 2
;;; Guess-My-Number game.

;;; Define some global variables using defparameter.

(defparameter *small* 1)
(defparameter *big* 100)

;;; Define the game functions.

(defun guess-my-number ()
  "Main game function."
  (ash (+ *small* *big*) -1))

(defun smaller ()
  "Tells the game that the guess was too high."
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  "Tells the game the guess was too low."
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

(defun start-over ()
  "Starts the game over."
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))

