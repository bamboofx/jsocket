<?php
class FlashServer extends socketServer {}

class FlashServerClient extends socketServerClient
{
	public function on_connect()
	{
		//echo $this->remote_address.' connected'."\n";
	}
	
	public function on_disconnect()
	{
		//echo $this->remote_address.' disconnected'."\n";
	}
	
	public function on_read()
	{
		$data = $this->read_buffer;
		$this->read_buffer  = '';
		$this->write($data);
	}

	public function write($buffer, $length = 4096)
	{
		return parent::write($buffer, $length);
	}
}