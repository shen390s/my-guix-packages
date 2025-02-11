(define-module (shen390s packages xbuild)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages curl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (shen390s packages capnp)
  #:use-module (gnu packages autotools))

(define-public xbuild
  (let ((commit "1f6c1816d344cc1f3cf5ac1cca8e31d69dc41ce8"))
    (package
     (name "xbuild")
     (version "0.0.1")
     (source (origin
              (method git-fetch)
	      (uri (git-reference
                    (url "https://github.com/shen390s/xbuild.git")
                    (commit commit)))
              (sha256
               (base32
		"10l8sfscr1xz2s23wqvm47bmisi6km0mz1l6l7ls492ai76y21vg"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #f))
     (inputs (list
	      autoconf automake libtool))
     (propagated-inputs
      (list c-capnproto))
     (home-page "https://github.com/shen390s/xbuild")
     (synopsis "xbuild")
     (description
      "xbuild")
     (license license:expat))))


;;xbuild
