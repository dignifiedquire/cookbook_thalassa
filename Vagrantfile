Vagrant.configure("2") do |config|
  config.vm.hostname = "thalassa"
  config.vm.box = "chefprecise64"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
  end


  config.vm.network :forwarded_port, :guest => 80, :host => 8888
  config.vm.network :forwarded_port, :guest => 8080, :host => 8080
  config.vm.network :forwarded_port, :guest => 10000, :host => 10001

  config.chef_zero.chef_repo_path = 'test/fixtures/'

  config.vm.provision :chef_client do |chef|
    chef.json = {
      vagrant: true, # required in order to detect vagrant usage in recipes.
    }
    chef.add_recipe 'thalassa::default'
  end
end
