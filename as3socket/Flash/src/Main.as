package 
{
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	import jSocket;
	
	public class Main extends Sprite
	{
		public function Main():void
		{
			ExternalInterface.marshallExceptions = true;
			var id = _root._url.substring(_root._url.lastIndexOf("?")+1,_root._url.length);
			var socket:jSocket = new jSocket(id);
			//socket.connect("localhost", 3000);
			
			
			
		}
	}
}