#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
##

# TBD: Global variable which I could make it tunable
tomcat_path = '/opt/tomcat'
tomcat_ver = '8.5.32'


# Ensure our java package is installed
#  $ sudo yum install java-1.7.0-openjdk-devel
package 'java-1.7.0-openjdk-devel'

# Create a 'tomcat' group
#  $ sudo groupadd tomcat
group 'tomcat'

# Add 'tomcat' as a user agent to group 'tomcat' group
#  $ sudo useradd -M -s /bin/nologin -g tomcat -d #{tomcat_path} tomcat
user 'tomcat' do
    manage_home false
    shell '/bin/nologin'
    group 'tomcat'
    home "#{tomcat_path}"
end

# Download the Apache Tomcat tarball
remote_file "/tmp/apache-tomcat-#{tomcat_ver}.tar.gz" do
    source "https://archive.apache.org/dist/tomcat/tomcat-8/v#{tomcat_ver}/bin/apache-tomcat-#{tomcat_ver}.tar.gz"
end

# Create directory
directory "#{tomcat_path}" do
    group 'tomcat'
end

# Extract our Tomcat binary
#  $ sudo tar xvf apache-tocat-8*tar.gz -C /opt/tomcat --strip-components=1
execute "tar xvf /tmp/apache-tomcat-#{tomcat_ver}*tar.gz -C #{tomcat_path} --strip-components=1"

# Update permissions for folders
execute "chgrp -R tomcat #{tomcat_path}"

directory '/opt/tomcat/conf' do
    mode '0070'
end

# Update the permissions
execute "chmod -R g+r #{tomcat_path}/conf/*"
execute "chmod g+x #{tomcat_path}"
execute "cd #{tomcat_path} && chown -R tomcat webapps/ work/ temp/ logs/"

# Install the Tomcat service
template '/etc/systemd/system/tomcat.service' do
    source 'tomcat.service.erb'
end

# Reload systemd to load the tomcat unit File
# $ sudo systmclt daemon-reload
execute 'systemctl daemon-reload'

# Make tomcat is started now, and enable to start up at reboot time
# $ sudo systemctl start tomcat
# $ sudo systemctl enable tomcat
service 'tomcat' do
    action [:start, :enable]
end
