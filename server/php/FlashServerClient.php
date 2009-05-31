<?php
include('phpsocketdaemon-1.0/socket.php');

class FlashServer extends socketServer {}

class FlashServerClient extends socketServerClient
{
	public function on_connect()
	{
		echo $this->remote_address.' connected'."\n";
	}
	
	public function on_disconnect()
	{
		echo $this->remote_address.' disconnected'."\n";
	}
	
	public function on_read()
	{
		if(false !== strpos($this->read_buffer,"\0"))
		{
			$data = trim($this->read_buffer);
			$this->read_buffer  = '';
			if($data == '<policy-file-request/>')
			{
				echo 'Policy file request! Return the crossdomain.xml'."\n";
				$this->write(file_get_contents('crossdomain.xml'));
			}
			else
			{
				$packets = explode("\0", $data);
				$packets = array_map('trim', $packets); // Remove whitespace around packages
				
				foreach ($packets as $p)
				{
					echo 'Recieved '.$p."\n";
					$this->write('hello to you too');
				}
			}
		}
	}

	public function write($buffer, $length = 4096)
	{
		echo 'Sending '.$buffer."\n";
		return parent::write($buffer."\0", $length);
	}
}