;;; The Wizard's Adventure Game
;;; Text game engine in Lisp

;;; First, let's create a top-level variable to contain descriptions
;;; of the locations that exist in the game.

(defparameter *nodes* '((living-room (you are in the living room.
				      a wizard is snoring loudly on the couch.))
			(garden (you are in a beautiful garden.
				 there is a well in front of you.))
			(attic (you are in the attic.
				there is a giant welding torch in the corner.))))

;;; By using assoc, we can easily create the describe-location function.

(defun describe-location (location nodes)
  "Accesses and describes location in game-world."
  (cadr (assoc location nodes)))

;;; Now that we have basic descriptions of each location, we need descriptions
;;; of paths to other locations as well. We'll create a second variable, *edges*

(defparameter *edges* '((living-room (garden west door)
			 (attic upstairs ladder))
			(garden (living-room east door))
			(attic (living-room downstairs ladder))))

(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-locations* '((whiskey living-room)
				   (bucket living-room)
				   (chain garden)
				   (frog garden)))

(defun describe-path (edge)
  "Builds a textual description of a given edge."
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  "Describes multiple paths at once."
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(defun objects-at (loc objs obj-locs)
  "Gives location of object, uses locally defined function using labels."
  (labels ((at-loc-p (obj)
		    (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

(defun describe-objects (loc objs obj-loc)
  "Describes objects in a location."
  (labels ((describe-obj (obj)
	     `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

(defparameter *location* 'living-room)

(defun look()
  "Observes location."
  (append (describe-location *location* *nodes*)
	  (describe-paths *location* *edges*)
	  (describe-objects *location* *objects* *object-locations*)))
