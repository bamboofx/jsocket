package  
{
	
	public class jSocket 
	{
		
		import flash.external.ExternalInterface;
		import flash.events.*;
		import flash.net.*;
		private var socket:Socket;
		private var id:String;
		
		public function trace(data):void
		{
			Javascript.trace(data);
			
			
		}
		public function jSocket(id:String) 
		{
			this.id = id;
			socket = new Socket();
			socket.addEventListener("close", onClose);
			socket.addEventListener("connect", onConnect);
			socket.addEventListener("ioError", onError);
			socket.addEventListener("securityError", onSecurityError);
			socket.addEventListener("socketData", onData);
			
			ExternalInterface.addCallback("connect", this.connect);
			ExternalInterface.addCallback("close", this.close);
			
			ExternalInterface.addCallback("writeInt", socket.writeInt);
			ExternalInterface.call("jSocket_onInit",id);		

		}	
				
	
		
		public function connect(host:String, port:int):void
		{	
			
			socket.connect(host, port);
			
			
		}
		
		
		
		public function write(data):void
		{
			trace(typeof(data));
			switch(typeof(data))
			{
				case int:
					socket.writeInt(data);
					break;
				case String:
					socket.writeUTFBytes(data);
					break;
				
				
				
				
				default: 
					trace("default");
				
			}
			
			
		}
		
		public function close():void
		{
			socket.close();
			trace("close");			
			
			
		}
		
		
		
		
		private function onConnect(event:Event):void
		{
			trace("jSocket_onConnect ("+id+")");
			ExternalInterface.call("jSocket_onConnect", id);
			
		}
		
		private function onError(event:IOErrorEvent):void
		{
			
			trace("jSocket_onError ("+id+", '"+event.text+"')");
			ExternalInterface.call("jSocket_onError", id, event.text);
			
		}
		private function onSecurityError(event:SecurityErrorEvent):void
		{
			
			trace("jSocket_onError ("+id+", '"+event.text+"')");
			ExternalInterface.call("jSocket_onError", id, event.text);
			
		}		
		
		private function onClose(event:Event):void
		{
			
			trace("jSocket_onClose ("+id+")");
			ExternalInterface.call("jSocket_onClose", id);
			
		}
		
		private function onData(event:DataEvent):void
		{
			
			trace("jSocket_onData ("+id+", '"+event.text+"')");
			ExternalInterface.call("jSocket_onData", id, event.text);
			
		}
		
	}
	
}