



c = -> console.log.apply console, arguments

_ = require 'lodash'

React = require 'react'
React_DOM = require 'react-dom'

shortid = require 'shortid'
gl_mat = require 'gl-matrix'
request = require 'superagent'

mat3 = gl_mat.mat3
vec3 = gl_mat.vec3
vec2 = gl_mat.vec2

arq =
    mat3: mat3
    vec3: vec3
    vec2: vec2
    request: request
    gl_mat: gl_mat
    _: _
    React: React
    React_DOM: React_DOM
    rr: -> React.createFactory(React.createClass.apply(React, arguments))
    c: c
    shortid: shortid


for k, v of arq
    window[k] = v

dom_stuff = {p, strong, pre, div, h1, h2, h3, h4, h5, h6, span, svg, circle, tspan, rect, ul, line, li, ol, code, a, input, defs, clipPath, body, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, textArea, ellipse, pattern} = React.DOM
for k, v of dom_stuff
    window[k] = v

for item in ['textArea', 'filter', 'foreignObject', 'feGaussianBlur', 'feImage', 'feOffset']
    window[item] = React.createFactory item
