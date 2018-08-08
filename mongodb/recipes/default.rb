#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
##

# Determind and use the correct mongodb source based on the current system build
if RbConfig::CONFIG["host_cpu"] == "x86_64"
	base_url = "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"
else
	base_url = "http://downloads-distro.mongodb.org/repo/redhat/os/i686/"
end

# Bind to the .repo config file
template "/etc/yum.repos.d/mongodb.repo" do
	variables(
		:base_url => base_url
	)
end

# Install the package
package "mongodb-org" do
	action :install
end

# Make mongod is started now, and enable to start up at system reboot time
service "mongod" do
    action [:start, :enable]
end
