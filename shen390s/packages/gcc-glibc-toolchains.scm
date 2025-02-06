(define-module (shen390s packages gcc-glibc-toolchain)
  #:use-module (guix)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base)
  #:use-module (guix licenses)
  #:use-module (gnu packages bash))

(define glibc-2.17
  (package
    (name "glibc")
    (version "2.17")
    (source (origin
             (method url-fetch)
             (uri (string-append "http://ftp.gnu.org/gnu/libc/glibc-" version ".tar.gz"))
             (sha256
              (base32
               "1fnvqnk2l12p0bcz8z24dpm35hn8d0m7lsg4wxg56hdh6kq43khp"))))
    (build-system gnu-build-system)
    (inputs (list bash))
    (synopsis "GNU C Library")
    (description "The GNU C Library provides the core libraries for the Linux operating system.")
    (home-page "https://www.gnu.org/software/libc/")
    (license lgpl2.0+)))

(define gcc-with-glibc
  (package
    (name "gcc")
    (version "10.2.0") ; Use the desired version of GCC
    (source (origin
             (method url-fetch)
             (uri (string-append "http://ftp.gnu.org/gnu/gcc/gcc-" version "/gcc-" version ".tar.gz"))
             (sha256
              (base32
               "1wd4vl1yd5h9bvnk6ax16ng7j4jmxyfcfzzg5nqwxmcsfjw1dvlr"))))
    (build-system gnu-build-system)
    (inputs (list glibc-2.17))
    (synopsis "The GNU Compiler Collection")
    (description "GCC is the GNU Compiler Collection, which includes front ends for C, C++, and more.")
    (home-page "https://gcc.gnu.org/")
    (license lgpl2.0+)))

(define-public gcc-glibc-toolchain
  (package
    (name "gcc-glibc-toolchain")
    (version "1.0")
    (source (local-file "path-to-your-local-source-directory"))
    (build-system gnu-build-system)
    (inputs (list gcc-with-glibc))
    (native-inputs (list glibc-2.17))
    (synopsis "Custom GCC toolchain with glibc 2.17")
    (description "A GCC toolchain built with glibc 2.17.")
    (home-page "https://github.com/shen390s")
    (license lgpl2.0+)))

