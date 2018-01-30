#
# Cookbook:: dsek-website
# Recipe:: nginx
#

include_recipe "dsek-website::base"

package "nginx"

template '/etc/nginx/sites-available/default' do
	source 'nginx-site.erb'
end

service "nginx" do
	action [:enable, :start, :reload]
end

