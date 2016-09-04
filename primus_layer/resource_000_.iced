


# the problem with primus resource library as i see it is that client can't pass payload / type
# it's an old abandon ware could fork and update but for now just roll own easy.


c = -> console.log.apply console, arguments
_ = require 'lodash'


module.exports = (primus) ->

    Creature = primus.resource 'creature'
    Creature.oncommand = (spark, command, fn) ->
        c 'command: ', command
        fn 'goto it'

    Creature.onwalk = (spark, fn) ->
        c 'walk'
        fn('creature started to walk')
