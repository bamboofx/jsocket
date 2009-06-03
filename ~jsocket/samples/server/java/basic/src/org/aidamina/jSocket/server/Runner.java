package org.aidamina.jSocket.server;

import java.io.IOException;

public class Runner implements Server.OnConnectCallback{

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
			System.out.println(client.getSocket().getInputStream().available());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
