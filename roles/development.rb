name "development"
description "Development VM role"

default_attributes "environment" => {
	"frontend_path" => "/vagrant/projects/frontend/static/",
	"gateway_path" => "/vagrant/projects/gateway/",
	"gateway_url" => "http://localhost:8080/",
	"login_service_path" => "/vagrant/projects/login-service/",
}

run_list(
	"recipe[dsek-website::development]",
	"recipe[dsek-website::nginx]",
	"recipe[dsek-website::gateway]",
	"recipe[dsek-website::login-service]",
)

