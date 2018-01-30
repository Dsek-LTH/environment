name "development"
description "Development VM role"

default_attributes "environment" => {
	"frontend_path" => "/vagrant/projects/frontend/static/",
	"gateway_path" => "/vagrant/projects/gateway/",
	"gateway_url" => "http://localhost:8080/",
}

run_list(
	"recipe[dsek-website::development]",
	"recipe[dsek-website::nginx]",
	"recipe[dsek-website::gateway]",
)

