



c = -> console.log.apply console, arguments

_ = require 'lodash'
path = require 'path'
Primus = require 'primus'

primus_dir = path.resolve __dirname, '../react_clients_public', 'admin_interface_public', 'js'


















express = require 'express'
c 'express', express
app = express()
body_parser = require 'body-parser'

public_dir = path.resolve __dirname, '../react_clients_public', 'admin_interface_public'


index = '/dev_index.html'

app.use '/js', express.static(path.join(public_dir, '/js'))
# app

app.all '/*', (req, res, next) ->
    res.sendFile path.join(public_dir, index)


app.use express.static(public_dir)

port = 2746


server = require('http').createServer(app)
primus = new Primus(server, {})

primus.save path.join(primus_dir, '/primus.js')

server.listen port, ->
    c 'express/primus server listening on', port

# app.listen port, ->
#     c 'tourney pool server listening on ', port
