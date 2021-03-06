;;;; NOT
(define (not b) (if b #f #t))
(define = eq?)

;; NUMBERS
(define (zero? x) (= x 0))
(define (even? x) (= 0 (modulo x 2)))
(define (odd? x) (not (even? x)))
(define (positive? x) (> x 0))
(define (negative? x) (< x 0))
(define (abs x) (if (negative? x) (- 0 x) x))
(define (min x y) (if (< x y) x y))
(define (max x y) (if (> x y) x y))

;;;; PRINT
(define (print p) (display p) (newline))

;;;; EQUAL
(define (equal? x y)
;; TODO: string equality
  (if (pair? x)
      (if (pair? y)
	  (if (equal? (car x) (car y))
	      (equal? (cdr x) (cdr y))
	      #f)
	  #f)
      (eq? x y)))


;;;; CXR
(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

(define (caaar x) (car (car (car x))))
(define (caadr x) (car (car (cdr x))))
(define (cadar x) (car (cdr (car x))))
(define (caddr x) (car (cdr (cdr x))))
(define (cdaar x) (cdr (car (car x))))
(define (cdadr x) (cdr (car (cdr x))))
(define (cddar x) (cdr (cdr (car x))))
(define (cdddr x) (cdr (cdr (cdr x))))

(define (cadddr x) (car (cdddr x)))
(define (cddddr x) (cdddr (cdr x)))
(define (cadadr x) (cadar (cdr x)))
(define (cddadr x) (cdr (cdr (car (cdr x)))))

;;;; LIST
(define (map f l)
  (if (null? l)
      '()
      (cons (f (car l))
            (map f (cdr l)))))

(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(define (revappend l r)
  (if (null? l)
      r
      (revappend (cdr l) (cons (car l) r))))

(define (reverse l) (revappend l '()))

(define (filter p l)
  (if (null? l)
      '()
      (if (p (car l))
          (cons (car l) (filter p (cdr l)))
          (filter p (cdr l)))))

(define (member elt lst)
  (if (null? lst)
      #f
      (if (equal? elt (car lst))
          #t
          (member elt (cdr lst)))))

(define (fold kons knil lst)
  (if (null? lst)
      knil
      (kons (car lst)
	    (fold kons knil (cdr lst)))))

(define (replicate n elt)
  (if (= n 0) '() (cons elt (replicate (- n 1) elt))))

(define (foldl f a xs)
  (if (null? xs)
      a
      (foldl f (f a (car xs)) (cdr xs))))

(define (minimum xs)
  (if (pair? xs)
      (foldl min (car xs) (cdr xs))
      #f))

(define (maximum xs)
  (if (pair? xs)
      (foldl max (car xs) (cdr xs))
      #f))

(define (sum lst) (foldl + 0 lst))
