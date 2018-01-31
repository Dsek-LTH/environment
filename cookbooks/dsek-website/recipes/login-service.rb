#
# Cookbook:: dsek-website
# Recipe:: login-service
#

node_service "dsek-login-service" do
	path node["environment"]["login_service_path"]
end

