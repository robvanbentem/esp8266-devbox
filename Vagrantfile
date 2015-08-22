# -*- mode: ruby -*-
# vi: set ft=ruby :

$vendor_id  = '0x0403'
$product_id = '0x6001'

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "install.sh", privileged: false

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = 4
	
    vb.customize ['modifyvm', :id, '--usb', 'on']
    vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'USB_to_TTL', '--vendorid', $vendor_id, '--productid', $product_id]
  end
end
