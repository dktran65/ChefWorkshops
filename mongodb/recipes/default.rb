#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
##

# Use the correct mongodb source based on the current system build
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

service "mongod" do
    action [:start, :enable]
end

