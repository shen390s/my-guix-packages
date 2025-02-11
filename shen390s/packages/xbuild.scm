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
  (let ((commit "a4d035295286b58e916c906a61c24af2120b51b2"))
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
      		"1mcn3aqsmy5jfgfycivnd97cxzxs5h9xgfjxrysad11ydhcj0k4c"))))
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


xbuild
