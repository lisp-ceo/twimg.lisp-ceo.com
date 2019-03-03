SOURCES=$(shell find src/Twimg -type f)
PULP=npx pulp
PSC=npx psc-package
PPSC=$(PULP) --psc-package
WEBPACK=npx webpack

.PHONY: run
run:
	$(PPSC) run

.PHONY: clean
clean:
	rm -rf build dist

.PHONY: configure
configure:
	npm i

.PHONY: default all
default: dist/Twimg.bundle.js dist/index.html static

## TODO Get build system working based on above

dist/index.html: static
	cp build/index.html $@

dist/Twimg.bundle.js: build/Twimg.js static
	$(WEBPACK) --progress --config webpack.config.js

build/Twimg.js:
	mkdir -p build
	$(PPSC) build --main Twimg.Targets.Browser --to ./build/Twimg.js

static:
	mkdir -p build
	rsync static/*.css build
	rsync static/*.html build

.PHONY: basic_example
basic_example: ./src/Twimg/Examples/Basic/dist/basic.js

./src/Twimg/Examples/Basic/dist/basic.js:P
	$(PPSC) build --main Twimg.Examples.Basic.Main --to src/Twimg/Examples/Basic/dist/basic.js
	open src/Twimg/Examples/Basic/dist/index.html
