#
# Cookbook:: dsek-website
# Recipe:: gateway
#

node_service "dsek-gateway" do
	path node["environment"]["gateway_path"]
end

