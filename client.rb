require 'socket'  
  
host = 'localhost'
port = 2000

# input validation: require GET or POST
input = ''
until input == 'GET' || input == 'POST'
  print 'What type of request do you want to submit [GET, POST]? '
  input = gets.chomp
end


if input == 'GET'
  request = "GET /index.html HTTP/1.0\r\n\r\n"
end

socket = TCPSocket.open(host,port)            # Connect to server
socket.print(request)                         # Send request
response = socket.read                        # Read complete response                                              
headers,body = response.split("\r\n\r\n", 2)  # Split response at first blank line into headers and body
puts ''
print body
socket.close
