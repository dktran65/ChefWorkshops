# tomcat

TODO: Enter the cookbook description here.

## Commands used to generate baseline files and folders
- $> chef generate cookbook cookbooks/tomcat
- $> chef generate recipe cookbooks/tomcat default
- $> chef generate template cookbooks/tomcat tomcat.services.erb

## Then make edits to the following files:
For the recipes/default.rb

    * Step to create user/group
    * Step to cleaning old download, in case, you are getting lazy to make things tunable
    * Step to download tomcat version, extract, setup, configuring, and permission
    * Step to kickstart the daemon service and enable at reboot time.

For the templates/tomcat.service.erb

    * Declare all the necessary static defined configuration
