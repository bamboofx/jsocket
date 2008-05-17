package  
{
	
	public class Javascript 
	{
		import flash.external.ExternalInterface;
		
		public static function trace(data):void
		{
			ExternalInterface.call("trace", data);
			
		}
		
	}
	
}