Vagrant::Config.run do |config|

  config.vm.host_name = "descartes"

  # CentOS 6.3
  config.vm.box = "Berkshelf-CentOS-6.3-i386"
  config.vm.box_url = 'https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-centos-6.3-i386.box'

  config.vm.network :hostonly, "33.33.33.10"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    
    chef.json = {
      "rbenv" => {
        "rubies" => [ "1.9.3-p194" ],
        "gems" => {
          "1.9.3-p194" => [
                           { 'name' => 'bundler' }
                          ]
        }
      }
    }

    chef.run_list = [
                     "recipe[yum::epel]",
                     "recipe[ruby_build]",
                     "recipe[rbenv::system]",
                     "recipe[descartes::rbenv]",
                     "recipe[descartes::postgres]",
                     "recipe[descartes::default]"
    ]
  end

end
