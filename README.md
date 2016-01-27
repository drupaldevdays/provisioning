Drupal Dev Days 2016 Provisioning
=================================

This repository is based on [phansible](http://phansible.com/) and [geerlingguy's drupal-vm](https://github.com/geerlingguy/drupal-vm) and contains the ansible configuration to setup the virtual machine to use for developing on the Drupal Dev Days 2016's website and provision the development, staging and production machines.


Requirements
------------

In order to start working you must:

0. Install vagrant. More information on how to do that here: https://www.vagrantup.com/downloads.html

0. Install virtualbox. More information on how to do that here: https://www.virtualbox.org/wiki/Downloads

0. Install ansible. More information on how to do that here: http://docs.ansible.com/ansible/intro_installation.html#installing-the-control-machine


Installation
------------

0. Create a working directory, say ``/path/to/ddd``

0. Clone https://github.com/drupaldevdays/provisioning (or your fork of it) into your working directory(eg: /path/to/ddd)

0. Clone https://github.com/drupaldevdays/website (or your fork of it) into your working directory(eg: /path/to/ddd).

    You should now have the following folder structure:
    ```
    ddd
    ├── provisioning
    └── website
    ```

0. If you are using ubuntu as your host operating system(ie: your physical machine), install NFS by typing:
    ```bash
    sudo apt-get install nfs-common nfs-kernel-server
    ```

0. Add to your host machine's ``/etc/hosts`` the following line
    ```
    192.168.88.88 milan2016.drupaldays.loc
    ```

0. Add the SSH key you have tied to GitHub to the authentication agent
    ```bash
    key_file=~/.ssh/id_rsa

    [[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file
    ```

0. Run ansible-galaxy to install the needed ansible dependencies:
    ```bash
    ansible-galaxy install -r ansible/requirements.yml --force --ignore-errors
    ```

    Remember that depending on your system you might need to run the command using sudo.

    Please note that this command tends to fail some downloads every now and then.
    Should that happen you might need to repeat such command again or manually install the dependencies that failed to download or install.

0. Start Vagrant:
    ```bash
    vagrant up --provider=virtualbox
    ```

    You can also specify other providers such as `vmware` or `parallels` in case you have them installed.

0. From now on you should be able to visit http://milan2016.drupaldays.loc/ in your browser

0. Should authentication failures happen while the virtual machine is booting, try to start it from the UI.
    Once you're in, append your public key to ``/home/vagrant/.ssh/authorized_keys`` and add the following line to your Vagrantfile:
    ```ruby
    config.ssh.private_key_path = '~/.ssh/id_rsa'
    ```


Contributing
------------

The development follows the standard Github's Pull Request flow. More information here: https://help.github.com/articles/using-pull-requests/
