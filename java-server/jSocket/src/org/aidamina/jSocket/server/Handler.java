package org.aidamina.jSocket.server;

import java.io.IOException;
import java.net.Socket;

public class Handler {

	public Handler(Socket client) throws IOException 
	{
		// Check if we get a security request
		if(client.getInputStream().available()==23) 
		{
			
			
			
		}
		
	}

}
