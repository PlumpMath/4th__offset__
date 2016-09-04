


# primus websockets server

it makes sense to separate the asset serving express server , and maybe the handshake server from the websocket server handling the actual websocket traffic.

full optimisation will come later , this a placeholder.


For now this folder will contain the websocket RPC API and implementation only, with the actual server endpoint being in the web-app-server.  Later with CORS working we should create a separate websocket endpoint.
