(define-module (shen390s packages xbuild)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages curl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (shen390s packages capnp)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages onc-rpc)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages autotools))

(define-public log4c
  (let ((commit "7cc4b20dd719530617fea6179872a6c0fe01bf76"))
    (package
     (name "log4c")
     (version "1.2.4")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/shen390s/log4c.git")
		    (commit commit)))
	      (sha256
	       (base32
		"1h9jaww7hvq738pf7ckqmj5hqcp3csi4p03r404w3rg86xwbgpa8"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #f))
     (native-inputs
      (list autoconf automake libtool curl gcc))
     (home-page "https://sourceforge.net/projects/log4c/files/log4c/")
     (synopsis "")
     (description "log4c is a library for logs for c")
     (license license:expat))))

(define-public xbuild
  (let ((commit "9ce85581af9136bfa6cec0426f51aa6c90e7bc0b"))
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
      		"0xkqqiaml5nngcsjp4qvglczq0zkyigfylv1csidbs815yhnm363"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #f))
     (inputs (list
	      autoconf automake libtool))
     (propagated-inputs
      (list coreutils c-capnproto gcc-toolchain-14
	    gnu-make bash strace go readline linux-pam
	    libtirpc hwloc pkg-config postgresql
	    openssl libyaml))
     (home-page "https://github.com/shen390s/xbuild")
     (synopsis "xbuild")
     (description
      "xbuild")
     (license license:expat))))


;;xbuild
;;log4c
