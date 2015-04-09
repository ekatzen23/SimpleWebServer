require 'socket'

a = TCPServer.new('', 3333) # '' means to bind to "all interfaces", same as nil or '0.0.0.0'
loop {
  connection = a.accept
  puts "Received: " + connection.recv(1024)
  connection.write "Server says Hello!"
  connection.close
}