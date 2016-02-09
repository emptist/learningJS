http = require "http"
fs = require "fs"
# req,res are both streams
callback = (req, res)->
	if req.method is "GET"
		res.writeHead 200, "Content-Type":"text/html"
		fs.createReadStream("./public/form.html", "UTF-8").pipe(res)
	else if req.method is "POST"
		body = ''
		req.on "data", (chunk)->
			body += chunk
		req.on "end", ->
			res.writeHead(200, "Content-Type": "text/html")
			res.end """
				<!DOCTYPE html>
				<html>
					<head>
						<title>Form Results</title>
					</head>
					<body>
						<h1>Your Form Results</h1>
						<p>#{body}</p>
					</body>
				</html>
			"""

http.createServer(callback).listen(3000)

console.log("Form server listening on port 3000")
