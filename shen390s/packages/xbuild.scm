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
		"127b3dgn5w3idf5a5m3in1cxkszs940zgxkc4hkf89hqyi1xy1v0"))))
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
