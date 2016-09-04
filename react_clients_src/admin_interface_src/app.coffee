

require './globals.coffee'

c 'here we are in the app'


c 'primus is', Primus

primus = new Primus('http://localhost:2746', {})


# creature = primus.resource 'creature'
# creature.on 'ready', ->
#
#     creature.command 'sleep', (res) ->
#         c 'res on sleep command', res
#
#     creature.walk (res)->
#         c 'res on walk', res

primus.on 'data', (data)->
    c 'got some data from the server', data


primus.write
    event_type: 'create_world'
