# Simple Example #


Include the necesary javascript files:
```
<head>
	<script type="text/javascript" src="jsocket.js"></script>
</head>
```


The actual script:<body>
	<div id='mySocket'/>
	
	<script type='text/javascript'>
	// Host we are connecting to
	var host = 'localhost'; 
	// Port we are connecting on
	var port = 3000;
	
	var socket = new jSocket();
	
	// When the socket is added the to document 
	socket.onReady = function(){
		socket.connect(host, port);		
	}
	
	// Connection attempt finished
	socket.onConnect = function(success, msg){
		if(success){
			// Send something to the socket
			socket.write('Hello world');		
		}else{
			alert('Connection to the server could not be estabilished: ' + msg);		
		}	
	}
	socket.onData = function(data){
		alert('Received from socket: '+data);	
	}
	
	// Setup our socket in the div with the id="socket"
	socket.setup('mySocket');	
	
	</script>

</body>
}}```