resource_name :node_service

property :name, String, name_property: true
property :path, String
property :user, String, default: "vagrant"
property :description, String, default: "dsek website service"



action :create do
	include_recipe "dsek-website::base"
	include_recipe "nodejs"

	# We need to rename these so that we can use them in the npm_package
	service_path = path
	service_user = user

	npm_package name do
		path service_path
		json true
		user service_user
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

