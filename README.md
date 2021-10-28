Create an SSH Tunnel to a remote MongoDB server
Here's an example command that I used to create an SSH tunnel between port 8000 on my local machine and the MongoDB port 27017 on an Ubuntu server running on AWS EC2.

ssh -i ~/my-aws-key.pem -N -f -L 8000:localhost:27017 ubuntu@ec2-54-252-168-106.ap-southeast-2.compute.amazonaws.com
-i ~/my-aws-key.pem specifies the path to the ssh private key file to use for authentication.
-N instructs ssh not execute a remote command, so it won't open a remote shell on the server.
-f instructs ssh to run in the background.
-L 8000:localhost:27017 tells ssh to connect your local (L) port 8000 to the address + port localhost:27017 on the server, in other words to MongoDB running locally on the server.
ubuntu@ec2-54-252-168-106.ap-southeast-2.compute.amazonaws.com is the username and address to the AWS EC2 server that I used for testing.
