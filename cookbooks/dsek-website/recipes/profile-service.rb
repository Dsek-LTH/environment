#
# Cookbook:: dsek-website
# Recipe:: profile-service
#

node_service "dsek-profile-service" do
	path node["environment"]["profile_service_path"]
end

