<?php
class PolicyServer extends socketServer {}
class PolicyServerClient extends socketServerClient
{
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
		}
	}

	public function write($buffer, $length = 4096)
	{
		return parent::write($buffer."\0", $length);
	}
}
