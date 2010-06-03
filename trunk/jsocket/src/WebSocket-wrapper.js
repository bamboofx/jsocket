// parseUri 1.2.2
// (c) Steven Levithan <stevenlevithan.com>
// MIT License
function parseUri (str) {
	var	o   = parseUri.options,
		m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
		uri = {},
		i   = 14;

	while (i--) uri[o.key[i]] = m[i] || "";

	uri[o.q.name] = {};
	uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
		if ($1) uri[o.q.name][$1] = $2;
	});

	return uri;
};

parseUri.options = {
	strictMode: false,
	key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
	q:   {
		name:   "queryKey",
		parser: /(?:^|&)([^&=]*)=?([^&]*)/g
	},
	parser: {
		strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
		loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
	}
};


(function(){
var t = window.WebSocketTunnel || {};
window.WebSocketTunnel = t;

function WebSocket(url,protocol){
	var ws = this;
	
	var uri = parseUri(url);
	
	this._eventEl = document.createElement("div");
	this._flashEl = document.createElement("div");
	
	
	function onready(){
	
		console.log("socket ready");
		ws._socket.connect(uri["host"],uri["port"]);
	
	}
	function onconnect(result,msg){
	
		alert(result+" "+msg);
	}
	
	
	this._socket = new jSocket(onready,onconnect);
	function rdy(){return document.readyState === "complete";}
	
	function setup(){
		var tar = "__"+ws._socket.id;
		ws._flashEl.setAttribute("id",tar);
		document.body.appendChild(ws._flashEl);	
		ws._socket.setup(tar);
	}
	
	if ( rdy() ) 
		setup();
	else{
		var iv = window.setInterval(function(){
			if ( rdy() ) {
				window.clearInterval(iv);
				setup();			
			}		
		},50);
	}
	
	

}
WebSocket.CONNECTING  =0;
WebSocket.OPEN = 1;
WebSocket.CLOSING = 2;
WebSocket.CLOSED = 3;

WebSocket.prototype.readyState = WebSocket.CONNECTING;
WebSocket.prototype.bufferedAmount = 0;

WebSocket.prototype.send = function(data){

	

}


WebSocket.prototype.close = function(){

	

}

WebSocket.prototype.addEventListener = function(type,listener,useCapture){
	this._eventEl.addEventListener(type,listener,useCapture);
}
WebSocket.prototype.removeEventListener = function(type,listener,useCapture){
	this._eventEl.removeEventListener(type,listener,useCapture);
}
WebSocket.prototype.dispatchEvent = function(evt){
	
	if(["open","message","error","close"].indexOf(evt.type)!=-1)
	{
		var h = this["on"+evt.type];
		if(h)
			h(evt);
	
	}
	return this._eventEl.dispatchEvent(evt);

	return false;

}
                     
/*
var ws = new WebSocket("ws://127.0.0.1:8181/service");



var event = document.createEvent("Event");
event.initEvent("open",false,false);

ws.dispatchEvent(event);


*/

if (!window.WebSocket)
	window.WebSocket = WebSocket;




})();