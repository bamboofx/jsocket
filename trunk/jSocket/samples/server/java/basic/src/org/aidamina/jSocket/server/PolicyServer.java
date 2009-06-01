package org.aidamina.jSocket.server;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class PolicyServer implements Runnable
{
	
	int port = 843;
	
	public PolicyServer()
	{
		
		
		
	}

	@Override
	public void run() {
		try {
			final ServerSocket server = new ServerSocket(port);
			final Thread listenerThread = Thread.currentThread();
			DataInputStream dis = new DataInputStream(new FileInputStream("crossdomain.xml"));
			final byte [] contents = new byte [dis.available()];
			dis.readFully(contents);  
			 
			
			while(true)
			{
				try {
		
					final Socket client = server.accept();
					System.out.println("Policy Server Accepted: " +client.getRemoteSocketAddress());

					System.out.println("Sending crossdomain.xml");			
					
					client.getOutputStream().write(contents);
					client.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}		
				
			}
			
			
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	public static Thread Start()
	{
		PolicyServer policyServer = new PolicyServer();
		Thread thread = new Thread(policyServer);
		
		// background thread
		thread.setDaemon(true);
		thread.start();
		return thread;
		
	}
	
	
}
