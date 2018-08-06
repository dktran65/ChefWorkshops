# ChefWorkshops

## Basics
The cookbooks in this repo will install mongoDB v32.6.12  on Red Hat 7.5
- RHEL version:    $> cat /etc/redhat-release
- MongoDB version: $> mongo --version
- Tomcat version:: $>

## Details
The MongoDB cookbook is a simple installation
- Determine the proper mongoDB download resource to use base on the host cpu
- Use templates holding static defined configuration
- Install mongoDB package
- Start MongoDB Daemon process now and enable when reboot start.

The Tomcat cookbook  
