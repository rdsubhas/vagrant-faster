module Vagrant
  module Faster
    class Plugin < Vagrant.plugin('2')
      name 'vagrant-faster'
      description 'Make VMs faster by allocating more Memory/CPU based on your machine capacity'

      action_hook 'faster', :machine_action_up do |hook|
        require_relative './action'
        hook.before VagrantPlugins::ProviderVirtualBox::Action::Customize, Vagrant::Faster::Action
      end
    end
  end
end
