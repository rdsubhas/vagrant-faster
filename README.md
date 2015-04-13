# Vagrant::Faster

[![Gem Version](https://badge.fury.io/rb/vagrant-faster.svg)](http://badge.fury.io/rb/vagrant-faster)
[![Build Status](https://travis-ci.org/rdsubhas/vagrant-faster.svg?branch=master)](https://travis-ci.org/rdsubhas/vagrant-faster)

Tired of Vagrant VMs running slow? This plugin automatically allocates more Memory/CPU based on your machine's capacity.

To install:

    vagrant plugin install vagrant-faster

And that's it. All VMs started from now will be made faster.

## How much does it allocate?

* 1/4th of memory, if you have more than 2GB RAM
* 1/2 of the available CPU cores, if you have more than 1 CPU.
* For machines with less than 2GB RAM or single-CPU, it will simply leave the machine defaults as it is

**NOTE**: These were rudimentary values I picked based on usage. Please feel free to suggest better.

## Known Issues

* Presently supports only VirtualBox
* No option to disable this for specific VMs for now.

Please open an issue if you feel any of this are nagging you.

**Contributions Welcome**
