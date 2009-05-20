// The MIT License

// Copyright (c) 2008 Tjeerd Jan 'Aidamina' van der Molen
// http://jsocket.googlecode.com

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


// jSocket Constructor
function jSocket(){

	this.id = "jSocket_"+ (++jSocket.last_id);
    	
	jSocket.sockets[this.id] = this;     
    
    // Unused variable name used in flash for testing
    // Should use jSocket.variableTest = 'whatever' 
    // If you are using a variable 'xt' in your flashmovie
    this.variableTest ='xt';     
    // Connection state
    this.connected = false;  
}

/**
 * Object used as array with named keys to
 * keep references to the instantiated sockets
 * @var Object
 */
jSocket.sockets = {};

/**
 * Id used to generate a unique id for the embedded swf
 * @var int
 */
jSocket.last_id = 0;

// Find the Swf object
jSocket.prototype.findSwf = function(){
	if (window.document[this.id]){
		return window.document[this.id];
	}
	if (document.embeds && document.embeds[this.id]){
		return document.embeds[this.id]; 
    }
    return document.getElementById(this.id);
}

// Setup the socket
// target: jQuery selector specifying the container that the jSocket will be placed in
jSocket.prototype.setup = function(target, swflocation)
{
	if(typeof(swfobject) == 'undefined')
		throw 'SWFObject not found! Please download from http://code.google.com/p/swfobject/';
    if(typeof(this.target) != 'undefined')
    	throw 'Can only call setup on a jSocket Object once.';
    this.target = target; 
    
    // Add the object to the dom
    return swfobject.embedSWF(
    	(swflocation ? swflocation : 'jSocket.swf')+'?'+this.id,
    	target,
    	'0', // width
    	'0', // height
    	'9.0.0',
    	'expressInstall.swf',
    	// Flashvars
    	{},
    	// Params
    	{'menu' : 'false'},
    	// Attributes
    	{'id':this.id, 'name':this.id}
    );
	
}

// Connect to a listening socket
// host: hostname/ip to connect to
// port: tcp/ip port to connect on
jSocket.prototype.connect = function(host,port){    
    if(!this.movie)
        throw "jSocket isn't ready yet, use the onReady event";
    if(this.connected)
        this.movie.close();
    this.movie.connect(host, port);     
}

//  Close the socket connection
jSocket.prototype.close = function(){
    this.connected = false;
    if(this.movie)
        this.movie.close();    
}

// Callback for the flash object to signal the flash file is loaded
// triggers jSocket.onReady
function jSocket_onInit(id){
    
    var socket = jSocket.sockets[id];
    
    var v = socket.variableTest;
    // Wait until we can actually set Variables in flash
    var f = function(){
        var err = true;
	    try{
	        // Needs to be in the loop, early results might fail, when DOM hasn't updated yet
	        var m = socket.findSwf();
            m.SetVariable(v, 't');
            if('t' != m.GetVariable(v))
                throw null;
            m.SetVariable(v, '');
            // Store the found movie for later use
            socket.movie = m; 
            err=false;
        }
        catch(e){ 
            setTimeout(f,0);
        }
        // Fire the event
        if(!err&&socket.onReady)
            socket.onReady();
    }
    setTimeout(f,0);
}

// Callback for the flash object to signal data is received
// triggers jSocket.onData
function jSocket_onData(id, size){
	var socket = jSocket.sockets[id];
    if(socket.onData)
        socket.onData(size);
}

// Callback for the flash object to signal the connection attempt is finished
// triggers jSocket.onConnect
function jSocket_onConnect(id){
	var socket = jSocket.sockets[id];
    socket.connected = true;
    if(socket.onConnect)
        socket.onConnect(true);
}

// Callback for the flash object to signal the connection attempt is finished
// triggers jSocket.onConnect
function jSocket_onError(id, error){
	var socket = jSocket.sockets[id];
    if(socket.onConnect)
        socket.onConnect(false,error);
}

// Callback for the flash object to signal the connection was closed from the other end
// triggers jSocket.onClose
function jSocket_onClose(id){
	var socket = jSocket.sockets[id];
    socket.connected = false;
    if(socket.onClose)
        socket.onClose();
}


jSocket.prototype.checkConnected = function(){      
    
    if(!this.connected||!this.movie)
        throw "jSocket is not connected, use the onConnect event ";
}

// Generic write
jSocket.prototype.write = function(data)
{
    this.checkConnected();
    this.movie.write(data);

}
