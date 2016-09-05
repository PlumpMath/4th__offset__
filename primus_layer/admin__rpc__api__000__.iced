



c = -> console.log.apply console, arguments

# exports.admin__rpc__api__000 can be required for unit testing

exports.admin__rpc__api__000 = admin_rpc_api = (data, cb) ->

    switch data.event_type
        when 'create_world'
            c 'creating world'
            cb 'creating world'

        when 'create_league'
            c 'creating league'
            cb 'creating league'

        when 'create_team'
            c 'creating team'
            cb 'creating team'

        when 'create_season'
            c 'creating season'
            cb 'creating season'

        when 'create_game'
            c 'creating game'
            cb 'creating game'

        when 'create_game_result'
            c 'creating game result'
            cb 'creating game result'






exports.default = (primus) ->
    c 'getting rpc resource'

    primus.on 'connection', (spark) ->
        c 'have connection'

        spark.on 'data', (data) ->
            c 'have data'
            admin_rpc_api data, (res) ->
                primus.write res
