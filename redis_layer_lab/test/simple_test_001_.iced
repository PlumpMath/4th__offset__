



c = -> console.log.apply console, arguments
assert = require 'assert'

key_mirror = require 'keymirror'

_ = require 'lodash'


constants = key_mirror
    UNIVERSE : null
    WORLD_ID: null
    WORLD_NAME: null
    LEAGUE_SET_ID : null
    TEAM_SET_ID: null
    SEASON_SET_ID: null
    LEAGUE_ID: null

{ UNIVERSE, LEAGUE_SET_ID, WORLD_NAME, LEAGUE_SET_ID, TEAM_SET_ID, WORLD_ID, LEAGUE_NAME, LEAGUE_ID , SEASON_SET_ID} = constants

ioredis = require 'ioredis'
io = ioredis.createClient()
world_mgr = require('../simple__001__.iced')(io)

describe 'hooks', ->

    before ->

        io.flushall()
        c '\n\n'

        await setTimeout defer(), 500

        c '\n\n\n'



# describe 'array', ->
#     it 'should return -1 when ...', (done) ->
#         assert.equal -1, [1,2,3].indexOf(4)
#         done()

arq = null
rayy = null
spanish = null
teams = null
seasons = null
game = null

describe 'world creation', ->
    it 'should make worlds', (done)->
        await
            world_mgr.create_world 'Mars', defer()
            world_mgr.create_world 'Venus', defer()
            world_mgr.create_world 'Earth', defer()

        await world_mgr.read_universe__world_names defer arq
        c arq
        assert _.keys(arq).indexOf('Mars') isnt -1
        assert _.keys(arq).indexOf('Venus') isnt -1
        assert _.keys(arq).indexOf('Earth') isnt -1
        done()

describe 'league creation', ->
    it 'should make leagues', (done) ->
        await world_mgr.create_league arq['Mars'], "Spanish Premier League", defer msg
        c 'msg', msg

        c '\n'
        await world_mgr.read_world arq['Mars'], defer world_hash
        c 'world_hash', world_hash

        c '\n'
        await world_mgr.get_leagues_from_world_002 world_hash[LEAGUE_SET_ID], defer rayy
        c 'leagues arq', rayy
        c 'aoeu', rayy[0]['LEAGUE_NAME']
        assert rayy[0]['LEAGUE_NAME'] is 'Spanish Premier League'
        done()

describe 'team creation', ->

    it 'should make teams', (done) ->

        spanish = rayy.pop()
        c 'spanish.league_id', spanish[LEAGUE_ID]
        await
            world_mgr.create_team_000 spanish[LEAGUE_ID], "Real Madrid", defer res
            world_mgr.create_team_000 spanish[LEAGUE_ID], 'Barcelona FCB', defer res2
        c 'res on team creation', res, res2


        await world_mgr.read__teams__from__league__001 spanish[TEAM_SET_ID], defer teams
        c 'teams_rayy', teams
        assert (teams[1]['team_name'] is 'Real Madrid') or (teams[0]['team_name'] is 'Real Madrid')

        done()

describe 'season creation', ->
    it 'should make seasons', (done) ->

        await world_mgr.create_season_000 spanish['LEAGUE_ID'], "2017 Season", defer res
        c 'res on season creation', res

        await world_mgr.read_seasons_001 spanish['SEASON_SET_ID'], defer seasons
        c 'seasons retrieved from database', seasons
        assert seasons[0]['season_name'] is '2017 Season'
        done()

describe 'game creation', ->
    it 'should make games', (done) ->
        barcelona = teams[0] ; madrid = teams[1] ; season = seasons[0]
        c 'barcelona', barcelona
        c 'madrid', madrid
        date_of_game = Date.now()
        await world_mgr.create_game_000 season.season_id, barcelona.team_id, madrid.team_id, date_of_game, defer res
        c 'res', res
        c 'season.game_set_id', season.game_set_id
        await world_mgr.get_games_from_season_000 season.game_set_id, defer res
        c 'res', res
        assert parseInt(res[0].date_of_game) is date_of_game
        c res[0].date_of_game
        c date_of_game
        game = res[0]
        # todo get games from season
        done()


describe 'game set result', ->
    it 'should set the result of the game', (done) ->

        await world_mgr.set_game_result_000 game.game_id, 5, 1, defer res
        c 'res on set game result', res

        await world_mgr.get_game_result_000 game.game_id, defer result_hash
        c 'result_hash', result_hash
        assert.equal result_hash.host_team_score, 5
        assert.equal result_hash.visitor_team_score, 1
        done()
