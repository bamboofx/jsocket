package  
{
	
	public class jSocket 
	{
		
		import flash.external.ExternalInterface;
		import flash.events.*;
		import flash.net.*;
		private var socket:Socket;
		private var id:String;
		
		private function trace(data):void
		{
			Javascript.trace(data);
			
			
		}
		
		private function add(name:String, f:Function):void
		{
			ExternalInterface.addCallback(name, f);
			
			
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
			
			add("connect", connect);
			add("close", close);
			add("flush", flush);
			
			//Int
			add("writeInt", writeInt);
			add("readInt", writeInt);
			
			//Uint
			add("writeUnsignedInt", writeUnsignedInt);
			add("readUnsignedInt", readUnsignedInt);
			
			//UTF
			add("writeUTFBytes", writeUTFBytes);
			add("readUTFBytes", readUTFBytes);
			add("writeUTF", writeUTF);
			add("readUTF", readUTF);
			
			//AMF
			add("writeObject", writeObject);
			add("readObject", readObject);
			add("setObjectEncoding", setObjectEncoding);
			add("getObjectEncoding", getObjectEncoding);
			
			
			ExternalInterface.call("jSocket_onInit",id);		

		}	
				
	
		
		public function connect(host:String, port:int):void
		{			
			socket.connect(host, port);			
			
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
		
		//AMF

		public function writeObject(data:Object):void
		{			
			socket.writeObject(data)
					
		}		
		
		public function readObject():Object
		{			
			return socket.readObject();
					
		}
		
		public function setObjectEncoding(data:uint):void
		{			
			socket.objectEncoding = data
					
		}		
		
		public function getObjectEncoding():uint
		{			
			return socket.objectEncoding;
					
		}
		
		
	}
	
}