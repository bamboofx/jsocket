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
			
			var url:String = root.loaderInfo.url;
			var id:String = url.substring(url.lastIndexOf("?") + 1, url.length);
			
			var socket:jSocket = new jSocket(id);						
			
		}
	}
}