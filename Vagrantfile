# -*- mode: ruby -*-
# vi: set ft=ruby :
#
Vagrant.require_version '>= 1.5.0'
Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  script = %{
    if [ ! -e "go1.2.1.linux-amd64.tar.gz" ]
    then
      echo 'Downloading and unpacking go'
      wget https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz &> /dev/null
      tar -xzf go1.2.1.linux-amd64.tar.gz
    fi

    if [ ! -e "/usr/local/go" ]
    then
      mv go /usr/local
    fi

    echo "PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bashrc
    apt-get -yf install tmux git curl

    export "PATH=$PATH:/usr/local/go/bin"
    cd /vagrant && ./build.sh
  }

  config.vm.provision "shell", inline: script


  # plugin conflict
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
end
