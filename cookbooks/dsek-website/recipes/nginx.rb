#
# Cookbook:: dsek-website
# Recipe:: nginx
#

# Keep apt cache updated
apt_update "Update APT cache daily" do
	frequency 86_400
	action :periodic
end

package "nginx"

template '/etc/nginx/sites-available/default' do
	source 'nginx-site.erb'
end

service "nginx" do
	action [:enable, :start, :reload]
end

