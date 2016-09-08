require './globals.coffee'
root_000 = require('./components/root_000_.coffee')
root_001 = require './components/root_001_.coffee'
root_component = root_001
root = document.getElementById 'root'
window.onload = =>
    rectangle = root.getBoundingClientRect()
    {width, height} = rectangle
    window.window_width = width
    window.window_height = height
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
        window.window_width = width
        window.window_height = height
        React_DOM.render root_component(), root
    window.onresize = debounce(set_boundingRect, 200, false)
    React_DOM.render root_component(), root


# -----------------------------------primus setup stuff

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
