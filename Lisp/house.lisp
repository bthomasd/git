;;; Keyboard exercise from Chapter 6

(setf rooms
      '((living-room
	 (north front-stairs)
	 (south dining-room)
	 (east kitchen))
	(upstairs-bedroom
	 (west library)
	 (south front-stairs))
	(dining-room
	 (north living-room)
	 (east pantry)
	 (west downstairs-bedroom))
	(kitchen
	 (west living-room)
	 (south pantry))
	(pantry
	 (north kitchen)
	 (west dining-room))
	(downstairs-bedroom
	 (north back-stairs)
	 (east dining-room))
	(back-stairs
	 (south downstairs-bedroom)
	 (north library))
	(front-stairs
	 (north upstairs-bedroom)
	 (south living-room))
	(library
	 (east upstairs-bedroom)
	 (south back-stairs))))

(defun choices (x)
  "Returns the directions one can travel from a room."
  (rest (assoc x rooms)))

(defun look (direction room)
  "Returns the room one would be looking in giving a direction and starting position."
  (second (assoc direction (rest (assoc room rooms)))))

;;; Global variable to store current location.
(defvar LOC 'pantry)

(defun set-robbie-location (place)
  "Moves Robbie to PLACE by setting the variable LOC."
  (setf loc place))

(defun how-many-choices ()
  "Returns number of choices for movement from current location."
  (length (rest (assoc LOC rooms))))

(defun where ()
  "Tells current location."
  (cond ((eq loc 'library) (list 'Robbie 'is 'upstairs 'in 'the loc))
	((eq loc 'kitchen) (list 'Robbie 'is 'downstairs 'in 'the loc))
	((eq loc 'front-stairs) (list 'Robbie 'is 'on 'the loc))
	((eq loc 'back-stairs) (list 'Robbie 'is 'on 'the 'loc))
	(t (list 'Robbie 'is 'in 'the loc))))

(defun move (direction)
  "Moves Robbie in the direction specified. Changes rooms or does nothing."
  (if (equal (look direction loc) nil) (list 'Ouch! 'Robbie 'hit 'a 'wall)
      (list 'Robbie 'moved 'to 'the (set-robbie-location (look direction loc)))))


