#client side
import socket
host=socket.gethostname()
port=7777
c=socket.socket()
c.connect((host,port))
message=input('->>')
while message.lower().strip()!="bye":
    c.send(message.encode())
    data=c.recv(1024).decode()
    print("Recieved from server:"+ data)
    message=input("->>")
c.close()    
