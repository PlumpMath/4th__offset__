



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
# app

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
# primus.use('multiplex', 'primus-multiplex')
# primus.use 'multiplex', 'primus-multiplex'
# primus.use 'emitter', 'primus-emitter'

primus.save path.join(primus_dir, '/primus.js')

Creature = primus.resource 'creature'
Creature.oncommand = (spark, command, fn) ->
    c 'command: ', command

Creature.onwalk = (spark, fn) ->
    c 'walk'
    fn('creature started to walk')

server.listen port, ->
    c 'express/primus server listening on', port

# app.listen port, ->
#     c 'tourney pool server listening on ', port


primus.on 'connection', (spark)->
    c 'server has a spark', _.keys(spark)

    primus.write 'hello there and again'
    primus.write 'and yes'
