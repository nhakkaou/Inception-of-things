Vagrant.configure("2") do |config|

  # First Machine
  config.vm.define "nhakkaouS" do |sv|
    sv.vm.box = "hashicorp/bionic64"
    sv.vm.network "public_network", ip: "192.168.42.110"
    sv.vm.hostname = "nhakkaouS"
    sv.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    sv.vm.provision "k3s shell script", type: "shell",privileged: false,
    path: "k3s.sh"
  end
  # Second Machine
  config.vm.define "nhakkaouSW" do |sw|
    sw.vm.box = "hashicorp/bionic64"
    sw.vm.network "public_network", ip: "192.168.42.111"
    sw.vm.hostname = "nhakkaouSW"
    sw.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    sw.vm.provision "k3s shell script", type: "shell", privileged: false,
    path: "k3s.sh"
  end  
end
