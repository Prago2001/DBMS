import socket
while True:
c = input("""
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
""")
if c == "1":
url = input("Enter URL: ")
ip = socket.gethostbyname(url)
print("IP address is:", ip)
if c == "2":
ip = input("Enter IP : ")
url = socket.gethostbyaddr(ip)
print("URL is:", url)
if c == "3":
break
'''
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
1
Enter URL: google.com
IP address is: 172.217.167.174
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
2
Enter IP : 172.217.167.174
URL is: ('bom12s01-in-f14.1e100.net', [], ['172.217.167.174'])
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
1
Enter URL: hackerrank.com
IP address is: 3.212.46.165
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
2
Enter IP : 3.212.46.165URL is: ('ec2-3-212-46-165.compute-1.amazonaws.com', [], ['3.212.46.165'])
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
1
Enter URL: codeforces.com
IP address is: 213.248.110.126
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
2
Enter IP : 213.248.110.126
URL is: ('213-248-110-126.teliacarrier-cust.com', [], ['213.248.110.126'])
What to perform?
1. Get IP address from URL
2. Get URL from IP address
3. Exit
3
Process finished with exit code 0
'''