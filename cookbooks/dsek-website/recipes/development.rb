include_recipe "dsek-website::base"

package "build-essential"

apt_repository "zeromq" do
	uri "http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/"
	key "https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key"
	distribution "/"
end

package "libzmq3-dev"

