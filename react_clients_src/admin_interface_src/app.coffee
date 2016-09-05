

require './globals.coffee'

c 'here we are in the app'


c 'primus is', Primus




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


setTimeout ->
    primus.write
        event_type: 'create_league'
, 1000

setTimeout ->
    primus.write
        event_type: 'create_team'
, 2000


root = document.getElementById 'root'


root_component = require('./components/root_000_.coffee')


window.onload = =>
    rectangle = root.getBoundingClientRect()
    {width, height} = rectangle

    debounce = (fn, wait, immediate) ->
        timeout = 'scoped here'
        ->
            context = @
            args = arguments
            later = ->
                timeout = null
                if not(immediate) then fn.apply(context, args)
            callNow = immediate and not(timeout)
            clearTimeout(timeout)
            timeout = setTimeout(later, wait)
            if callNow then fn.apply(context, args)

    set_boundingRect = ->
        rectangle = root.getBoundingClientRect()
        {width, height} = rectangle
        arq =
            viewport_width: width
            viewport_height: height
        store.dispatch(set_bounding_rect(arq))

    window.onresize = debounce(set_boundingRect, 200, false)




    React_DOM.render root_component(), root
