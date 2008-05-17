package  
{
	
	public class Javascript 
	{
		import flash.external.ExternalInterface;
		public function Javascript() 
		{
			
		}
		
		public static function trace(data):void
		{
			ExternalInterface.call("trace", data);
			
			
			
		}
		
	}
	
}