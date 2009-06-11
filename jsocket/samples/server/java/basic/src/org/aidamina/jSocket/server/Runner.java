package org.aidamina.jSocket.server;

import java.io.IOException;
import java.net.Socket;

public class Runner implements Server.OnConnectCallback,Client.OnDataCallback,Client.OnCloseCallback{

	public Runner() {
		
		PolicyServer.Start();
				
		Server server = new Server(90);
		server.OnConnect.add(this);
		
		server.run();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
			new Runner();
	}

	@Override
	public void onConnect(Client client) {
		try {
			client.OnData.add(this);
			client.OnClose.add(this);
			Socket socket = client.getSocket();
			System.out.println(socket.getInputStream().available());
			socket.getOutputStream().write("blagh".getBytes());
			socket.getOutputStream().flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void onData(Client client, byte[] data) {

		System.out.println(new String(data));
		
	}
	public void onClose(Client client) {

		System.out.println("Closed: "+client.getSocket().getRemoteSocketAddress());
		
	}

}
