module Vagrant
  module Faster
    class Plugin
      name 'vagrant-faster'
      description 'Make VMs faster by allocating more Memory/CPU based on your machine capacity'

      action_hook 'faster' do |hook|
        require_relative './middleware'
        puts "[vagrant-faster] hook"
        hook.before VagrantPlugins::ProviderVirtualBox::Action::Boot, Vagrant::Faster::Middleware
      end
    end
  end
end
