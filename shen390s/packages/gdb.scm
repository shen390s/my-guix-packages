(use-modules (gnu packages gdb)
             (guix packages)
	     (guix utils)
             (guix build-system gnu))

(define gdb-with-guile
  (package
    (inherit gdb)
    (name "gdb-with-guile")
    (arguments
     (substitute-keyword-arguments (package-arguments gdb)
       ((#:configure-flags flags)
        `(cons "--with-guile" ,flags))))))

