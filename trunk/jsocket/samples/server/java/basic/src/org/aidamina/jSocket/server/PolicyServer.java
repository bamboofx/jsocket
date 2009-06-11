package org.aidamina.jSocket.server;

import java.io.*;
import java.net.*;

public class PolicyServer implements Runnable
{
	
	int port = 843;
	private byte [] contents;
	private ServerSocket server;
	public PolicyServer() throws IOException 
	{
		DataInputStream dis = new DataInputStream(new FileInputStream("crossdomain.xml"));
		contents = new byte [dis.available()];
		dis.readFully(contents);		
		server = new ServerSocket(port);
	}

	@Override
	public void run() {
		try {
			 
			Socket client = server.accept();
			new Thread(this).start();
			while(client.getInputStream().available()==0)
				Thread.sleep(0);
			System.out.println("Policy Server Accepted: " +client.getRemoteSocketAddress());

			System.out.println("Sending crossdomain.xml");			
			
			client.getOutputStream().write(contents);
			client.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	public static PolicyServer Start()
	{
		PolicyServer policyServer = null;
		try {
			policyServer = new PolicyServer();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Thread thread = new Thread(policyServer);
		
		// background thread
		thread.setDaemon(true);
		thread.start();
		return policyServer;
		
	}
	
	
}
