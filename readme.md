## 4th__oFFseT

some exercises in fullstack Node+React omnisystem.

Node Websocket server (Primus as WS abstraction layer)
Redis data layer (for now, others augmented later)
React web-app for now, Electron and React-Native later in principle

### state mgmt  ::: data flow

React is famously lightweight (contrast with the thermonuclear do-everything paradigm of Angular2.0) and concerned merely with the View component of the front-end; declarative view rendering.  My last few apps I used Redux, and was quite impressed with it.  Nevertheless, I've been intrigued by [rxjs](http://reactivex.io/rxjs/), which is not exactly a direct replacement for the very lightweight Redux toolset and pattern, but which rather offers a tremendous API / toolset for combining Reactive programming with functional programming.  Could say it's a Lodash for event streams and FRP.  I'm looking to master it and in this project I'm working to implement state mgmt with it.  I'm starting with a very interesting repo for guidance:
Rudy Yardley's [rxjs-as-redux](https://github.com/ryardley/rxjs-as-redux)


#### Some other Rxjs & Redux resources:

https://github.com/jas-chen/rx-redux

https://medium.com/@JasChen/reactive-react-with-rxjs-and-redux-a65d010cc876#.t4xctqnem


### tourney pool
for the first exercise will be implementing the tourney pool idea (ht razorgrip)
or any other app idea that comes to me.  (if you have any requests email me), it's not too important which exact app i'm implementing, more trying to work on something demanding some complexity : websockets, complex state, etc.


#### clients
can make some other clients --react-native and electron-- later

for now just doing a react web client



#### data layer

for now just doing a simple redis implementation.  will look to optimise and include other tools later.




### development setup

`webpack -w`

`nodemon --watch primus_layer --watch web_app_server -x iced ./web_app_server/server_000_.iced`
