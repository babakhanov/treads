# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"

  # Configurate the virtual machine to use 2GB of RAM
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
    chef.roles_path     = [[:host, "chef/roles"]]
    chef.data_bags_path = [[:host, "chef/data_bags"]]

    chef.add_role "rails-development"
    chef.json = {
      :postgresql => {
        :password => {
          :postgres => "password"
        },
        :pg_hba => [
          { :type => 'local', :db => 'all', :user => 'all', :addr => nil, :method => 'trust' },
          { :type => 'local', :db => 'all', :user => 'postgres', :addr => nil, :method => 'trust' },
          { :type => 'host', :db => 'all', :user => 'all', :addr => '127.0.0.1/32', :method => 'trust' }
        ]
      },
      "rvm" => {
        "gpg" => {},
        "vagrant" => {
          "system_chef_solo" => "/opt/chef/bin/chef-solo"
        },
        "install_rubies" => true,
        "rubies"  => ["2.2.0", "2.2.2"],
        "default_ruby" => "2.2.2@global",
        "global_gems" => [
            { 'name' => 'bundler' },
            { 'name' => 'rails'}
        ]
      }
    }
  end
end
