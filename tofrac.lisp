#!/usr/bin/cl --entry main

                                        ; Convert decimal number to fraction in lowest terms.


(defun help () (format t "Print decimal numbers as fractions in lowest terms.~%") (exit))

(defun read-float (str)
  (let ((res (read-from-string str)))
    (if (realp res)
        res
        nil)))

(defun doit (argv)
  (dolist (elt argv)
    (let ((val (read-float elt)))
      (if val
          (progn (princ (rationalize val)) (terpri))
          (format *error-output* "tofrac: ~G not a number.~%" elt)))))

(defun main (argv)
  (cond ((= (length argv) 0) (help))
        ((= (length argv) 1)
         (if (or (equal (car argv) "-h")
                 (equal (car argv) "--help"))
             (help)
             (doit argv)))
        (t (doit argv))))
