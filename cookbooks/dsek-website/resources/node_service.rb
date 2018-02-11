resource_name :node_service

property :name, String, name_property: true
property :path, String
property :user, String, default: "vagrant"
property :description, String, default: "dsek website service"



action :create do
	include_recipe "dsek-website::base"
	include_recipe "nodejs"

	#npm_package new_resource.name do
	#	path new_resource.path
	#	json true
	#	user new_resource.user
	#end

	execute ('install-' + new_resource.name) do
		command 'npm install'
		cwd new_resource.path
		user new_resource.user
		environment "HOME" => ("/home/" + new_resource.user)
	end

	systemd_unit (new_resource.name + '.service') do
	  content <<-EOU.gsub(/^\s+/, '')
	  [Unit]
	  Description=#{new_resource.description}

	  [Install]
	  WantedBy=multi-user.target

	  [Service]
	  WorkingDirectory=#{new_resource.path}
	  ExecStart=/usr/bin/env npm start
	  User=#{new_resource.user}
	  EOU

	  action [:create, :enable, :start]
	end
end

