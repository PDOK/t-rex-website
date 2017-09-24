# https://github.com/casey/just

serve:
	gutenberg serve

gh-pages:
	gutenberg build
	git checkout gh-pages && cp -r public/* .

theme:
	cd semantic && ../node_modules/.bin/gulp build
	rm -rf static/components static/themes static/semantic*
	cp -r semantic/dist/* static/

# https://github.com/Keats/gutenberg
@gutenberg version='0.1.3' dest='~/bin':
    echo Installing gutenberg
    curl -s -L https://github.com/Keats/gutenberg/releases/download/v{{version}}/gutenberg-v{{version}}-x86_64-unknown-linux-gnu.tar.gz | tar xzf - -C {{dest}}
    which gutenberg; gutenberg --version
