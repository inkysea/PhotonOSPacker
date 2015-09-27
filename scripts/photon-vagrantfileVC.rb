ENV['VAGRANT_DEFAULT_PROVIDER'] = 'vcenter'

Vagrant.require_version '>= 1.6.2'

Vagrant.configure('2') do |config|
  # We don't have NFS working inside Photon.
  config.nfs.functional = false


    config.vm.provider :vcenter do |vcenter|
      vcenter.hostname = 'vcenter6.inkysea.com'
      vcenter.username = 'administrator@vsphere.local'
      vcenter.password = 'VMware1!'
      vcenter.folder_name = 'myFolderName'
      vcenter.datacenter_name = 'inkyseaDC'
      vcenter.computer_name = '10.25.27.12'
      vcenter.datastore_name = 'SSD-12'
      vcenter.network_name = 'VM Network'
      vcenter.linked_clones = true
    end

    config.vm.network  :public_network,
                          ip: 10.25.27.202
                          netmask: '255.255.0.0',
                          gateway: '10.25.27.1',
                          dns_server_list: ['10.25.27.1'],
                          dns_suffix_list: ['inkysea.com.com']


    config.vm.provider :vcenter do |override|
      # Override number of cpu and memory based on what's in the nodes array
      override.num_cpu = 2
      override.memory = 4096
      # Use paravirtualized virtual hardware on VMW hypervisors
      v.vmx['ethernet0.virtualDev'] = 'vmxnet3'
      v.vmx['scsi0.virtualDev'] = 'pvscsi'
    end
  end
end
