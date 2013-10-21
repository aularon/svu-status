watch:
	supervisor -w ./ -e 'jade|coffee' -n 'exit' coffee make.coffee

publish:
	coffee make.coffee
	rsync -vaP build/ alma:~/misc/svustatus/