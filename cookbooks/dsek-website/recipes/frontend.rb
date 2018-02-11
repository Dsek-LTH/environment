#
# Cookbook:: dsek-website
# Recipe:: gateway
#

node_service "frontend" do
	path node["environment"]["frontend_path"]
end

