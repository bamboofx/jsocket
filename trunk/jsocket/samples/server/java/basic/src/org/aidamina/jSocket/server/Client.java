package org.aidamina.jSocket.server;

import java.io.IOException;
import java.net.Socket;

public class Client implements Runnable 
{
	private Socket socket;
	public Client(Socket socket)
	{
		this.socket = socket;
		new Thread(this).start();
		
		
	}
	public Socket getSocket() {
		return socket;
	}
	@Override
	public void run() {
		
		try {
			
			while(true)
			{
				
				while(this.socket.getInputStream().available()==0)
					Thread.sleep(100);
					
				int size = socket.getInputStream().available();
				
				byte [] buffer = new byte[size];
				
				socket.getInputStream().read(buffer, 0, size);
				
				socket.getOutputStream().write(buffer);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
}
