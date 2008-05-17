package  
{
	
	public class jSocket 
	{
		
		import flash.external.ExternalInterface;
		import flash.events.*;
		import flash.net.*;
		private var socket:Socket;
		private var id:int;
		public function jSocket(id:int) 
		{
			this.id = id;
			socket = new Socket();
			socket.addEventListener("close", onClose);
			socket.addEventListener("connect", onConnect);
			socket.addEventListener("ioError", onError);
			socket.addEventListener("securityError", onError);
			socket.addEventListener("socketData", onData);
			
			ExternalInterface.addCallback("connect", this.connect);
			ExternalInterface.addCallback("close", this.close);
			
			ExternalInterface.addCallback("writeInt", socket.writeInt);
		

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
			trace("onConnect ("+id+")");
			ExternalInterface.call("jSocket_onConnect", id);
			
			write(id);
		}
		
		private function onError(event:IOErrorEvent):void
		{
			
			trace("onError ("+id+", '"+event.text+"')");
			ExternalInterface.call("jSocket_onError", id, event.text);
			
		}
		
		
		private function onClose(event:Event):void
		{
			
			trace("onClose ("+id+")");
			ExternalInterface.call("jSocket_onClose", id);
			
		}
		
		private function onData(event:DataEvent):void
		{
			
			trace("onData ("+id+", '"+event.text+"')");
			ExternalInterface.call("jSocket_onData", id, event.text);
			
		}
		

		
	}
	
}