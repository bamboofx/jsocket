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
			ExternalInterface.addCallback("flush", this.flush);
			
			//Int
			ExternalInterface.addCallback("writeInt", this.writeInt);
			ExternalInterface.addCallback("readInt", this.writeInt);
			
			//Uint
			ExternalInterface.addCallback("writeUnsignedInt", this.writeUnsignedInt);
			ExternalInterface.addCallback("readUnsignedInt", this.readUnsignedInt);
			
			//UTF
			ExternalInterface.addCallback("writeUTFBytes", this.writeUTFBytes);
			ExternalInterface.addCallback("readUTFBytes", this.readUTFBytes);
			ExternalInterface.addCallback("writeUTF", this.writeUTF);
			ExternalInterface.addCallback("readUTF", this.readUTF);
			
			
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
		public function flush():void
		{
			trace("flush");	
			socket.flush();
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
		
		private function onData(event:ProgressEvent):void
		{
			
			trace("jSocket_onData ("+id+", '"+event.bytesLoaded+"')");
			ExternalInterface.call("jSocket_onData", id, event.bytesLoaded);
			
		}
		
		// Int
		public function writeInt(data:int):void
		{			
			socket.writeInt(data);			
		}
		
		public function readInt():int
		{
			return socket.readInt();	
		}
		
		// Uint
		public function writeUnsignedInt(data:uint):void
		{
			socket.writeUnsignedInt(data);			
		}		
		
		public function readUnsignedInt():uint
		{
			return socket.readUnsignedInt();	
		}
		
		
		//UTF		
		public function writeUTFBytes(data:String):void
		{			
			socket.writeUTFBytes(data)
					
		}		
		
		public function readUTFBytes(length:int):String
		{			
			return socket.readUTFBytes(length);
					
		}
		
		public function writeUTF(data:String):void
		{			
			socket.writeUTF(data)
					
		}		
		
		public function readUTF():String
		{			
			return socket.readUTF();
					
		}
		
		

		
		
		
	}
	
}