package org.aidamina.jSocket.server;

import java.io.*;
import java.net.Socket;

public class Handler {

	public Handler(Socket client) throws Exception 
	{
		// Check if we get a security request
		if(client.getInputStream().available()==23) 
		{
			System.out.println("Sending crossdomain.xml");
			
			DataInputStream dis = new DataInputStream(new FileInputStream("crossdomain.xml"));
			String contents = "";
		      while (dis.available() != 0)
		    	  contents+=dis.readLine();
		      
		      client.getOutputStream().write(contents.getBytes());
		      client.getOutputStream().flush();
		      client.close();
		}
		else
		{
			
			new Test(client);
			
			
		}
			
		
		
	}

}
