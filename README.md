# D-sek website development environment

This repository is intended as the starting point for development
work on the website. It contains a Vagrantfile for a virtual machine
that gets configured using Chef to run all the components of the website.

All core website services, as well as the front-end,
are included as Git submodules under `projects/`.


## Getting started

**Note: things are very work-in-progress at the moment and the website
might not work out of the box.**

Prerequisites:
* a machine that supports virtualization
* Vagrant and a virtualization provider such as VirtualBox
* Berkshelf (in order to download cookbook dependencies; it would probably
  make sense to vendor these and commit them to the repository in the future)

To get started, clone the repository recursively:

```
$ git clone --recurse-submodules https://github.com/Dsek-LTH/environment
```

Download cookbook dependencies:

```
$ ./vendor-cookbooks.sh
```

And fire up the virtual machine:

```
vagrant up
```

If everything went according to plan, the website should now be accessible
at `http://localhost:8080/`.


## Contributing

Each service currently lives in its own repository. If you are creating
a core service (one that is required for the website's operation), make
a pull request to this service containing:

* a new submodule pointing at the new service in `projects/`
* a Chef recipe for the new service in `cookbooks/dsek-website/recipes/`
* a new runlist entry for the service in `roles/development.rb`

