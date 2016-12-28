;;; A file for doing exercises from Touretzky

(setf things
      '((object1 large green shiny cube)
	(object2 small red dull metal cube)
	(object3 red small dull plastic cube)
	(object4 small dull blue metal cube)
	(object5 small shiny red four-sided pyramid)
	(object6 large shiny green sphere)))

(defun description (x)
  "Gives the description of an object by looking at it's table key."
  (rest (assoc x things)))

(defun differences (x y)
  "Gives the differences between two sets."
  (set-exclusive-or (description x) (description y)))

(setf quality-table
      '((large      . size)
	(small      . size)
	(red        . color)
	(green      . color)
	(blue       . color)
	(shiny      . luster)
	(dull       . luster)
	(metal      . material)
	(plastic    . material)
	(cube       . shape)
	(sphere     . shape)
	(pyramid    . shape)
	(four-sided . shape)))

(defun quality (x)
  "Returns the quality of a given property."
  (cdr (assoc x quality-table)))

(defun quality-difference (x y)
  "Returns the name of one quality that is different."
  (quality (first (differences x y))))

(defun contrast (x y)
  "Lists the differences in quality between objects and eliminates duplicates."
  (remove-duplicates
   (sublis quality-table (differences x y))))

(setf books
      '((capital karl-marx)
	(state-and-revolution vladimir-lenin)
	(republic plato)
	(prison-notebooks antonio-gramsci)
	(dialectic-of-enlightenment adorno-horkheimer)))

(defun who-wrote (x)
  "Returns the author given a book title."
  (rest (assoc x books)))

(setf books (reverse books))

(defun what-wrote (x)
  "Returns a book title given an author."
  (first (rassoc x books)))

(setf atlas
      '((pennsylvania pittsburgh)
	(new-jersey newark)
	(pennsylvania johnstown)
	(ohio columbus)
	(new-jersey princeton)
	(new-jersey trenton)))

(setf nerd-states
      '((sleeping . eating)
	(eating . waiting-for-a-computer)
	(waiting-for-a-computer . programming)
	(programming . debugging)
	(debugging . sleeping)))

(defun nerdus (x)
  "Returns the following state in the nerd life cycle given a state as input."
  (cdr (assoc x nerd-states)))

(defun sleepless-nerd (x)
  "Returns a state as before, but always skips sleeping and goes right to eating."
  (if (eq (nerdus x) 'sleeping) (nerdus (nerdus x)) (nerdus x)))

(defun nerd-on-caffeine (x)
  "Goes right from eating to programming to sleeping."
  (cond ((eq (nerdus x) 'waiting-for-a-computer) (nerdus (nerdus x)))
	((eq (nerdus x) 'debugging) (nerdus (nerdus x)))
	(t (nerdus x))))

(defun swap-first-last (x)
  "Swaps the first and last items in a list."
  (let* ((a (reverse (rest x)))
	 (b (reverse (rest a))))
    (cons (first a)
	  (append b (list (first x))))))

(defun rotate-left (x)
  "Rotates each item in a list to the left."
  (append (rest x) (list (first x))))

(defun rotate-right (x)
  (let ((r (reverse x)))
    (cons (first r)
	  (reverse (rest r)))))

(setf x '(1 2 3 4 5))
(setf y '(5 4 3 2 1))

(setf a
      '((a b c d)
       (b c d)
       (c d)
       (d)))

(defun translate (x)
  (second (assoc x words)))

(defun add1 (x)
  (+ x 1))

(setf daily-planet
      '((olsen jimmy 123-76-4535 cub-reporter)
	(kent clark 089-52-6787 reporter)
	(lane lois 951-26-1438 reporter)
	(white perry 355-16-7439 editor)))

(defun greater-than-5-p (x)
  (> x 5))

(defun boolp (x)
  (if (equal x t) t (if (equal x nil) t nil)))

(defun my-assoc (key table)
  "Rewrite of assoc using find-if."
  (find-if #'(lambda (entry)
	       (equal key (first entry)))
	   table))

(defun roughly-equal (e k)
  (and (not (< e (- k 10)))
       (not (> e (+ k 10)))))

(defun find-first-roughly-equal (x k)
  (find-if #'(lambda (e) (roughly-equal e k))
	   x))

(defun find-nested (x)
  (find-if #'consp x))

(setf note-table '((c . 1)
		   (c-sharp . 2)
		   (d . 3)
		   (d-sharp . 4)
		   (e . 5)
		   (f . 6)
		   (f-sharp . 7)
		   (g . 8)
		   (g-sharp . 9)
		   (a . 10)
		   (a-sharp . 11)
		   (b . 12)))

(defun numbers (note)
  (mapcar #'(lambda (entry)
	      (cdr (assoc entry note-table)))
	  note))

(defun notes (number)
  (mapcar #'(lambda (entry)
	       (car (rassoc entry note-table)))
	   number))

(defun raise (n music)
  (mapcar #'(lambda (entry)
	      (+ entry n))
	  music))

(defun normalize (music)
  "Maintains numbered note relationships when a note is raised out of it's octave."
  (mapcar #'(lambda (entry)
	      (cond ((> entry 12) (- entry 12))
		    ((< entry 1) (+ entry 12))
		    (t entry)))
	  music))

(defun transpose (n song)
  "Takes a list of notes, and returns a list of notes transposed by n half steps."
  (notes (normalize (raise n (numbers song)))))

(defun my-setdiff (x y)
  (remove-if #'(lambda (e) (member e y))
	     x))

(defun my-intersection (x y)
  (remove-if-not #'(lambda (n) (member n x)) y))

;;; Mini Keyboard Exercise: Manipulating Playing Cards with Applicative Operators.

(setf my-hand '((3 hearts)
		(5 clubs)
		(2 diamonds)
		(4 diamonds)
		(ace spades)))

(defun suit (x)
  (second x))

(defun rank (x)
  (car x))

(defun count-suit (x y)
  (length (remove-if-not #'(lambda (n)
			     (equal (suit n) x))
			 y)))

(setf colors '((clubs black)
	       (diamonds red)
	       (hearts red)
	       (spades black)))

(defun color-of (card)
  (second (find-if #'(lambda (e)
		       (equal (suit card) (car e)))
		   colors)))

(defun first-red (hand)
  (find-if #'(lambda (e)
	       (equal (color-of e) 'red))
	   hand))

(defun black-cards (hand)
  (remove-if-not #'(lambda (e)
		     (equal (color-of e) 'black))
		 hand))

(defun what-ranks (x y)
  (mapcar #'rank (remove-if-not #'(lambda (e)
		     (equal (suit e) x))
				y)))

(setf all-ranks '(2 3 4 5 6 7 8 9 10 jack queen king ace))

(defun beforep (x y l)
  "Returns true if X appears before Y in L"
  (member y (member x l)))

(defun nilp (x)
  (if (equal x nil) t nil))

(defun higher-rank-p (x y)
  (not (nilp (beforep (rank x) (rank y) all-ranks))))

(defun high-card (hand)
  (assoc (find-if #'(lambda (e)
	       (assoc e hand))
	   (reverse all-ranks))
	 hand))

(defun high-card2 (hand)
  (reduce #'(lambda (card1 card2)
	      (if (higher-rank-p card1 card2)
		  card1
		  card2))
	  hand))

(defun total-length (x)
  (length (reduce #'append x)))

(defun all-odd (x)
  (every #'oddp x))

(defun none-odd (x)
  (every #'evenp x))

(defun not-all-odd (x)
  (not (every #'oddp x)))

(defun not-none-odd (x)
  (not (every #'evenp x)))


;;; Keyboard Exercise Chapter 7

(setf database
      '((b1 shape brick)
	(b1 color green)
	(b1 size small)
	(b1 supported-by b2)
	(b1 supported-by b3)
	(b2 shape brick)
	(b2 color red)
	(b2 size small)
	(b2 supports b1)
	(b2 left-of b3)
	(b3 shape brick)
	(b3 color red)
	(b3 supports b1)
	(b3 right-of b2)
	(b4 shape pyramid)
	(b4 color blue)
	(b4 size large)
	(b4 supported-by b5)
	(b5 shape cube)
	(b5 color green)
	(b5 size large)
	(b5 supports b4)
	(b6 shape brick)
	(b6 color purple)
	(b6 size large)))

(defun match-element (x y)
  (cond ((equal x y) t)
	((or (equal x '?) (equal y '?)) t)
	(t nil)))

(defun match-triple (x y)
  (every #'match-element x y))

(defun fetch (x)
  (remove-if-not #'(lambda (e)
	       (match-triple e x))
		 database))

(defun what-color (x)
  (list x 'color '?))

(defun supporters (x)
  "Returns a list of the blocks that are supporting the block passed into the function."
  (mapcar #'(lambda (e)
	      (third e))
	  (fetch (list x 'supported-by '?))))

(defun supp-cube (x)
  "Returns true if the supporting block is a cube."
  (not (nilp (member 'cube
	  (mapcar
	   #'(lambda (b) (third (first (fetch
					(list b 'shape '?)))))
	   (supporters x))))))

(defun desc1 (x)
  "Returns all assertions dealing with particular block."
  (fetch (list x '? '?)))

(defun desc2 (x)
  "Strips block name off of each list item."
  (mapcar #'rest (desc1 x)))

(defun description (x)
  "Produces a list with all the descriptions of a particular block."
  (reduce #'append (desc2 block)))

(defun inalienable-rights (fn)
  "An example of a user-defined applicative operator."
  (funcall fn
	   '(life liberty and the pursuit of happiness)))

(defun anyoddp (x)
  "A recursive function to search for odd numbers in a list."
  (cond ((null x) nil)
	((oddp (first x)) t)
	(t (anyoddp (rest x)))))

(defun anyoddp2 (x)
  "anyoddp implemented using if instead of cond."
  (if (null x) nil (if (oddp (first x)) t (if t (anyoddp (rest x))))))

(defun fact (n)
  "A naive factorial function. Maximum before stack overload = 63419"
  (cond ((zerop n) 1)
        ((equal n 1) 1)
	((equal n 2) 2)
	((equal n 3) 6)
	((equal n 4) 24)
	((equal n 5) 120)
	((equal n 6) 720)
	(t (* n (fact (- n 1))))))

(defun count-slices (loaf)
  "A recursive function for 'counting slices of bread'."
  (cond ((null loaf) 0)
	(t (+ 1 (count-slices (rest loaf))))))

(defun laugh (n)
  "A program to return n 'HA's in a list."
  (cond ((zerop n) nil)
	(t (cons 'HA (laugh (- n 1))))))

(defun add-up (x)
  "A function to add up all the numbers of a list recursively."
  (cond ((zerop (length x)) 0)
	(t (+ (car x) (add-up (rest x))))))

(defun alloddp (x)
  "A function that recursively checks if every element of a list is an odd number."
  (cond ((zerop (length x)) t)
	((evenp (first x)) nil)
	(t (alloddp (rest x)))))

(defun rec-member (x y)
  "A recursive implementation of the built-in MEMBER function."
  (cond ((zerop (length y)) nil)
	((equal x (first y)) y)
	(t (rec-member x (rest y)))))

(defun rec-assoc (key table)
  "A recursive implementation of the built-in ASSOC function."
  (cond ((null x) nil)
	((equal key (car (first table)))
	 (first table))
	(t (rec-assoc key (rest table)))))

(defun rec-nth (n x)
  "A recursive implementation of the built-in NTH function."
  (cond ((zerop n) (first x))
	(t (rec-nth (- n 1) (rest x)))))

(defun add1 (x)
  (+ x 1))

(defun sub1 (x)
  (- x 1))

(defun rec-plus (x y)
  "A recursively defined implementation of the + function."
  (cond ((zerop y) x)
	(t (rec-plus (add1 x) (sub1 y)))))

(defun bad-fib (n)
  (+ (bad-fib (- n 1))
     (bad-fib (- n 2))))

(defun fib (n)
  "A naive fibonacci number function."
  (cond ((equal n 0) 1)
	((equal n 1) 1)
	(t (+ (fib (- n 1)) (fib (- n 2))))))


(defun c (n)
  (cond ((equal n 1) t)
	((evenp n) (c (/ n 2)))
	(t (c (+ (* 3 n) 1)))))

(defun any-7-p (x)
  (cond ((equal (first x) 7) t)
	(t (any-7-p (rest x)))))

(defun inf (x)
  (inf x))

(defun find-first-odd (x)
  "Finds the first odd number in a list."
  (cond ((null x) nil)
	((oddp (first x)) (first x))
	(t (find-first-odd (rest x)))))

(defun find-first-atom (x)
  (cond ((atom x) x)
	(t (find-first-atom (first x)))))

(defun last-element (x)
  (cond ((atom x) x)
	(t (last-element (rest x)))))

(defun add-nums (n)
  "Adds numbers from n approaching 0)"
  (cond ((equal n 0) 0)
	((not (plusp n)) (+ n (add-nums (+ n 1))))
	(t (+ n (add-nums (- n 1))))))

(defun negp (n)
  "Predicate for negative numbers."
  (not (plusp n)))

(defun count-down (n)
  "Makes a list counting down from n using list-consing recursion."
  (cond ((< n 0) nil)
	;;;((negp n) (cons n (count-down (+ n 1))))
	(t (cons n (count-down (- n 1))))))

(defun my-nth (n x)
  "Example of simultaneous recursion over multiple variables."
  (cond ((zerop n) (first x))
	(t (my-nth (- n 1) (rest x)))))

(defun extract-symbols (x)
  "Example of conditional augmentation."
  (cond ((null x) nil)
	((symbolp (first x))
	 (cons (first x)
	       (extract-symbols (rest x))))
	(t (extract-symbols (rest x)))))

(defun fib (n)
  "A prototypical multiple recursive fibonacci function."
  (cond ((equal n 0) 1)
	((equal n 1) 1)
	(t (+ (fib (- n 1))
	      (fib (- n 2))))))

(defun find-number (x)
  "An example of CAR/CDR Recursion."
  (cond ((numberp x) x)
	((atom x) nil)
	(t (or (find-number (car x))
	       (find-number (cdr x))))))

(defun atoms-to-q (x)
  "Example of CAR/CDR multiple recursion."
  (cond ((null x) nil)
	((atom x) 'q)
	(t (cons (atoms-to-q (car x))
		 (atoms-to-q (cdr x))))))
			
(defun count-atoms (tree)
  "Counts the number of atoms in a tree."
  (cond ((atom tree) 1)
	(t (+ (count-atoms (car tree))
	      (count-atoms (cdr tree))))))

(defun count-cons (tree)
  "Counts the number of cons cells in a tree."
  (cond ((atom tree) 0)
	(t (+ 1
	      (count-cons (car tree))
	      (count-cons (cdr tree))))))

(defun sum-tree (tree)
  "Sums all the numbers in a tree."
  (cond ((numberp tree) tree)
	((symbolp tree) 0)
	(t (+ (sum-tree (car tree))
	      (sum-tree (cdr tree))))))

(defun my-subst (new old tree)
  "Replaces one type of atom with another in a tree."
  (cond ((equal old tree) new)
	((atom tree) tree)
	(t (cons (my-subst new old (car tree))
		 (my-subst new old (cdr tree))))))

(defun flatten (tree)
  "Returns all the elements of an arbitrarily nested list in a single-level list."
  (cond ((atom tree) (list tree))
	(t (append (flatten (car tree))
		   (flatten (cdr tree))))))

(defun tree-depth (tree)
  "Returns the depth of an arbitrarily nested list."
  (cond ((atom tree) 0)
	(t (+ 1 (max (tree-depth (car tree))
		     (tree-depth (cdr tree)))))))

(defun paren-depth (list)
  "Returns the paren depth of individual elements of a list."
  (cond ((atom list) 0)
	(t (max (+ 1 (paren-depth (first list)))
		(paren-depth (rest list))))))

(defun count-up (n)
  (count-up-recursively 1 n))

(defun count-up-recursively (cnt n)
  (cond ((> cnt n) nil)
	(t (cons cnt (count-up-recursively (+ cnt 1) n)))))

(defun count-up2 (cnt n)
  "Implements count-up without a helping function."
  (cond ((> cnt n) nil)
	(t (append (list cnt) (count-up2 (+ cnt 1) n)))))

(defun make-loaf (n)
  "Different breads for different heads."
  (if (> n 0) (append (list 'X) (make-loaf (- n 1))) nil))

(defun bury (item n)
  "'Buries' an item under n levels of parens."
  (cond ((zerop n) item)
	(t (list (bury item (- n 1))))))

(defun fact (n)
  (cond ((zerop n) (break "N is zero."))
	(t (* n (fact (- n 1))))))

(defun pairings (x y)
  (cond ((null x) nil)
	(t (cons (list (first x) (first y))
		 (pairings (rest x)
			   (rest y))))))

(defun sublists (x)
  (cond ((null x) nil)
	(t (cons x (sublists (rest x))))))

(defun my-reverse (x)
  (reverse-recursively x nil))

(defun reverse-recursively (x y)
  (cond ((null x) y)
	(t (reverse-recursively (rest x)
				(cons (first x) y)))))

(defun my-union (x y)
  (append x (union-recursively x y)))

(defun union-recursively (x y)
  (cond ((null y) nil)
	((member (first y) x)
	 (union-recursively x (rest y)))
	(t (cons (first y)
		 (union-recursively
		  x
		  (rest y))))))

(defun largest-even (x)
  (cond ((null x) 0)
	((oddp (first x))
	 (largest-even (rest x)))
	(t (max (first x)
		(largest-even (rest x))))))

(defun huge (x)
  (huge-helper x x))

(defun huge-helper (x n)
  (cond ((equal n 0) 1)
	(t (* x (huge-helper x (- n 1))))))

;;;Chapter 8 Keyboard Exercise.

(setf family
      '((colin nil nil)
	(deirdre nil nil)
	(arthur nil nil)
	(kate nil nil)
	(frank nil nil)
	(linda nil nil)
	(suzanne colin deirdre)
	(bruce arthur kate)
	(charles arthur kate)
	(david arthur kate)
	(ellen arthur kate)
	(george frank linda)
	(hillary frank linda)
	(andre nil nil)
	(tamara bruce suzanne)
	(vincent bruce suzanne)
	(wanda nil nil)
	(ivan george ellen)
	(julie george ellen)
	(marie george ellen)
	(nigel andre hillary)
	(frederick nil tamara)
	(zelda vincent wanda)
	(joshua ivan wanda)
	(quentin nil nil)
	(robert quentin julie)
	(olivia nigel marie)
	(peter nigel marie)
	(erica nil nil)
	(yvette robert zelda)
	(diane peter erica)))

(defun father (x)
  (second (assoc x family)))

(defun mother (x)
  (third (assoc x family)))

(defun parents (x)
  (union (and (father x) (list (father x)))
	 (and (mother x) (list (mother x)))))

(defun children (parent)
  (and parent
       (mapcar #'first
	       (remove-if-not
		#'(lambda (entry)
		    (member parent (rest entry)))
		family))))

(defun siblings (x)
  (set-difference (union (children (father x))
			 (children (mother x)))
		  (list x)))

(defun mapunion (fn x)
  (reduce #'union (mapcar fn x)))

(defun grandparents (x)
  (mapunion #'parents (parents x)))

(defun cousins (x)
  (mapunion #'children
	    (mapunion #'siblings (parents x))))

(defun descended-from (p1 p2)
  (cond ((null p1) nil)
	((member p2 (parents p1)) t)
	(t (or (descended-from (father p1) p2)
	       (descended-from (mother p1) p2)))))

(defun ancestors (x)
  (cond ((null x) nil)
	(t (union
	    (parents x)
	    (union (ancestors (father x))
		   (ancestors (mother x)))))))

(defun generation-gap (x y)
  (g-gap-helper x y 0))

(defun g-gap-helper (x y n)
  (cond ((null x) nil)
	((equal x y) n)
	(t (or (g-gap-helper
		(father x) y (1+ n))
	       (g-gap-helper
		(mother x) y (1+ n))))))

(defun tr-count-slices (loaf)
  (tr-cs1 loaf 0))

(defun tr-cs1 (loaf n)
  (cond ((null loaf) n)
	(t (tr-cs1 (rest loaf) (+ n 1)))))

(defun my-reverse (x)
  (cond ((null x) nil)
	(t (append (reverse (rest x))
		   (list (first x))))))

(defun tr-reverse (x)
  (tr-rev1 x nil))

(defun tr-rev1 (x result)
  (cond ((null x) result)
	(t (tr-rev1 (rest x)
		    (cons (first x) result)))))

(defun tr-count-up (x)
  "A tail-recursive implementation of the count-up function."
  (tr-count-up1 x 1))

(defun tr-count-up1 (x n)
  "The part that does the work."
  (cond ((> n x) nil)
	(t (cons n (tr-count-up1 x (+ n 1))))))


(defun tr-fact (x)
  "Tail-recursive implementation of the factorial function."
  (tr-fact1 x 1))

(defun tr-fact1 (n result)
  (cond ((zerop n) result)
	(t (tr-fact1 (- n 1) (* n result)))))

(defun tr-union (x y)
  "Tail-recursive implementation of Union function."
  (cond ((null x) y)
	((member (first x) y)
	 (tr-union (rest x) y))
	(t (tr-union
	    (rest x)
	    (cons (first x) y)))))

(defun my-mapcar (fn x)
  (cond ((null x) nil)
	(t (cons (funcall fn (first x))
		 (my-mapcar fn (rest x))))))

(defun tree-find-if (pred tree)
  "Returns the first non-nil atom of a tree that satisfies a predicate."
  (cond ((and tree
	      (atom tree)
	      (funcall pred tree))
	 tree)
	((atom tree) nil)
	(t (or (tree-find-if
		pred (car tree))
	       (tree-find-if
		pred (cdr tree))))))
	
(defun count-up (n)
  "Demonstration of the LABELS special function."
  (labels ((count-up-recursively (cnt)
	     (if (> cnt n) nil
		 (cons cnt
		       (count-up-recursively
			(+ cnt 1))))))
    (count-up-recursively 1)))

(defun count-slices (loaf)
  (labels ((tr-count-slices (n)
	     (cond ((null loaf) n)
		   (t (tr-count-slices (+ n 1))))))
    (tr-count-slices 0)))
	     


defun tr-count-slices (loaf)
  (tr-cs1 loaf 0))

(defun tr-cs1 (loaf n)
  (cond ((null loaf) n)
	(t (tr-cs1 (rest loaf) (+ n 1)))))

(defun mary ()
  (format t "~&Mary had a little bat.")
  (format t "~&Its wings were long and brown.")
  (format t "~&And everywhere that Mary went")
  (format t "~&The bat went, upside-down."))

(defun square-talk (n)
  "Returns NIL, but displays a string with the square value as a side effect."
  (format t "~&~S squared is ~S" n (* n n)))

;;; Exercise 9.1

(defun pilots ()
  "Prints some text using line breaks."
  (format t "There are old pilots,")
  (format t "~&and there are bold pilots,")
  (format t "~&but there are no old bold pilots."))

;;; Exercise 9.2
;;; Write a recursive function DRAW-LINE that draws a line
;;; of a specified length by doing (FORMAT T "*") the
;;; correct number of times.

(defun draw-line (n)
  "Draws a line of specified length."
  (cond ((> 1 n) (format t "~&"))
	(t (cons (format t "*") (draw-line (- n 1))))))

;;; Exercise 9.3
;;; Write a recursive function DRAW-BOX that calls DRAW-LINE
;;; repeatedly to draw a box of specified dimensions.

(defun draw-box (x y)
  "Calls the draw-line function of length x y times."
  (cond ((> 1 y) nil)
	(t (cons (draw-line x) (draw-box x (- y 1))))))

;;; Exercise 9.4
;;; Write a recursive function NINETY-NINE-BOTTLES that
;;; sings the well-known song "Ninety-nine Bottles of Beer
;;; on the Wall." The function should take a number n as
;;; input and start counting down from N to zero.

(defun ninety-nine-bottles (n)
  "Counts down with the beer bottle song."
  (cond ((> 1 n) (format t "~&All out of beer."))
	(t (cons (format t "~&~A bottles of beer on the wall,~&~A bottles of beer!~&Take one down,~&Pass it around,~&~A bottles of beer on the wall." n n (- n 1))
		 (ninety-nine-bottles (- n 1))))))

;;; Exercise 9.5
;;; Write a function PRINT-BOARD that takes a list
;;; of nine elements as input. Each element will be
;;; an X, an O, or NIL. PRINT-BOARD should display
;;; the corresponding board.

(defun print-board (b)
  (let ((b2 (sublis '((x . "X")
		      (o . "O")
		      (nil . " "))
		    b)))
    (format t "~&")
    (print-line b2)
    (format t "-----------~%")
    (print-line (nthcdr 3 b2))
    (format t "-----------~%")
    (print-line (nthcdr 6 b2))))

(defun print-line (line)
  (format t " ~A | ~A | ~A~%"
	  (first line)
	  (second line)
	  (third line)))

(defun my-square ()
  (format t "Please type in a number: ")
  (let ((x (read)))
    (format t "The number ~S squared is ~S.~%"
	    x (* x x))))

;;; Exercise 9.6
;;; Write a function to compute an hourly worker's gross
;;; pay given an hourly wage in dollars and the number of
;;; hours he or she worked.

(defun gross-pay ()
  (format t "Please enter hourly wage: ")
  (let ((wage (read)))
    (format t "Please enter hours worked: ")
    (let ((hours (read)))
      (format t "~&Gross Pay : $~A" (* hours wage)))))

;;; Exercise 9.7
;;; The COOKIE-MONSTER function keeps reading data
;;; from the terminal until it reads the symbol COOKIE.
;;; Write COOKIE-MONSTER.

(defun cookie-monster ()
  "Cookie monster in terminal form."
  (format t "~&Give me cookie!!!")
  (format t "~&Cookie? ")
  (let ((item (read)))
    (if (equal item 'cookie)
	(format t "~&Thank you!...Munch munch munch...BURP")
	(format t "~&No want ~A..." item))))

(defun riddle ()
  (if (yes-or-no-p
       "Do you seek Zen enlightenment? ")
      (format t "Then do not ask for it.")
      (format t "You have found it.")))

;;; Section 9.6: Reading Files with WITH-OPEN-FILE

(defun get-tree-data ()
  "Reads some information from a text file."
  (with-open-file (stream "~/Desktop/Lisp/new-timber.dat")
    (let* ((tree-loc (read stream))
	   (tree-table (read stream))
	   (num-trees (read stream)))
      (format t "~&There are ~S trees on ~S."
	      num-trees tree-loc)
      (format t "~&They are: ~S" tree-table))))

;;; Section 9.7: Writing files with WITH-OPEN-FILE
;;; Use the special keyword argument :DIRECTION :OUTPUT

(defun save-tree-data (tree-loc tree-table num-trees)
  "Writes to a new file."
  (with-open-file (stream "~/Desktop/Lisp/new-timber.dat"
			  :direction :output)
    (format stream "~S~%" tree-loc)
    (format stream "~S~%" tree-table)
    (format stream "~S~%" num-trees)))

;;; Chapter 9 Keyboard Exercise

;;; 9.10: Write a recursive function SPACE-OVER that takes a
;;; number N as input and moves the cursor to the right by
;;; printing N spaces, one at a time. "Should print "ERROR!"
;;; if N is negative.

(defun space-over (n)
  "Recursive function that prints n spaces. Does not take negative n."
  (cond	((plusp n)
	 (format t " ")
	 (space-over (- n 1)))
	((zerop n) nil)
	(t (format t "Error!"))))

(defun test (n)
  (format t "~%>>>")
  (space-over n)
  (format t "<<<"))

(defun plot-one-point (plotting-string y-val)
  "Prints plotting-string in column y-val then moves to a new line."
  (space-over y-val)
  (format t "~A~%" plotting-string))

(defun plot-points (plotting-string y-values)
  "Prints plotting string over list of y-values."
  (mapcar #'(lambda (e)
	      (plot-one-point plotting-string e))
	  y-values))

(defun generate (m n)
  "Returns a list of integers from M to N, M < N."
  (cond ((equal m (+ n 1)) nil)
	(t (cons m (generate (+ m 1) n)))))

(defun make-graph ()
  "Makes a graph with text characters."
  (let* ((func (prompt-for "Function to graph: "))
	 (start (prompt-for "Starting x: "))
	 (end (prompt-for "Ending x: "))
	 (plotting-string (prompt-for "Plotting string: ")))
    (plot-points plotting-string
		 (mapcar func (generate start end)))
    t))

(defun prompt-for (prompt-string)
  (format t "~A" prompt-string)
  (read))

(defun square (x)
  (* x x))

(defun print-one-name (name)
  (format t "~&~10S ~S"
	  (second name)
	  (first name)))

(defun print-all-names (x)
  (mapcar #'print-one-name x)
  'done)

(defun sevenths (x)
  (mapcar #'(lambda (numerator)
	      (format t "~&~4,2F / 7 is ~7,5F"
		      numerator
		      (/ numerator 7.0)))
	  x)
  'done)

(defun my-print (x)
  (terpri)
  (prin1 x)
  (princ " ")
  x)

(defun read-my-file ()
  "Reads objects out of a file of arbitrary length."
  (with-open-file (stream "~/Desktop/Lisp/new-timber.dat")
    (let ((contents (read-all-objects stream (list '$eof$))))
      (format t "~&Read ~S objects from the file."
	      (length contents))
      contents)))

(defun read-all-objects (stream eof-indicator)
  "Reads the objects out of a stream object."
  (let ((result (read stream nil eof-indicator)))
    (if (eq result eof-indicator)
	nil
	(cons result (read-all-objects stream eof-indicator)))))

(defun sell (n)
  "Ye Olde Lemonade Stand: Sales by the Glass."
  (setf *total-glasses* (+ *total-glasses* n))
  (format t "~&That makes ~A glasses so far today." *total-glasses*))

(defun sell-inc (n)
  "Lemonade stand using incf macro instead of setf."
  (incf *total-glasses* n)
  (format t "~&That makes ~A glasses so far today." *total-glasses*))

(defun meet (person)
  (cond ((equal person (first *friends*))
	 'we-just-met)
	((member person *friends*)
	 'we-know-each-other)
	(t (push person *friends*)
	   'pleased-to-meet-you)))

(defun forget (person)
  (cond ((not (member person *friends*)) 'Imaginary)
	(t (setf *friends* (remove person *friends*)))))

(defun bad-style (n)
  (format t "~&N is ~S." n)
  (decf n 2)
  (format t "~&Now N is ~S." n)
  (decf n 2)
  (format t "~&Now N is ~S." n)
  (list 'result 'is (* n (- n 1))))

(defun good-style (n)
  (let* ((p (- n 2))
	 (q (- p 2)))
    (format t "~&N is ~S." n)
    (format t "~&P is ~S." p)
    (format t "~&Q is ~S." q)
    (list 'result 'is (* q (- q 1)))))

(defun get-name ()
  (let ((last-name nil)
	(first-name nil)
	(middle-name nil)
	(title nil))
    (format t "~&Last name? ")
    (setf last-name (read))
    (format t "~&First name? ")
    (setf first-name (read))
    (format t "~&Middle name or initial? ")
    (setf middle-name (read))
    (format t "~&Preferred title? ")
    (setf title (read))
    (list title first-name middle-name last-name)))

(defun picky-multiply (x y)
  "Computes X times Y. X must be odd, Y must be even."
  (unless (oddp x)
    (incf x)
    (format t
	    "~&Changing X to ~S to make it odd." x))
  (when (oddp y)
    (decf y)
    (format t
	    "~&Changing Y to ~S to make it even." y))
  (* x y))

;;; Section 10.6: Case Study: Tic-tac-toe Player

(defun make-board ()
  (list 'board 0 0 0 0 0 0 0 0 0))

(defun convert-to-letter (v)
  (cond ((equal v 1) "O")
	((equal v 10) "X")
	(t " ")))

(defun print-row (x y z)
  (format t "~& ~A | ~A | ~A "
	  (convert-to-letter x)
	  (convert-to-letter y)
	  (convert-to-letter z)))

(defun print-board (board)
  (format t "~%")
  (print-row
   (nth 1 board) (nth 2 board) (nth 3 board))
  (format t "~&    -----------")
  (print-row
   (nth 4 board) (nth 5 board) (nth 6 board))
  (format t "~&    -----------")
  (print-row
   (nth 7 board) (nth 8 board) (nth 9 board))
  (format t "~%~%"))

(setf b (make-board))

(defun make-move (player pos board)
  (setf (nth pos board) player)
  board)

(setf *computer* 10)

(setf *opponent* 1)

(setf *triplets*
      '((1 2 3) (4 5 6) (7 8 9)
	(1 4 7) (2 5 8) (3 6 9)
	(1 5 9) (3 5 7)))

(defun sum-triplet (board triplet)
  (+ (nth (first triplet) board)
     (nth (second triplet) board)
     (nth (third triplet) board)))

(defun compute-sums (board)
  (mapcar #'(lambda (triplet)
	      (sum-triplet board triplet))
	  *triplets*))

(defun my-nconc (x y)
  (cond ((null x) y)
	(t (setf (cdr (last x)) y)
	   x)))

(defun fact (n)
  (cond ((equal n 1) 1)
	(t (* n (fact (- n 1))))))

(defun fib (n)
  (cond ((equal n 0) 0)
	((equal n 1) 1)
	(t (+ (fib (- n 1)) (fib (- n 2))))))

(defun towers-of-hanoi (n)
  "Recursive function for computing optimal number of moves for Tower of Hanoi."
  (cond ((equal n 1) 1)
	(t (+ 1 (* 2 (towers-of-hanoi (- n 1)))))))

(defun fib-closed (n)
  "Closed form version of Fibonacci sequence."
  (* (/ 1 (sqrt 5)) (- (expt (/ (+ 1 (sqrt 5)) 2) n) (expt (/ (- 1 (sqrt 5)) 2) n)))) 

;;; Section 11.3: Exiting the Body of a Loop

(defun find-first-odd (list-of-numbers)
  "Finds the first odd number in a list of numbers using interation."
  (dolist (e list-of-numbers)
    (format t "~&Testing ~S. . ." e)
    (when (oddp e)
      (format t "found an odd number.")
      (return e))))

(defun check-all-odd (list-of-numbers)
  (dolist (e list-of-numbers t)
    (format t "~&Checking ~S. . . " e)
    (if (not (oddp e)) (return nil))))

(defun it-member (item list-of-items)
  "An iterative implementation of member."
  (dolist (e list-of-items nil)
    (if (equal e item) (return t))))

(defun it-assoc (key table)
  (dolist (entry table)
    (when (equal key (first entry))
      (return entry))))

(defun r-check-all-odd (x)
  "Recursive version of check-all-odd."
  (cond ((null x) t)
	(t (format t "~&Checking ~S..."
		   (first x))
	   (unless (evenp (first x))
	     (r-check-all-odd (rest x))))))

;;; Section 11.4: Comparing Recursive and Iterative Search

(defun rec-ffo (x)
  "Recursively find first odd number in a list."
  (cond ((null x) nil)
	((oddp (first x)) (first x))
	(t (rec-ffo (rest x)))))

(defun it-ffo (list-of-numbers)
  "Iteratively find first odd number in a list."
  (dolist (e list-of-numbers)
    (if (oddp e) (return e))))

(defun it-fact (n)
  "Iterative version of factorial function."
  (let ((prod 1))
    (dotimes (i n prod)
      (setf prod (* prod (+ i 1))))))

(defun it-intersection (x y)
  "Iterative version of set intersection function."
  (let ((result-set nil))
    (dolist (element x result-set)
      (when (member element y)
	(push element result-set)))))

(defun app-square-list (list-of-numbers)
  "Square the numbers in a list."
  (mapcar #'(lambda (n) (* n n))
	  list-of-numbers))

(defun rec-square-list (x)
  "Recursively square the numbers in a list."
  (cond ((null x) nil)
	(t (cons (* (first x) (first x))
		 (rec-square-list (rest x))))))

(defun it-square-list (list-of-numbers)
  "Iteratively square the numbers in a list."
  (let ((result nil))
    (dolist (e list-of-numbers (nreverse result)) ; destructive reverse for final output.
      (push (* e e) result))))

(defun launch (n)
  (do ((cnt n (- cnt 1)))
      ((zerop cnt) (format t "Blast off!"))
    (format t "~S..." cnt)))

(defun count-slices (loaf)
  (do ((cnt 0 (+ cnt 1))
       (z loaf (rest z)))
      ((null z) cnt)))

(defun fact (n)
  (do ((i n (- i 1))
       (result 1 (* result i)))
      ((zerop i) result)))
	  
(defun it-intersection (x y)
  "Illustrates a bad time to try to do work in update expressions."
  (do ((x1 x (rest x))
       (result nil (if (member (first x1) y)
		       (cons (first x1) result)
		       result)))
      ((null x) result)))

(defun it-intersection2 (x y)
  "Here is a better way to implement the above function."
  (do ((x1 x (rest x1))
       (result nil))
      ((null x1) result)
    (when (member (first x1) y)
      (push (first x1) result))))

(defun find-matching-elements (x y)
  "Search X and Y for elements that match."
  (do ((x1 x (rest x1))
       (y1 y (rest y1)))
      ((or (null x1) (null y1)) nil)
    (if (equal (first x1)
	       (first y1))
	(return (first x1)))))


(defun ffo-with-do (list-of-numbers)
  "Find first odd using DO."
  (do ((x list-of-numbers (rest x)))
      ((null x) nil)
    (if (oddp (first x)) (return (first x)))))

(defun ffo-with-do* (list-of-numbers)
  "Find first odd using DO*."
  (do* ((x list-of-numbers (rest x))
	(e (first x) (first x)))
       ((null x) nil)
    (if (oddp e) (return e))))

(defun read-a-number ()
  "Asks the user to type a number, will not terminate until it gets one."
  (do ((answer nil))
      (nil)
    (format t "~&Please type a number: ")
    (setf answer (read))
    (if (numberp answer)
	(return answer))
    (format t "~&Sorry, ~S is not a number. Try again." answer)))

(defun alert (x)
  "Raises alert level on Starship structure objects."
  (setf (starship-shields x) 'up)
  (if (equal (starship-condition x) 'green)
      (setf (starship-condition x) 'yellow))
  'shields-raised)

(defun addprop (sym elem prop)
  (pushnew elem (get sym prop)))

(defun record-meeting (x y)
  (addprop x y 'has-met)
  (addprop y x 'has-met)
  t)

(defmacro ppmx (form)
  "Pretty Prints Macro eXpansions of the form."
  `(let* ((exp1 (macroexpand-1 ',form))
	  (exp (macroexpand exp1))
	  (*print-circle* nil))
     (cond ((equal exp exp1)
	    (format t "~&Macro expansion:")
	    (pprint exp))
	   (t (format t "~&First step of expansion:")
	      (pprint exp1)
	      (format t "~%~%Final expansion:")
	      (pprint exp)))
     (format t "~%~%")
     (values)))

(defmacro simple-incf (var)
  (list 'setq var (list '+ var 1)))

(defmacro simple-incf2 (var &optional (amount 1))
  (list 'setq var (list '+ var amount)))

(defmacro simple-incf3 (var &optional (amount 1))
  `(setq ,var (+ ,var ,amount)))


