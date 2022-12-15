
.PHONY: build update-build clean reallyclean sdist

build: update-build
	stack test --nix --no-interleaved-output --ghc-options="-Wall -Werror"

update-build:
	nix-shell update-build-shell.nix --run ./update-build.sh

clean:
	stack clean

reallyclean:
	rm -rf .stack-work */.stack-work _sdists

sdist: reallyclean build
	stack sdist
