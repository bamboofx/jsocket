# jSocket Object #

This a reference of the basic version of jSocket, which has a basic string based featureset.

For a more advanced binary socket see:
[jsocket.advanced.js reference](ReferenceAdvanced.md)

Please take note of the fact that the jSocket.write function and jSocket.onData event have a different implementation and syntax compared to the advanced jsocket version.

## Constructor ##

### jSocket(onReady, onConnect, onData, onClose) ###
Contructor of our jSocket Object.
Internal id registration takes place here.

[onReady:function (optional)](Reference#jSocket.onReady().md)<br />
[onConnect:function (optional)](Reference#jSocket.onConnect(success,_error).md)<br />
[onData:function (optional)](Reference#jSocket.onData(data).md)<br />
[onClose:function (optional)](Reference#jSocket.onClose().md)<br />

## Methods ##

### jSocket.setup(target) ###
**target:string** id of the element to replace with the socket.<br />
Add the socket swf to the page, by replacing an element specified with the target argument. [jSocket.onReady](Reference#jSocket.onReady().md) Will be fired upon succesful completion.

### jSocket.connect(host, port) ###
**host:string** hostname or ip of the server for the socket to connect with.<br />
**port:int** port to use on the host<br />
Call this method to connect to a listening socket. Method takes two required arguments, host which should be a host name or a valid ip address to connect to, and port to indicate which port we are connecting on.

After the socket has tried to connect the [jSocket.onConnect](Reference#jSocket.onConnect(success,_error).md) event will be triggered.

Please make sure to read [the wiki entry about Security](Security.md) flash imposes several restrictions when using sockets, this includes connections to localhost. Keep this in mind when you are developing.

### jSocket.close() ###
Call this method to close the socket connection. This does **not** trigger the [jSocket.onClose](Reference#jSocket.onClose().md) event.

### jSocket.write(data) ###
**data:string** string to be sent to server<br />
Call this method to send a string through the connected socket.

If you want to send other data types you should have a look at the [jsocket.advanced.js reference](ReferenceAdvanced.md)

## Events ##

### jSocket.onReady() ###
Called by the socket when socket is ready for use. You can use [jSocket.connect](Reference#jSocket.connect(host,_port).md) after this has fired.

### jSocket.onConnect(success, error) ###
**success:boolean** true if connection was succesful<br />
**error:string** flash IO error message<br />
Called when socket has finished connecting. success will either be true when the connection is estabilished or false when it failed.
error will contain the error text when the connection fails.

### jSocket.onData(data) ###
**data:string** string sent by the server<br />
Called when jSocket has has received a string from the server over the socket connection.<br />
**Please note that if you use jsocket.advanced.js or the jsocket.advanced.swf the use of the argument of this callback changes.** [jsocket.advanced.js reference](ReferenceAdvanced.md)

### jSocket.onClose() ###
Called when the socket connection has been closed server side.