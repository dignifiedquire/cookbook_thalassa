Vagrant.configure("2") do |config|
  config.vm.hostname = "thalassa"
  config.vm.box = "chefprecise64"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.chef_zero.chef_repo_path = 'test/fixtures/'

  config.vm.provision :chef_client do |chef|
    chef.json = {
      vagrant: true, # required in order to detect vagrant usage in recipes.
      monitor: {
        master_address: 'localhost',
        environment_aware_search: false
      }
    }
    chef.add_recipe 'sharejs::default'
  end
end
