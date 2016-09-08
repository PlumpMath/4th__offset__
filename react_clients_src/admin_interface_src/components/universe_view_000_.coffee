
mock_worlds = [
    {
        uuid: shortid()
        world_name: 'Mercury'
        number_leagues: 3
    }
    {
        uuid: shortid()
        world_name: 'Venus'
        number_leagues: 8
    }
    {
        uuid: shortid()
        world_name: 'Earth'
        number_leagues: 38
    }
    {
        uuid: shortid()
        world_name: 'Mars'
        number_leagues: 22
    }
]


module.exports = rr
    render: ->
        div
            style:
                width: window_width
                height: window_height
                display: 'flex'
                flexDirection: 'column'
                alignSelf: 'center'
                justifyContent: 'flex-start'
                alignItems: 'center'
                background: 'antiquewhite'
            # div
            #     style:
            #         display: 'flex'
            #         justifyContent: 'center'
            #         alignItems: 'center'
            #         width: .6 * window_width
            #         height: .2 * window_height
            #         background: 'chartreuse'
            PageHeader null, "Universe View"
            Table
                striped: true
                bordered: true
                condensed: true
                hover: true
                thead null,
                    tr null,
                        th null, '#'
                        th null, 'uuid'
                        th null, 'world-name'
                        th null, 'leagues'
                tbody null,
                    for world, idx in mock_worlds
                        uid = world.uuid
                        tr
                            key: world.uuid
                            style:
                                cursor: 'pointer'
                            onClick: do (idx, uid) =>
                                (e) =>
                                    c e.currentTarget
                                    c idx
                                    c uid
                            td null, "#{idx + 1}"
                            td null, world.uuid
                            td null, world.world_name
                            td null, world.number_leagues
