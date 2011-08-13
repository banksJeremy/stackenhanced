rebuild: clean all

all: dist/extension.zip

clean:
	rm -rf dist/ build/

.PHONY: clean rebuild all

dist/extension.zip: dist/ build/res/ build/lib/ build/manifest.json
	cd build && zip -r ../dist/extension.zip .

dist/:
	mkdir -p dist/

build/res/: build/ res/
	cp -r res/ build/res/

build/lib/: build / lib/
	cp -r lib/ build/lib/

build/manifest.json: src/manifest.coffee build/.with_coffee
	coffee src/manifest.coffee > build/manifest.json

build/.with_coffee: build/
	which coffee \
	|| (echo "CoffeeScript not found." \
	    && ((which npm \
	         || (read -p "Press enter to install npm (globally)... " \
	             && curl http://npmjs.org/install.sh | sh)) \
	        && (read -p "Press enter to install CoffeeScript (globally)... " \
	            && npm install -g coffee-script)))
	touch build/.with_coffee

build/:
	mkdir -p build/
