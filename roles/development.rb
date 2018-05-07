name "development"
description "Development VM role"

default_attributes "environment" => {
	"gateway_path" => "/vagrant/projects/gateway/",
	"gateway_url" => "http://localhost:8080/",
	"frontend_path" => "/vagrant/projects/frontend/",
	"frontend_url" => "http://localhost:8081/",
	"login_service_path" => "/vagrant/projects/login-service/",
	"profile_service_path" => "/vagrant/projects/profile-service/",
	"message_service_path" => "/vagrant/projects/message-service/",
}

run_list(
	"recipe[dsek-website::development]",
	"recipe[dsek-website::nginx]",
	"recipe[dsek-website::frontend]",
	"recipe[dsek-website::login-service]",
	"recipe[dsek-website::profile-service]",
	"recipe[dsek-website::message-service]",
	"recipe[dsek-website::gateway]",
)

