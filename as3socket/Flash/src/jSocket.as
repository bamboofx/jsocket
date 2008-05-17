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
			
			// Short
			add("writeShort", writeShort);
			add("readShort", writeShort);
			
			// Int
			add("writeInt", writeInt);
			add("readInt", writeInt);
			
			// Uint
			add("writeUnsignedInt", writeUnsignedInt);
			add("readUnsignedInt", readUnsignedInt);
			
			// Float
			
			
			// UTF
			add("writeUTFBytes", writeUTFBytes);
			add("readUTFBytes", readUTFBytes);
			add("writeUTF", writeUTF);
			add("readUTF", readUTF);
			
			// AMF
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
		}
		public function flush():void
		{
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
		
		// Short
		public function writeShort(data:int):void
		{			
			socket.writeShort(data);
			
		}
		
		public function readShort():int
		{
			return socket.readShort();	
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