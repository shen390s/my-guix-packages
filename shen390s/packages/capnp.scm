(define-module (shen390s packages capnp)
  #:use-module (guix packages)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages gcc)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages curl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages ninja)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages autotools))

(define-public capnp-1.1.0
  (package
   ;;(inherit capnproto)
   (name "capnp")
   (version "1.1.0")
   (source (origin
            (method url-fetch)
            (uri (string-append
                  "https://github.com/capnproto/capnproto/archive/refs/tags/v"
                  version ".tar.gz"))
            (sha256
             (base32
              "0ssvyfhr4q5p0qk3nrwsccyyn0lj1b1clzvcwaxgf8g80y5dg860"))))
   (build-system cmake-build-system)
   (arguments
    `(#:tests? #f))
   (home-page "https://capnproto.org")
   (synopsis "Capability-based RPC and serialization system")
   (description
    "Cap'n Proto is a very fast data interchange format and capability-based
RPC system.  Think JSON, except binary.  Or think Protocol Buffers, except faster.")
   (license license:expat)))

(define-public c-capnproto
  (let ((commit "main"))
    (package
     ;;(inherit capnproto)
     (name "c-capnproto")
     (version "1.0.0")
     (source (origin
              (method git-fetch)
	      (uri (git-reference
                    (url "https://github.com/shen390s/c-capnproto.git")
                    (commit commit)))
              (sha256
               (base32
		"1v7d8bavgdwnsnz893z3js4vghwp8apc3dqwk7rwsrxab28b1n31"))))
     (build-system cmake-build-system)
     (arguments
      `(#:configure-flags (list "--preset=ci-linux_x86_64" "-DBUILD_TESTING=OFF" "-G" "Ninja")
			  #:tests? #f
			  #:phases
			  (modify-phases %standard-phases
					 (replace 'build
						   (lambda* (#:key inputs outputs #:allow-other-keys)
							    (system* "ninja" "-C" "../source/build")))
					 (replace 'install
						    (lambda* (#:key inputs outputs #:allow-other-keys)
							     (system* "cmake" "--install" "../source/build"))))))
      (inputs (list ninja))
      (propagated-inputs
       (list capnp-1.1.0))
      (home-page "https://capnproto.org")
      (synopsis "Capability-based RPC and serialization system")
      (description
       "Cap'n Proto is a very fast data interchange format and capability-based
RPC system.  Think JSON, except binary.  Or think Protocol Buffers, except faster.")
      (license license:expat))))


;; capnp-1.1.0
;;(list capnp-1.1.0 c-capnproto)
