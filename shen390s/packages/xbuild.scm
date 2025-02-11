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
  (let ((commit "2ce5b7705ab12fbc2eacb7672cdb8fe78bbd6504"))
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
		"0wlip1413caiq5rvbb715l3kmyp4bcjgkknvc1y9anrh7n9q752r"))))
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
