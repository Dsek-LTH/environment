resource_name :node_service

property :name, String, name_property: true
property :path, String
property :user, String, default: "vagrant"
property :description, String, default: "dsek website service"



action :create do
	include_recipe "dsek-website::base"
	include_recipe "nodejs"

	# We need to rename this so that we can use it in the npm_package
	service_path = path

	npm_package name do
		path service_path
		json true
		user user
	end

	systemd_unit (name + '.service') do
	  content <<-EOU.gsub(/^\s+/, '')
	  [Unit]
	  Description=#{description}

	  [Install]
	  WantedBy=multi-user.target

	  [Service]
	  WorkingDirectory=#{path}
	  ExecStart=/usr/bin/env npm start
	  User=#{user}
	  EOU

	  action [:create, :enable, :start]
	end
end

