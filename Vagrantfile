Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |v|
      v.memory = 2048
      v.cpus = 2
    end

    config.vm.define :master do |master|
      # Vagrant va récupérer une machine de base ubuntu 20.04 (focal) depuis cette plateforme https://app.vagrantup.com/boxes/search
      master.vm.box = "ubuntu/bionic64"
      master.vm.hostname = "master"
      master.vm.network :private_network, ip: "192.168.100.50"
      config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
      service ssh restart
      SHELL
      config.vm.provision "shell", privileged: false, path: "set_env.sh"
    end
  end
