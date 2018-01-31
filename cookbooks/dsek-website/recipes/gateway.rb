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

systemd_unit 'gateway.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=dsek gateway

  [Install]
  WantedBy=multi-user.target

  [Service]
  WorkingDirectory=/vagrant/projects/gateway
  ExecStart=/usr/bin/env npm start
  User=vagrant
  EOU

  action [:create, :enable, :start]
end

