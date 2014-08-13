module Vagrant
  module Faster
    class Middleware
      def initialize(app, env)
        @app = app
        @env = env
      end

      def call(env)
        @env = env
        vm   = env[:vm] || env[:machine]

        cpus, mem = optimal_settings
        if cpus > 0 && mem > 0
          puts "[vagrant-faster] Setting CPUs: #{cpus} and Memory: #{mem}"
          vm.cpus = cpus
          vm.memory = memory
        else
          puts "[vagrant-faster] was unable to detect optimal settings for your machine"
        end
      end

      def optimal_settings
        host = RbConfig::CONFIG['host_os']

        cpus = -1
        mem = -1

        begin
          if host =~ /darwin/
            cpus = `sysctl -n hw.ncpu`.to_i
            mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024
          elsif host =~ /linux/
            cpus = `nproc`.to_i
            mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024
          end

          # Give VM 1/4 system memory & access to half of cpu cores on the host
          cpus = cpus / 2 if cpus > 1
          mem  = mem / 4  if mem > 2048
        rescue; end

        cpus, mem
      end
    end
  end
end
