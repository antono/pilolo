# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "pilolo"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "freedombox"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.box_url = "https://github.com/downloads/stefancocora/freedombox_dev/freedombox_x64-1.0.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "33.33.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.provision :shell, :inline => <<-SCRIPT
    echo "deb http://ftp.by.debian.org/debian/ wheezy main contrib non-free" > /etc/apt/sources.list
    apt-get update
    apt-get purge --yes ruby1.8
    apt-get install --yes build-essential ruby1.9.1 ruby1.9.1-dev ruby-switch
    ruby-switch --set ruby1.9.1 
    gem install chef --no-ri --no-rdoc --verbose
  SCRIPT

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :user => {
        :name => 'antono',
        :public_key  => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6uLqzTx+e6hAGY2dQ0KQsmsRZhxZY5yZUW8EeJh+ziDraAJtFvrFQyJS62X2jGBqSLjbNrOHdG1PTJKvi+BsDGrjSDimYvIAO9YdBiVpBfObWsY0Eiv+2mhneW+8uNShj8MIEkl2/bZmt41TU7j0+YmtFlufq8be3WN/CG3FV+36z5FTQqtVLPrnHWNwGLbNqXQVdwhOAjV2siWSBB+OV74j/KHhbMDw0vUG/wRvfGP1ivIPCzBBxx8gviP7hPPd05LPPXVyn2wVxcMAuAOPNzXyieTl72se7yIZejqqoKibvsEZW+90CfRPSsxjCtPz8fiN/SuoGlirQ6Gq7DQZcQ== antono@libero'
      }
    }

    chef.add_recipe 'pilolo::default' # base setup
    chef.add_recipe 'pilolo::debug'   # debugging tools
    chef.add_recipe 'pilolo::mail'    # email system smtp + imap
    chef.add_recipe 'pilolo::chat'    # jabber
  end
end
