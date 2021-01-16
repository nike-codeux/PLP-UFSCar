(defun lesseq (N L)
   (if (null L)
      nil
      (if (<= (first L) N)
	       (cons (first L)
	           (lesseq N (rest L))
	       )
	       (lesseq N (rest L))
      )
    )
)

(defun greater (N L)
   (if (null L)
      nil
      (if (> (first L) N)
	       (cons (first L)
	           (greater N (rest L))
	       )
	       (greater N (rest L))
      )
   )
)

(defun sortnums(L)
   (if (null L)
      nil
      (append (sortnums (lesseq (first L) (rest L)) )
      (cons (first L) nil)
      (sortnums (greater (first L) (rest L)) )
      )
    )
)

