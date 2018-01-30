#
# Cookbook:: dsek-website
# Recipe:: base
#

# Keep apt cache updated
apt_update "Update APT cache daily" do
	frequency 86_400
	action :periodic
end

