
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "shell", path: 'provision.sh'
  config.vm.synced_folder 'phoenix_blog/', '/home/vagrant/phoenix_blog'
end