(define-module (shen390s packages xbuild)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages curl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (gnu packages autotools))

(define-public xbuild
  (let ((commit "e098f15850d031bd1b9c9a0da77c3313de061880"))
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
		"1nk5ack8hqh0ll5566c9dri82cx9shd203rk4pfp9aizck14vynn"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #f))
     (inputs (list
	      autoconf automake libtool))
;;     (propagated-inputs
;;      (list ))
     (home-page "https://github.com/shen390s/xbuild")
     (synopsis "xbuild")
     (description
      "xbuild")
     (license license:expat))))


;;xbuild
