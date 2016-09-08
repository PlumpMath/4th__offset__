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
dom_stuff = {
p, strong, pre, div, h1, h2, h3, h4, h5, h6, span, svg, circle,
tspan, rect, ul, line, li, ol, code, a, input, defs, clipPath,
body, linearGradient, stop, g, path, d, polygon, image, pattern,
filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode,
feMerge, radialGradient, foreignObject, text, textArea, ellipse,
pattern, thead, th, tr, tbody
} = React.DOM
for k, v of dom_stuff
    window[k] = v
for item in ['textArea', 'filter', 'foreignObject', 'feGaussianBlur', 'feImage', 'feOffset']
    window[item] = React.createFactory item
window.ReactBootstrap = require 'react-bootstrap'
bootstrap_stuff = {
Button, ButtonGroup, ButtonToolbar, DropdownButton,
SplitBUtton, Dropdown, MenuItem, Modal, Tooltip, Popover,
Overlay, Nav, NavItem, Navbar, Breadcrumb,
Tabs, Tab, TabContainer, TabContent, TabPane,
Pagination, Pager, Grid, Row, Col, Clearfix,
Jumbotron, ListGroup, ListGroupItem, Table,
Panel, PanelGroup, Accordion, Well, FormGroup,
FormControl, ControlLabel, Checkbox, Radio,
HelpBlock, Form, InputGroup, Image, Thumbnail,
ResponsiveEmbed, Carousel, Media, Glyphicon, Label,
Badge, Alert, ProgressBar, Collapse, Fade
} = ReactBootstrap
for k, v of bootstrap_stuff
    v = rc v
    window[k] = v
window.Breadcrumb_Item = rc ReactBootstrap.Breadcrumb.Item
window.Pager_Item = rc ReactBootstrap.Pager.Item
window.FormControl_Static = rc ReactBootstrap.FormControl.Static
window.InputGroup_Addon = rc ReactBootstrap.InputGroup.Addon
window.InputGroup_Button = rc ReactBootstrap.InputGroup.Button
window.FormControl_Feedback = rc ReactBootstrap.FormControl.Feedback
window.Carousel_Item = rc ReactBootstrap.Carousel.Item
window.Carousel_Caption = rc ReactBootstrap.Carousel.Caption

window.Modal_Dialog = rc ReactBootstrap.Modal.Dialog
window.Modal_Header = rc ReactBootstrap.Modal.Header
window.Modal_Title = rc ReactBootstrap.Modal.Title
window.Modal_Body = rc ReactBootstrap.Modal.Body
window.Modal_Footer = rc ReactBootstrap.Modal.Footer
