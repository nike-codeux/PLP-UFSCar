(defun flat(L)
    (cond ((null L) nil)
          ((atom (first L)) (cons (first L) (flat (rest L))))
          (t (append (flat (first L)) (flat (rest L))))
    )
)

(defun shutdown(E L)
   (cond ((null L) nil)
         ((eq E (first L)) (shutdown E (rest L)))
         (t (cons (first L) (shutdown E (rest L))))
   )
)

(defun cnt(E L)
   (cond ((null L) 0)
         ((eq E (first L)) (+ 1 (cnt E (rest L))))
         (t (cnt E (rest L)))
   )
)

(defun pairs(L)
   (do ((Laux (flat L) (shutdown (first Laux) Laux)) (res ()))
       ((null Laux) res)
       (setq res (append res (list (list (first Laux) (cnt (first Laux) Laux)))))
   )
)


