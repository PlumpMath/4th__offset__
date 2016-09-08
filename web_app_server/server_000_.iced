c = -> console.log.apply console, arguments
_ = require 'lodash'
path = require 'path'
Primus = require 'primus'
resource = require 'primus-resource'
primus_dir = path.resolve __dirname, '../react_clients_public', 'admin_interface_public', 'js'
express = require 'express'
app = express()
body_parser = require 'body-parser'
public_dir = path.resolve __dirname, '../react_clients_public', 'admin_interface_public'
index = '/dev_index.html'
app.use '/js', express.static(path.join(public_dir, '/js'))
app.use '/css', express.static(path.join(public_dir, '/css'))
app.use '/fonts', express.static(path.join(public_dir, '/fonts'))
app.all '/*', (req, res, next) ->
    res.sendFile path.join(public_dir, index)
app.use express.static(public_dir)
port = 2746
http = require 'http'
server = http.createServer(app)
primus = new Primus(server, {})
Emitter = require 'primus-emitter'
multiplex = require 'primus-multiplex'
primus.plugin 'emitter', Emitter
primus.plugin 'multiplex', multiplex
primus.plugin 'resource', resource
primus.save path.join(primus_dir, '/primus.js')
# require('../primus_layer/resource_000_.iced')(primus)
require('../primus_layer/admin__rpc__api__000__.iced').default(primus)
server.listen port, ->
    c 'express/primus server listening on', port
