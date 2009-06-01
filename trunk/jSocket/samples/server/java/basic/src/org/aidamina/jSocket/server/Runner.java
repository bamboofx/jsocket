package org.aidamina.jSocket.server;

public class Runner {

	public Runner() {
		
		Thread t = PolicyServer.Start();
				
		Server server = new Server(3000);
		
		server.run();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
			new Runner();
	}

}
