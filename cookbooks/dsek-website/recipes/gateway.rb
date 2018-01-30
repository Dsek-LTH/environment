#
# Cookbook:: dsek-website
# Recipe:: gateway
#

include_recipe "dsek-website::base"
include_recipe "nodejs"

npm_package "dsek-core" do
	path node["environment"]["gateway_path"]
	json true
	user "vagrant"
end
#execute "install_gateway" do
#	command "npm install"
#	cwd node["environment"]["gateway_path"]
#end

