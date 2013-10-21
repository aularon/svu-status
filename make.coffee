jade = require 'jade'
fs   = require 'fs'

checkmes = []
for i in [1..9] by 1
	checkmes.push(["http://class#{i}.svuonline.org/common.js", "TYPE_NAME", "Class##{i}"])

console.log checkmes

data = {checkmes:checkmes}

for tpl in fs.readdirSync('./templates')
	jade.renderFile "./templates/#{tpl}",  data, (err, html) ->
		if err
			return console.log tpl, err, fname, html
		fname = "build/#{tpl.replace '.jade', '.html'}"
		fs.writeFile fname, html
	