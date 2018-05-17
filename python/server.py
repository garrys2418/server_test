import socket
import time
import os
import sys

    # get the hostname
host = socket.gethostname()
host1 = os.environ["HOSTNAME"]
ts = time.time()
port = 6666  # initiate port no above 1024

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print ("Socket created")
 
#Bind socket to local host and port
try:
    s.bind((host, port))
except socket.error as msg:
    print ("Bind failed. Error Code : " + str(msg[0]) + " Message " + msg[1])
    sys.exit()
     
print ("Socket bind complete")
 
#Start listening on socket
s.listen(10)
print ("Socket now listening")
 
#now keep talking with the client
while 1:
    #wait to accept a connection - blocking call
    conn, addr = s.accept()
    data = conn.recv(1024).decode()
    print("timestamp:" + str(ts) + " hostname:" + str(host1) + " container: " + str(host)  + " message: " + str(data))
     
s.close()


    