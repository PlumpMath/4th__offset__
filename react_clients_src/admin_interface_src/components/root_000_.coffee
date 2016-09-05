

# at first we can put the logic into this component,
# later into containers and rxjs the whole things


module.exports = rr
    create_world: ->
        primus.write
            event_type: 'create_world'

    render: ->
        div null,
            h1 null, " hello root"
            h3 null, " make some buttons "

            button
                onClick: @create_world
                "create world"

            div null,
                h3 null, "worlds list"
                ul null,
                    li
                        key: "333"
                        onClick: -> c 'goto this world'
                        style:
                            cursor: 'pointer'
                        "world one"
