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
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages autotools))

(define-public xbuild
  (let ((commit "master"))
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
      		"1m5f6qa6z2r5yj83vwcciwm135gz9dngp2acad4j563qf9vii0l1"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #f))
     (inputs (list
	      autoconf automake libtool))
     (propagated-inputs
      (list coreutils c-capnproto
	    ;;`(,gcc-toolchain-14 "static")
	    gcc-toolchain-14
	    gnu-make bash strace go readline linux-pam
	    libtirpc `(,hwloc "lib") pkg-config postgresql
	    openssl libcyaml libyaml libuv elogind xxd
	    sqlite))
     (home-page "https://github.com/shen390s/xbuild")
     (synopsis "xbuild")
     (description
      "xbuild")
     (license license:expat))))


;;(list xbuild)
