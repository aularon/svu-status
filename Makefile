watch:
	supervisor -w ./ -e 'jade|coffee' -n 'exit' coffee make.coffee