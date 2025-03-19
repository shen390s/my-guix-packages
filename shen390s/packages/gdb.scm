(define-module (shen390s packages gdb)
  #:use-module (gnu packages gdb)
  #:use-module           (guix packages)
  #:use-module     (guix utils)
  #:use-module           (guix build-system gnu))

(define-public gdb-with-guile
  (package
   (inherit gdb)
   (name "gdb-with-guile")
   (arguments
    (substitute-keyword-arguments (package-arguments gdb)
				  ((#:configure-flags flags)
				   `(cons "--with-guile" ,flags))))))

