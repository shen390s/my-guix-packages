(define-module (shen390s packages gcc-glibc-toolchain)
  #:use-module (guix)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base)
  #:use-module (gnu packages commencement)
  #:use-module (guix licenses)
  #:use-module (gnu packages bash))

(define-public glibc-2.17
  (package
    (inherit glibc-2.29)
    (name "glibc")
    (version "2.17")
    (source (origin
             (method url-fetch)
             (uri (string-append "http://ftp.gnu.org/gnu/libc/glibc-" version ".tar.gz"))
             (sha256
              (base32
               "0ym3zk9ii64279wgw7pw9xkbxczy2ci7ka6mnfs05rhlainhicm3"))))
    (arguments
      `(#:out-of-source? #t))))

(define-public gcc-with-glibc
  (package
    (name "gcc")
    (version "14.2.0") ; Use the desired version of GCC
    (source (origin
             (method url-fetch)
             (uri (string-append "http://ftp.gnu.org/gnu/gcc/gcc-" version "/gcc-" version ".tar.gz"))
             (sha256
              (base32
               "1wd4vl1yd5h9bvnk6ax16ng7j4jmxyfcfzzg5nqwxmcsfjw1dvlr"))))
    (build-system gnu-build-system)
    (arguments
      (list 
	#:out-of-source? #t))
    (inputs (list glibc-2.17))
    (synopsis "The GNU Compiler Collection")
    (description "GCC is the GNU Compiler Collection, which includes front ends for C, C++, and more.")
    (home-page "https://gcc.gnu.org/")
    (license lgpl2.0+)))

(define my-make-gcc-toolchain
  (module-ref (resolve-module '(gnu packages commencement)) 'make-gcc-toolchain))

(define-public gcc-glibc-toolchain
  (my-make-gcc-toolchain gcc-14  glibc-2.17)) ;; (interaction-environment)))

;;gcc-glibc-toolchain
