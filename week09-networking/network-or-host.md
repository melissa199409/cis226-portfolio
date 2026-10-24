
Week 9: Network or host? My troubleshooting card

The four failures I saw

Could not resolve host

Connection refused

Connection timed out

HTTP 404 File not found

What each one means

Could not resolve host: This means the computer could not find the IP address for the website name. I would check the DNS and the hostname.

Connection refused: The connection was rejected. I would check if the web server is running and listening on the correct port.

Connection timed out: The destination did not respond in time. I would check the network connection, routing, and firewall.

HTTP 404: The server responded, but the requested page was not found. I would check the URL and the website files.

How it works

127.0.0.1 is the local loopback address. A server listening only on this address accepts connections from the same computer. 0.0.0.0 allows a server to listen on all IPv4 network interfaces. This can allow other computers to connect, depending on the firewall and network settings.
