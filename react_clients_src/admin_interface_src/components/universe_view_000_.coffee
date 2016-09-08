
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

    add_world_attempt: ->
        mock_worlds.push
            uuid: shortid()
            world_name: @state.add_world_name_candidate
            number_leagues: 0
        @setState
            adding_world: false
            add_world_name_candidate: null

    getInitialState: ->
        adding_world: false
        add_world_name_candidate: null

    componentDidUpdate: (prevProps, prevState) ->
        if (prevState.adding_world is false) and (@state.adding_world is true)
            c @refs.worldname
            @refs.worldname.focus()

    render: ->
        div
            style:
                width: window_width
                height: window_height
                display: 'flex'
                flexDirection: 'column'
                alignSelf: 'center'
                justifyContent: 'space-between'
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
            if @state.adding_world
                div
                    className: 'static-modal'
                    Modal_Dialog null,
                        Modal_Header null,
                            Modal_Title null, "Adding a world"
                        Modal_Body null,
                            FormGroup null,
                                InputGroup null,
                                    FormControl
                                        autoFocus: true
                                        ref: 'worldname'
                                        type: 'text'
                                        placeholder: 'world name'
                                        onKeyPress: (e) =>
                                            if e.key is 'Enter'
                                                @add_world_attempt()
                                        onChange: (e) =>
                                            # c 'changed to', e.currentTarget.value
                                            @setState
                                                add_world_name_candidate: e.currentTarget.value
                                    InputGroup_Button null,
                                        Button
                                            onClick: =>
                                                @add_world_attempt()
                                            "done"
                        Modal_Footer null,
                            Button
                                onClick: =>
                                    @setState
                                        adding_world: false
                                "Close"
            PageHeader null, "Universe View"
            div
                style:
                    display: 'flex'
                    flexDirection: 'column'
                    width: window_width
                    height: .7 * window_height
                    # justifyContent: 'center'
                Button
                    style: {}
                    onClick: =>
                        @setState
                            adding_world: true
                    "Create World"
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
