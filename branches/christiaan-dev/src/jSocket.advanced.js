// The MIT License

// Copyright (c) 2008 Tjeerd Jan 'Aidamina' van der Molen
// http://jsocket.googlecode.com

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


// Int
jSocket.prototype.writeInt = function(data){
    if(!this.connected||!this.movie)
        throw "jSocket is not connected, use the onConnect event ";
    return this.movie.writeInt(data);  
}

// Boolean
jSocket.prototype.writeBoolean = function(data){
    this.checkConnected();
	this.movie.writeBoolean(data);			
}

jSocket.prototype.readBoolean = function(){
    this.checkConnected();
	return this.movie.readBoolean();
}

// Byte
jSocket.prototype.writeByte = function(data){
    this.checkConnected();
	this.movie.writeByte(data);
}

jSocket.prototype.readByte = function(){
    this.checkConnected();
	return this.movie.readByte();
}

jSocket.prototype.writeBytes = function(bytes, offset, length){
    this.checkConnected();
	this.movie.writeBytes(bytes, offset, length);	
}

jSocket.prototype.readBytes = function(length){
    this.checkConnected();
	return this.movie.readBytes(length);
}

// Short
jSocket.prototype.writeShort = function(data){			
    this.checkConnected();
	this.movie.writeShort(data);			
}

jSocket.prototype.readShort = function(){
    this.checkConnected();
	return this.movie.readShort();
}

// Int
jSocket.prototype.writeInt = function(data){			
    this.checkConnected();
	this.movie.writeInt(data);			
}

jSocket.prototype.readInt = function(){
    this.checkConnected();
	return this.movie.readInt();
}

// Uint
jSocket.prototype.writeUnsignedInt = function(data){
    this.checkConnected();
	this.movie.writeUnsignedInt(data);
}

jSocket.prototype.readUnsignedInt = function(){
    this.checkConnected();
	return this.movie.readUnsignedInt();
}

// Float
jSocket.prototype.writeFloat = function(data){
    this.checkConnected();
	this.movie.writeFloat(data);
}

jSocket.prototype.readFloat = function(){
    this.checkConnected();
	return this.movie.readFloat();
}

// Double
jSocket.prototype.writeDouble = function(data){
    this.checkConnected();
	this.movie.writeDouble(data);			
}

jSocket.prototype.readDouble = function(){
    this.checkConnected();
	return this.movie.readDouble();
}

// MultiByte		
jSocket.prototype.writeMultiByte = function(value, charSet){
    this.checkConnected();
	this.movie.writeMultiByte(value, charSet);
}

jSocket.prototype.readMultiByte = function(length,charSet){
    this.checkConnected();
	return this.movie.readMultiByte(length, charSet);
}

//UTF		
jSocket.prototype.writeUTFBytes = function(data){
    this.checkConnected();
	this.movie.writeUTFBytes(data);
}		

jSocket.prototype.readUTFBytes = function(length){
    this.checkConnected();
	return this.movie.readUTFBytes(length);	
}

jSocket.prototype.writeUTF = function(data){
    this.checkConnected();
	this.movie.writeUTF(data);
}		

jSocket.prototype.readUTF = function(){
    this.checkConnected();
	return this.movie.readUTF();
}

// Array
jSocket.prototype.writeArray = function(data){
    this.checkConnected();
    this.movie.writeArray(data);
}

// Object
jSocket.prototype.writeObject = function(data){
    this.checkConnected();
	this.movie.writeObject(data);
}

jSocket.prototype.readObject = function(){
	return this.movie.readObject();
}

// Properties
jSocket.prototype.setObjectEncoding = function(value){
	this.movie.setObjectEncoding(value);
}

jSocket.prototype.getObjectEncoding = function(){
	return this.movie.getObjectEncoding();
}

jSocket.prototype.setEndian = function(value){
	this.movie.setEndian(value);
}

jSocket.prototype.getEndian = function(){
	return this.movie.getEndian();
}

jSocket.prototype.getBytesAvailable = function(){
    return this.movie.getBytesAvailable();
}