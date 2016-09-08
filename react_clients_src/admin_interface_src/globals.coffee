window.c = console.log.bind console
window._ = require 'lodash'
window.React = require 'react'
window.React_DOM = require 'react-dom'
window.shortid = require 'shortid'
window.gl_mat = require 'gl-matrix'
window.request = require 'superagent'
window.Rx = require 'rxjs'
window.primus = new Primus('http://localhost:2746', {})
window.rr = -> React.createFactory(React.createClass.apply(React, arguments))
window.rc = -> React.createFactory.apply(React, arguments)
dom_stuff = {p, strong, pre, div, h1, h2, h3, h4, h5, h6, span, svg, circle, tspan, rect, ul, line, li, ol, code, a, input, defs, clipPath, body, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, textArea, ellipse, pattern} = React.DOM
for k, v of dom_stuff
    window[k] = v
for item in ['textArea', 'filter', 'foreignObject', 'feGaussianBlur', 'feImage', 'feOffset']
    window[item] = React.createFactory item
window.ReactBootstrap = require 'react-bootstrap'
bootstrap_stuff = { Button } = ReactBootstrap
for k, v of bootstrap_stuff
    v = rc v
    window[k] = v
