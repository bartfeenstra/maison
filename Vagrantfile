Vagrant.require_version ">= 2.1.0"

Vagrant.configure("2") do |config|
  config.env.enable

  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "maison-dev"

  config.vm.network :private_network,
    ip: ENV['MAISON_LOCAL_IP']

  config.vm.synced_folder ".", "/maison",
    id: "default",
    type: "nfs",
    nfs_version: 4,
    nfs_udp: false

  config.vm.provision "shell",
    path: "./vagrant/provision",
    privileged: false

  # Virtual Box-specific configuration.
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.memory = 2048
    vb.cpus = 2

    # Override the base box.
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end
end
