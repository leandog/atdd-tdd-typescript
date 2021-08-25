# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.network "forwarded_port", guest: 3000, host: 3001

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get upgrade

    # Add virtualbox utilities
    sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

    # Add `vagrant` to Administrator
    sudo usermod -a -G sudo vagrant

    # Install Ruby
    sudo apt install -y ruby-full

    # Install RVM
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt-get -y install rvm
    sudo usermod -a -G rvm vagrant
    echo "source /etc/profile.d/rvm.sh" >> ~/.bashrc

    # Install Google Chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb

    # Install chomedriver
    wget https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_linux64.zip
    unzip chromedriver_linux64.zip
    chmod +x chromedriver
    sudo mv -f chromedriver /usr/local/share/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

    # Setup Rails App
    source /etc/profile.d/rvm.sh
    rvm install "ruby-2.3.8"

    cd /vagrant
    gem install bundler
    bundle install

    rails db:migrate
    rails db:seed

    rails server -b 0.0.0.0 -p 3000 -d
  SHELL
end
