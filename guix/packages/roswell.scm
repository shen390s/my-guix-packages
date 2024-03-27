(define-module (guix packages roswell)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages autotools))

(define-public roswell
  (package
   (name "roswell")
   (version "23.10.14.114")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/roswell/roswell.git")))
	    (sha256
	     (base32 "1i3d9achbpczzrn0csjmjpzp013lpmd2qi97kg6invxgsprkv9pq"))))
   (build-system gnu-build-system)
   (propagated-inputs (list sbcl))))
  
