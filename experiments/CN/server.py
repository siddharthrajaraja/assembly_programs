#server side program

import socket

host=socket.gethostname()
port=7777

s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host,port))
s.listen(2)
con,add=s.accept()
print("Connection from:",str(add))
while True:
    data=con.recv(1024).decode()
    if not data:
        break
    print("From client:"+str(data))
    data=input('->>')
    con.send(data.encode())
con.close()    
