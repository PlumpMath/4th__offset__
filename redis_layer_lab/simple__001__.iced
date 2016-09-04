
module.exports = (io) ->

    # key_mirror = require 'keymirror'

    key_mirror = require 'keymirror'


    constants = key_mirror
        UNIVERSE : null
        WORLD_ID: null
        WORLD_NAME: null
        LEAGUE_SET_ID : null
        TEAM_SET_ID: null
        SEASON_SET_ID: null
        LEAGUE_ID: null
        GAME_SET_ID: null

    { UNIVERSE, LEAGUE_SET_ID, WORLD_NAME, LEAGUE_SET_ID, TEAM_SET_ID, WORLD_ID, LEAGUE_NAME, LEAGUE_ID, SEASON_SET_ID, GAME_SET_ID } = constants




    uuid = require 'node-uuid'
    c = -> console.log.apply console, arguments

    # get the list of worlds

    read_universe__world_names : (cb) ->
        await io.smembers UNIVERSE, defer err, members
        if err then c err else
            arq = {}
            for world_id in members
                await io.hget world_id, WORLD_NAME, defer err, world_name
                if err then c err else
                    # c 'world_name', world_name
                    arq[world_name] = world_id
            cb arq


    create_world : (world_name, cb) ->
        ticket =
            WORLD_ID: uuid.v4()
            WORLD_NAME: world_name
            LEAGUE_SET_ID: uuid.v4()
        io.sadd UNIVERSE, ticket[WORLD_ID]
        # should add error handling
        await io.hmset ticket[WORLD_ID], ticket, defer err, re
        cb 'done'



    read_world : (world_id, cb) ->
        await io.hgetall world_id, defer err, world_hash
        if err then c err else
            cb world_hash


    get_leagues_from_world_000 : (world_id, cb) ->
        await io.hget world_id, LEAGUE_SET_ID, defer err, league_set_id
        if err then c err else
            await io.smembers league_set_id, defer err, members
            if err then c err else
                arq = {}
                for league_id in members
                    await io.hgetall league_id, defer err, league_hash
                    if err then c err else
                        arq[league_hash.league_name] = league_hash
                cb arq


    get_leagues_from_world_002 : (league_set_id, cb) ->
        await io.smembers league_set_id, defer err, members
        if err then c err else
            rayy = []
            for league_id in members
                await io.hgetall league_id, defer err, league_hash
                if err then c err else
                    rayy.push league_hash
            cb rayy


    get_leagues_from_world_001 : (league_set_id, cb) ->
        await io.smembers league_set_id, defer err, members
        if err then c err else
            arq = {}
            for league_id in members
                await io.hgetall league_id, defer err, league_hash
                # c league_hash
                if err then c err else
                    arq[league_hash[LEAGUE_NAME]] = league_hash
            cb arq

    create_league : (world_id, league_name, cb) ->
        ticket =
            LEAGUE_ID: uuid.v4()
            LEAGUE_NAME: league_name
            TEAM_SET_ID: uuid.v4()
            SEASON_SET_ID: uuid.v4()
        await io.hget world_id, LEAGUE_SET_ID, defer err, league_set_id
        if err then c err else
            io.sadd league_set_id, ticket[LEAGUE_ID]
        io.hmset ticket[LEAGUE_ID], ticket
        cb 'done'


    create_team_000 : (league_id, team_name, cb) ->
        ticket =
            team_id: uuid.v4()
            team_name: team_name
            game_set_id: uuid.v4()
            season_set_id: uuid.v4()
        await io.hget league_id, TEAM_SET_ID, defer err, team_set_id
        if err then c err else
            # c err
            # c 'team_set_id', team_set_id
            io.sadd team_set_id, ticket.team_id
        io.hmset ticket.team_id, ticket
        cb 'done'


    read_league__get_teams_000 : (league_id, cb) ->


    read__teams__from__league__001 : (team_set_id, cb) ->
        await io.smembers team_set_id, defer err, team_id_rayy
        if err then c err else
            teams_rayy = []
            for team_id in team_id_rayy
                await io.hgetall team_id, defer err, team_hash
                if err then c err else
                    teams_rayy.push team_hash
            cb teams_rayy


    create_season_000: (league_id, season_name, cb) ->
        ticket =
            season_id: uuid.v4()
            season_name: season_name
            game_set_id: uuid.v4()
            team_set_id: uuid.v4()
        await io.hget league_id, SEASON_SET_ID, defer err, season_set_id
        if err then c err else
            c 'seaoson_set_id', season_set_id
            io.sadd season_set_id, ticket.season_id
        io.hmset ticket.season_id, ticket
        cb 'done'

    get_game_set_id_from_season_000 : (season_id, cb) ->
        await io.hget season_id, 'game_set_id', defer err, game_set_id
        if err then c err else
            cb game_set_id

    read_seasons_001 : (season_set_id, cb) ->
        # c 'args', arguments
        await io.smembers season_set_id, defer err, seasons_id_rayy
        if err then c err else
            c 'season_id_rayy', seasons_id_rayy
            seasons_rayy = []
            for season_id in seasons_id_rayy
                await io.hgetall season_id, defer err, season_hash
                if err then c err else
                    seasons_rayy.push season_hash
            cb seasons_rayy

    create_game_000 : (season_id, host_team_id, visitor_team_id, date_of_game, cb) ->
        await @get_game_set_id_from_season_000 season_id, defer game_set_id
        c 'game_set_id', game_set_id
        ticket =
            game_id: uuid.v4()
            season_id: season_id
            host_team_id: host_team_id
            visitor_team_id: visitor_team_id
            date_of_game: date_of_game
            game_result_hash_id: uuid.v4()
        # these could be pipelined because they are not dependant
        io.sadd game_set_id, ticket.game_id
        c 'ticket.game_id here', ticket.game_id
        io.hmset ticket.game_id, ticket
        cb ticket.game_id


    get_games_from_season_000 : (game_set_id, cb) ->
        await io.smembers game_set_id, defer err, game_ids
        games_rayy = []

        for game_id in game_ids
            c 'game_id', game_id
            await io.hgetall game_id, defer err, game_hash
            if err then c err else
                c 'game_hash', game_hash
                games_rayy.push game_hash
        cb games_rayy


    set_game_result_000 : (game_id, host_team_score, visitor_team_score, cb) ->
        await io.hgetall game_id, defer err, game_hash
        if err then c err else
            ticket =
                result_id: game_hash.game_result_hash_id
                game_id: game_hash.game_id
                host_team_score: host_team_score
                visitor_team_score: visitor_team_score
            io.hmset ticket.result_id, ticket
            cb 'done'

    get_game_result_000 : (game_id, cb) ->
        await io.hget game_id, 'game_result_hash_id', defer err, grhid
        if err then c err else
            await io.hgetall grhid, defer err, result_hash
            if err then c err else
                cb result_hash
