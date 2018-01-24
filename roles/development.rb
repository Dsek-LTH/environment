name "development"
description "Development VM role"

default_attributes "environment" => {
	"frontend_path" => "/vagrant/projects/frontend/static/",
	"gateway_url" => "http://localhost:6000/",
}

run_list(
	"recipe[dsek-website::nginx]",
)

