(define-module (shen390s packages roswell)
  #:use-module (guix packages)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages gcc)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages curl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools))

(define-public xmake
  (let ((tag "v2.9.9"))
    (package
     (name "xmake")
     (version "v2.9.9")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/xmake-io/xmake.git")
		    (commit tag)
		    (recursive? #t)))
	      (sha256
	       (base32 "115rfr76bdl4zj38jvxzc3p8zgpy10j29jm7w0js56z195iwmbn8"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #false))
     (native-inputs
      (list  autoconf automake libtool curl gcc))
     ;;(propagated-inputs (list sbcl))
     (home-page "https://xmake.io")
     (synopsis "A cross-platform build utility based on Lua")
     (description
      "A cross-platform build utility based on Lua")
     ;; MIT license
     (license license:asl2.0))))
  
;;xmake
