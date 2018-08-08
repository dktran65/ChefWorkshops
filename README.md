# ChefWorkshops

## Basics
The cookbooks in this repo will install
- MongoDB v2.6.12
- Tomcat 8.5.32
on Linux CentOS 7.5


## Details
The MongoDB cookbook is a simple installation
- Determine the proper mongoDB download resource to use base on the host cpu
- Use templates holding static defined configuration
- Install mongoDB package
- Start MongoDB Daemon process now and enable when reboot start.

The Tomcat cookbook is bit more involve in setup then Environment
- Install the Java JDK
- Create user/group for tomcat app
- Download and extract apache Tomcat, and then config the environment
- Configure the file and folders permission
- Final step to kick start the tomcat daemon and it get enable at reboot time.
