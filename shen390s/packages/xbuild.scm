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
  #:use-module (gnu packages autotools))

(define-public xbuild
  (let ((commit "aa8db7401dcdab4f0230d1f311cbbe809e629667"))
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
      		"1vnkjz4w53hn72kzfisxbyx6caz9qr8r8ccvwcxh8p770wcyn7h9"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #f))
     (inputs (list
	      autoconf automake libtool))
     (propagated-inputs
      (list coreutils c-capnproto gcc-toolchain-14 gnu-make bash strace go readline linux-pam))
     (home-page "https://github.com/shen390s/xbuild")
     (synopsis "xbuild")
     (description
      "xbuild")
     (license license:expat))))


;;xbuild
