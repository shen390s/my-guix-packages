(define-module (guix packages roswell)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages autotools))

(define-public roswell
  (let ((commit "4c17a2b65314283839d382e52d47a44bb71e22b5"))
    (package
     (name "roswell")
     (version "23.10.14.114")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/roswell/roswell.git")
		    (commit commit)))
	      (sha256
	       (base32 "1i3d9achbpczzrn0csjmjpzp013lpmd2qi97kg6invxgsprkv9pq"))))
     (build-system gnu-build-system)
     (propagated-inputs (list sbcl))
     (home-page "https://github.com/roswell/roswell")
     (synopsis "Roswell is a Lisp implementation installer/manager, launcher, and much more!")
     (description
      "Roswell is a Lisp implementation installer/manager, launcher, and much more!

Roswell started out as a command-line tool with the aim to make installing and managing Common Lisp implementations really simple and easy.

Roswell has now evolved into a full-stack environment for Common Lisp development, and has many features that makes it easy to test, share, and distribute your Lisp applications. With Roswell, we aim to push the Common Lisp community to a whole new level of productivity.

Roswell is still in beta. Despite this, the basic interfaces are stable and not likely to change. Roswell currently works well on Unix-like platforms such as Linux, macOS and FreeBSD. Roswell also works on other operating systems, but currently some parts or features might be missing or unstable.")
     ;; MIT license
     (license license:expat))))
  
