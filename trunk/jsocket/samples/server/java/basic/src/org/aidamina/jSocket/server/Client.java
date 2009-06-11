package org.aidamina.jSocket.server;

import java.io.IOException;
import java.net.Socket;
import java.util.*;

public class Client implements Runnable 
{
	private Socket socket;
	List<OnDataCallback> OnData = new LinkedList<OnDataCallback> ();
	List<OnCloseCallback> OnClose = new LinkedList<OnCloseCallback> ();
	
	public Client(Socket socket)
	{
		this.socket = socket;
		new Thread(this).start();
		
		
	}
	public void send(byte [] data)
	{
		try {
			socket.getOutputStream().write(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	public Socket getSocket() {
		return socket;
	}
	@Override
	public void run() {
		
		try {
			
			while(true)
			{
				while(socket.getInputStream().available()==0&&socket.isConnected())
				{
					Thread.sleep(1);
				}
					
				int size = socket.getInputStream().available();
				
				byte [] buffer = new byte[size];
				
				socket.getInputStream().read(buffer, 0, size);
				
				for(OnDataCallback callback : OnData)
				{
					callback.onData(this,buffer);							
					
				}	
				
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();
			
			for(OnCloseCallback callback : OnClose)
			{
				callback.onClose(this);								
				
			}	
		} 
		
	}
	public interface OnDataCallback {
		public void onData(Client client,byte [] data);
	}
	public interface OnCloseCallback {
		public void onClose(Client client);
	}
}
