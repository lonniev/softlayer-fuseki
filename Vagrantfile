# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  #

  #See http://docs.vagrantup.com/v2/vagrantfile/vagrant_settings.html
  config.vagrant.host = :detect

  config.vm.define "sl-foo" do |cci|
    #See http://docs.vagrantup.com/v2/vagrantfile/index.html
    cci.vm.box                        = "ju2wheels/SL_UBUNTU_LATEST_64_temp"
    cci.vm.hostname                   = "sl-vagrant-cci"
    #cci.vm.boot_timeout               = 300
    #cci.vm.box_check_update           = false
    #cci.vm.box_download_checksum      = nil
    #cci.vm.box_download_checksum_type = nil
    #cci.vm.box_download_client_cert   = nil
    #cci.vm.box_download_insecure      = false
    #cci.vm.box_url                    = "https://vagrantcloud.com/ju2wheels/SL_GENERIC/version/1/provider/softlayer.box"
    #cci.vm.box_version                = ">=0"
    #cci.vm.graceful_halt_timeout      = 300
    #cci.vm.guest                      = :linux
    #cci.vm.usable_port_range          = 2200..2250

    #See http://docs.vagrantup.com/v2/vagrantfile/ssh_settings.html
    cci.ssh.forward_agent             = true
    cci.ssh.forward_x11               = false
    #cci.ssh.guest_port                = 22
    #cci.ssh.host                      = nil #Normally determined by provider
    #cci.ssh.insert_key                = true
    #cci.ssh.password                  = nil
    #cci.ssh.port                      = 22
    #cci.ssh.private_key_path          = [ File.expand_path("~/.ssh/id_rsa") ]
    #cci.ssh.pty                       = false #Warning this setting is not recommended and can break things, recommended to create flex image with sudoers fixed for problematic distros
                                               #See https://github.com/audiolize/vagrant-softlayer/issues/11
    #cci.ssh.shell                     = "bash -l"
    #cci.ssh.username                  = "vagrant"

    #Windows specific config options for vagrant-windows plugin
    #cci.windows.halt_check_interval   = 1 if Vagrant.has_plugin?("vagrant-windows")
    #cci.windows.halt_timeout          = 30 if Vagrant.has_plugin?("vagrant-windows")
    cci.windows.set_work_network      = true if Vagrant.has_plugin?("vagrant-windows")
    #cci.winrm.guest_port              = 5985 if Vagrant.has_plugin?("vagrant-windows")
    #cci.winrm.host                    = "localhost" if Vagrant.has_plugin?("vagrant-windows")
    #cci.winrm.max_tries               = 20 if Vagrant.has_plugin?("vagrant-windows")
    #cci.winrm.password                = "vagrant" if Vagrant.has_plugin?("vagrant-windows")
    #cci.winrm.port                    = 5985 if Vagrant.has_plugin?("vagrant-windows")
    #cci.winrm.timeout                 = 1800 if Vagrant.has_plugin?("vagrant-windows")
    cci.winrm.username                = "vagrant" if Vagrant.has_plugin?("vagrant-windows")

    #See http://docs.vagrantup.com/v2/networking/index.html
    #cci.vm.network :forwarded_port, guest: 22, guest_ip: nil, host:2222, host_ip: nil, protocol: "tcp", auto_correct: true

    #Always put the private network before the public so it matches SoftLayer (when using VirtualBox or other hypervisor), eth0 is private and eth1 public, they are created in order provided
    #cci.vm.network :private_network, type: "dhcp", ip: nil, auto_config: true, virtualbox__intnet: true
    #cci.vm.network :private_network, type: "static", ip: "192.168.10.5", auto_config: true, virtualbox__intnet: "internalnetname"
    #cci.vm.network :public_network, type: "dhcp", ip: nil, auto_config: true, virtualbox__intnet: false, bridge: "wlan0"
    #cci.vm.network :public_network, type: "static", ip: '192.168.1.20', auto_config: true, virtualbox__intnet: false, bridge: "wlan0"

    #See http://docs.vagrantup.com/v2/synced-folders/basic_usage.html
    #Guest must have NFS, if using VirtualBox there must be a private network with static IP present, may require root privs (it will prompt)
    #cci.vm.synced_folder ".", "/vagrant", disabled: false, create: false, group: "root", owner: "root", type: "nfs", nfs_udp: true, nfs_version: 3, mount_options: []
    #cci.vm.synced_folder ".", "/vagrant", disabled: false, create: false, group: "root", owner: "root", type: "rsync", rsync__args: ["--verbose", "--archive", "--delete", "-z"], 
    #                          rsync__auto: true, rsync__exclude: [ ".vagrant", ".git"], mount_options: []
    #cci.vm.synced_folder ".", "/vagrant", disabled: false, create: false, group: "root", owner: "root", type: "smb", smb_host: nil, smb_username: nil, smb_password: nil, mount_options: []

    cci.vm.provider :softlayer do |sl, cci_override|
      #Override the default setting only if using this provider
      cci_override.vm.box       = "ju2wheels/SL_UBUNTU_LATEST_64_temp"
      #cci_override.ssh.username = "root"

      #Note: If you use SL_GENERIC box you must set sl.image_guid or sl.operating_system/sl.dis_capacity, otherwise it is pre-set for you by the box

      sl.api_key                   = ENV["SL_API_KEY"]
      sl.datacenter                = 'dal05'
      #sl.dedicated                 = false
      #sl.disk_capacity             = { 0 => 25 } # { disk_num => capacity_gb }, disk 1 reserved for swap by SoftLayer dont use
      sl.domain                    = ENV["SL_DOMAIN"]
      #sl.endpoint_url              = SoftLayer::API_PUBLIC_ENDPOINT
      #sl.force_private_ip          = false
      sl.hostname                  = cci.vm.hostname
      #sl.hourly_billing            = true
      #sl.image_guid                = "AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE" #Dont use this with sl.operating_system/sl.disk_capacity, they are mutually exclusive
      sl.local_disk                = false
      #sl.manage_dns                = false
      #sl.max_memory                = 1024
      #sl.network_speed             = 10
      #sl.operating_system          = "SL_CENTOS_6_64" #Set in box, here for override or if you used SL_GENERIC, see contrib/vagrant-softlayer-boxes of vagrant-softlayer plugin for box generator
      #sl.post_install              = nil #URL for post install script
      #sl.private_only              = false
      sl.ssh_keys                  = [ "SL-root-pk" ]
      #sl.start_cpus                = 1
      #sl.user_data                 = nil
      sl.username                  = ENV["SL_API_USERNAME"] || ENV['USER'] || ENV['USERNAME']   
      #sl.vlan_private              = nil #Automatically generated, override to vlan number string otherwise, see contrib/vagrant-softlayer-vlans tool for list of acceptable vlan values
      #sl.vlan_public               = nil #Automatically generated, override to vlan number string otherwise

      #Join a load balancer, see https://github.com/audiolize/vagrant-softlayer/wiki/Join-load-balancers for more options
      #sl.join_load_balancer vip: "1.1.1.1", port: 443, method: "Round Robin", type: "TCP" do |service|
        #service.destination_port = 443
        #service.health_check = "Ping"
        #service.weight = 2
      #end
    end if Vagrant.has_plugin?("SoftLayer")

    #cci.vm.provision :file do |fileupload|
    #  fileupload.source      = "/tmp/local_example.txt"
    #  fileupload.destination = "/tmp/uploaded_vm_example.txt"
    #end

    #cci.vm.provision :shell do |shellscript|
      #Use the id to override it somewhere else, and preserve_order ensures it gets executed at the point
      #where it was originally defined instead of where it was overriden.
    #  shellscript.inline = "/bin/echo -n 'hello_world' > /dev/null", id: "helloworld", preserve_order: true
    #end
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision "chef_solo" do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { mysql_password: "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end