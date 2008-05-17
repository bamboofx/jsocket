package org.aidamina.jSocket.server;

import java.io.*;
import java.net.Socket;

public class Test 
{
	Test(Socket client)throws Exception
	{
		System.out.println("Test starting");
		
		DataInputStream dis = new DataInputStream(client.getInputStream());
		
		Thread.sleep(1000);
		
		
		System.out.println(dis.readBoolean());
		System.out.println(dis.readInt());
		System.out.println(dis.readFloat());
		System.out.println(dis.readDouble());
		System.out.println(dis.readUTF());
		byte [] arr = new byte[3];
		Thread.sleep(1000);
		System.out.println(dis.available());
		dis.read(arr, 0, 3);
		System.out.println(arr[0]+" "+arr[1]+" "+arr[2]);
		
		
	}

}
