#
# Cookbook:: dsek-website
# Recipe:: message-service
#

node_service "dsek-message-service" do
	path node["environment"]["message_service_path"]
end

