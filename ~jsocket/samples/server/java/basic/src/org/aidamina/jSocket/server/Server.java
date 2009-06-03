package org.aidamina.jSocket.server;
import java.io.IOException;
import java.net.*;
import java.util.LinkedList;
import java.util.List;
public class Server implements Runnable{

	
	int port;
	List<OnConnectCallback> OnConnect = new LinkedList<Server.OnConnectCallback> ();
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
				while(socket.getInputStream().available()==0)
					Thread.sleep(0);
				
				new Thread(new Runnable() {
					@Override
					public void run() {
						try {
							Client client = new Client(socket);
							for(OnConnectCallback callback : OnConnect)
							{
								callback.onConnect(client);								
								
							}
							//new Handler(socket);
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
