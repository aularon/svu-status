jade = require 'jade'
fs   = require 'fs'

checkmes = []
for i in [1..9] by 1
	checkmes.push(["http://class#{i}.svuonline.org/common.js", "TYPE_NAME", "Server##{i}"])

mainCh = []
mainCh.push(["https://www.svuonline.org/isis/include/js/jquery-latest.js", "jQuery", "WWW"]);
mainCh.push(["https://mail.svuonline.org/js/horde.js", "ToolTips", "Mail"]);


#console.log checkmes

data = {
	checkmes: [
		['Main Services', mainCh],
		['Class Servers', checkmes]
	]
}

for tpl in fs.readdirSync('./templates')
	jade.renderFile "./templates/#{tpl}",  data, (err, html) ->
		if err
			return console.log tpl, err, fname, html
		fname = "build/#{tpl.replace '.jade', '.html'}"
		fs.writeFile fname, html
	