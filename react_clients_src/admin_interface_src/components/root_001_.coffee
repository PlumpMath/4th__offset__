# admin_home = require './admin_home'

module.exports = rr
    render: ->
        div
            style:
                display: 'flex'
                flexDirection: 'column'
                alignItems: 'center'
                justifyContent: 'center'
            div
                style:
                    height: .3 * window_height
                    width: .3 * window_width
                    background: 'gold'
            div
                style:
                    height: .3 * window_height
                    width: .3 * window_width
                    background: 'tomato'
                    display: 'flex'
                    flexDirection: 'row'
                    alignItems: 'center'
                    justifyContent: 'center'
                button null, "hello"
                button null, "increment"
                Button
                    bsStyle: "success"
                    "something"
