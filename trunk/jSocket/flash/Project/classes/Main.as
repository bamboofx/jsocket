import flash.external.ExternalInterface;
class Main{
	var s;
	var id;
	
	function connect(host,port){
		if(s){
			s.close();
			delete s;
		}
		
		s = new XMLSocket();
		
		var me= this;
		s.onConnect = function(success){			
			ExternalInterface.call("jSocket_Connect",me.id,success);			
		}		
		s.onData = 	function(data){
			ExternalInterface.call("jSocket_Data",me.id,data);
		}
		s.onClose = function(){
			ExternalInterface.call("jSocket_Close",me.id);
		}
		if(!s.connect(host,port)){
			ExternalInterface.call("jSocket_Connect",id,false);			
		}
	
	}
	function send(data){	
		return s.send(data);
	}	
	
	function close(){
		s.close();
		delete s;		
	}
	
	function Main(){
		ExternalInterface.addCallback("connect", this, connect);
		ExternalInterface.addCallback("send", this, send); 
		ExternalInterface.addCallback("close", this, close);		
		id = _root._url.substring(_root._url.lastIndexOf("?")+1,_root._url.length);		
		ExternalInterface.call("jSocket_Init",id);		
	}
	
	static function main(){
		var m = new Main();		
	}
}
