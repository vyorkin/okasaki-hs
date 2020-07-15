GHC_OPTIONS := --ghc-options='-j +RTS -A128m -n2m -RTS -fdiagnostics-color=never -ferror-spans -fhide-source-paths' # -fprint-unicode-syntax

CH := 02
CH_DIR := src/Okasaki/Ch$(CH)

dev: all
	ghcid --command="cabal repl $(GHC_OPTIONS)" | source-highlight -s haskell -f esc
repl:
	cabal repl $(GHC_OPTIONS)
all:
	cabal build $(GHC_OPTIONS) all
run:
	cabal run okasaki
clean:
	cabal clean
check:
	cabal check
test:
	cabal test
tags:
	rm -f tags codex.tags
	codex update --force
	haskdogs --hasktags-args "-b"
prof:
	cabal configure --enable-profiling
noprof:
	cabal configure --disable-profiling
hoogle:
	hoogle server --local

.PHONY: dev repl clean all run test check tags prof noprof hoogle
