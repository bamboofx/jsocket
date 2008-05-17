package org.aidamina.jSocket.server;

import java.io.*;
import java.net.Socket;

public class Test 
{
	Test(Socket client)throws Exception
	{
		DataInputStream dis = new DataInputStream(client.getInputStream());
		dis.readInt();
		
		
		
		
	}

}
