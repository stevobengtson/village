# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = 'hashicorp/precise64'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000, host_ip: '127.0.0.1'
  config.vm.hostname = 'village.local'
  # config.vm.synced_folder '.', '/vagrant'

  config.vm.provision 'puppet' do |puppet|
     puppet.facter = { 'hostname' => 'village.local' }
     puppet.manifests_path = 'manifests'
     puppet.manifest_file  = 'site.pp'
     puppet.module_path = 'modules'
   end

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1024'
  end
end
