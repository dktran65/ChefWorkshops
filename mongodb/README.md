# mongodb

## Commands used to generate baseline files and folders
- $> chef generate cookbook cookbooks/mongodb
- $> chef generate recipe cookbooks/mongodb  default
- $> chef generate template cookbooks/mongodb  mongodb.repo.erb
#
# Then makes edits to the files:
For the recipes/default.rb

    * Add four steps
            - If Logic to determine host cpu type
                    - So we make sure we get the correct mongo source to download
            - Use Template for statistically defined configuration
            - Create and bind to the .repo file for the MongoDB repository config info
            - Use variables feature to pass along base_url value to erb file

    * Install the MongoDB packages and associated tools
    * Lastly,  make sure the daemon process for the MongoDB system start it now and enable at the reboot time.

For the templates/mongodb.repo.erb

    * Evaluate the baseurl Ruby code and not print the result inside the erb file
    * If set to 1, verify the authenticity of the packages by checking the GPG signatures. You might need to set gpgcheck to 0 if a package is unsigned
