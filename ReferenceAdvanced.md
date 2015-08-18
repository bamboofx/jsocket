# jSocket Object #

# UNDER CONTRUCTION #

## Constructor ##

### jSocket() ###
Contructor of our jSocket Object.
Internal id registration takes place here.


## Methods ##

### jSocket.setup(target) ###
Call this method to setup the socket. [jSocket.setup] takes the required argument target, which should contain an id that points to a container where jSocket will place the flash file in. After the DOM has updated and the flash file has loaded, it will fire [jSocket.onReady].

### jSocket.connect(host, port) ###
Call this method to connect to a listening socket. Method takes two required arguments, host which should be a host name or a valid ip address to connect to, and port to indicate which port we are connecting on, Flash requires us to use ports above 1024 for security reasons. Once the connection process has finished it will fire [jSocket.onConnect].

### jSocket.close() ###
Call this method to close the socket connection. It's important to know that this will **not** trigger the [jSocket.onClose] event

### jSocket.readBoolean() ###
Reads a Boolean value from the stream.

### jSocket.readByte() ###
Reads a signed byte from the stream.

### jSocket.readBytes(length) ###
Reads the number of data bytes, specified by the length parameter, from the stream.

### jSocket.readDouble() ###
Reads an IEEE 754 double-precision floating point number from the stream.

### jSocket.readFloat() ###
Reads an IEEE 754 single-precision floating point number from the stream.

### jSocket.readInt() ###
Reads a signed 32-bit integer from the stream.

### jSocket.readMultiByte(length, charSet) ###
Reads a multibyte string of specified length from the stream using the specified character set.

### jSocket.readObject() ###
Reads an object from the stream, encoded in AMF serialized format.

### jSocket.readShort() ###
Reads a signed 16-bit integer from the stream.

### jSocket.readUnsignedByte() ###
Reads an unsigned byte from the stream.

### jSocket.readUnsignedInt() ###
Reads an unsigned 32-bit integer from the stream.

### jSocket.readUnsignedShort() ###
Reads an unsigned 16-bit integer from the stream.

### jSocket.readUTF() ###
Reads a UTF-8 string from the stream.

### jSocket.readUTFBytes(length) ###
Reads a sequence of UTF-8 bytes from the stream and returns a string.


### jSocket.write(value) ###
Call this method to send data over the socket connection. Method takes one required argument, which should contain the data that will be sent over the connection.

### jSocket.writeBoolean(value) ###
Writes a Boolean value.

### jSocket.writeByte(value) ###
Writes a byte.

### jSocket.writeBytes(bytes, offset, length) ###
Writes a sequence of bytes from the specified byte array, bytes, starting offset(zero-based index) bytes with a length specified by length, into socket.

### jSocket.writeDouble(value) ###
Writes an IEEE 754 double-precision (64-bit) floating point number.

### jSocket.writeFloat(value) ###
Writes an IEEE 754 single-precision (32-bit) floating point number.

### jSocket.writeInt(value) ###
Writes a 32-bit signed integer.

### jSocket.writeMultiByte(value, charSet) ###
Writes a multibyte string to the stream.

### jSocket.writeArray(array) ###
Writes an array to the stream.

### jSocket.writeObject(object) ###
Writes an object to the stream.

### jSocket.writeShort(value) ###
Writes a 16-bit integer.

### jSocket.writeUnsignedInt(value) ###
Writes a 32-bit unsigned integer.

### jSocket.writeUTF(value) ###
Writes a UTF-8 string to the stream.

### jSocket.writeUTFBytes(value) ###
Writes a UTF-8 string.

### jSocket.getObjectEncoding() ###
Used to determine whether the AMF3 or AMF0 format is used when writing or reading binary data using the writeObject() method. The value is a constant from the ObjectEncoding class.

### jSocket.setObjectEncoding(value) ###
Set the ObjectEncoding to AMF3 or AMF0

### jSocket.getEndian() ###
The byte order for the data, either the BIG\_ENDIAN or LITTLE\_ENDIAN constant from the Endian class.

### jSocket.setEndian(value) ###
The byte order for the data, either the BIG\_ENDIAN or LITTLE\_ENDIAN constant from the Endian class.

### jSocket.getBytesAvailable() ###
The number of bytes of data available for reading in the input buffer.

## Events ##

### jSocket.onReady() ###
Called by the socket when socket is ready for use.

### jSocket.onConnect(success,error) ###
Called by the socket when socket has finished connecting.
success will either be true when the connection is estabilished or false when it failed.
error will contain the error text when the connection fails.

### jSocket.onData(length) ###
Called by the socket when socket has has received data.
data will contain the received data.

### jSocket.onClose() ###
Called by the socket when socket has been closed on the other side.