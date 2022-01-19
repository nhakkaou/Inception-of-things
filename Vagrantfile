Vagrant.configure("2") do |config|

  config.vm.define "Server" do |sv|
    sv.vm.box = "hashicorp/bionic64"
    sv.vm.network "public_network", ip: "192.168.42.110"
    sv.vm.hostname = "Server"
    sv.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
  end

  config.vm.define "ServerWorker" do |sw|
    sw.vm.box = "hashicorp/bionic64"
    sw.vm.network "public_network", ip: "192.168.42.111"
    sw.vm.hostname = "ServerWorker"
    sw.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
  end
  
end
