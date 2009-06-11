package org.aidamina.jSocket.server;
import java.net.*;
import java.util.*;
public class Server implements Runnable{

	
	int port;
	List<OnConnectCallback> OnConnect = new LinkedList<OnConnectCallback> ();
	public Server(int port) {
		
		this.port = port;

	}
	
	@Override
	public void run() {
		try
		{
			ServerSocket server = new ServerSocket(port);
			
			System.out.println("Listening on port "+port);
			while(true)
			{
				final Socket socket = server.accept();
				System.out.println("Accepted: " +socket.getRemoteSocketAddress());
				
				
				new Thread(new Runnable() {
					@Override
					public void run() {
						try {
							Client client = new Client(socket);
							for(OnConnectCallback callback : OnConnect)
							{
								callback.onConnect(client);								
								
							}
						} catch (Exception e) {
							e.printStackTrace();
						}						
					}					
				}).start();		
			}		
		}catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
	}
	public interface OnConnectCallback {
		public void onConnect(Client client);
	}




}
