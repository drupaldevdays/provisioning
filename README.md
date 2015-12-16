Drupal Dev Days Provisioning
============================

This repository is based on [phansible](http://phansible.com/) and [geerlingguy's drupal-vm](https://github.com/geerlingguy/drupal-vm) and contains the ansible config to setup the virtual machine to use for developing on the Drupal Dev Days' website and provision the development, staging and production machines.


Requirements
------------

In order to start working, you must:

0. Clone https://github.com/drupaldevdays/provisioning (or your fork of it) into ``provisioning`` folder at your machine.

0. Clone https://github.com/drupaldevdays/website (or your fork of it) into ``website`` folder at your machine.

0. Install ansible. More information here: http://docs.ansible.com/ansible/intro_installation.html#installing-the-control-machine

You should have following folder structure:

```
ddd
├── provisioning
└── website
```


Installation
------------

0. If you are using ubuntu as your host guest(ie: your physical machine), install NFS by typing:
    ```bash
    sudo apt-get install nfs-common nfs-kernel-server
    ```

0. Add to your host machine ``/etc/hosts`` following line
    ```
    192.168.88.88 milan2016.drupaldays.loc
    ```

0. Add your SSH key which is tied to GitHub account to host ssh-agent
    ```bash
    key_file=~/.ssh/id_rsa

    [[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file
    ```

0. Before starting vagrant run:
    ```bash
    ansible-galaxy install -r ansible/requirements.yml --force --ignore-errors
    ```

    Remember that depending on your system you might need to run the command using sudo.

    Please note that this command tends to fail some downloads every now and then so you might need to repeat it or manually install some failed dependencies.

0. Start Vagrant :
    ```bash
    vagrant up --provider=virtualbox
    ```

    You can also specify other providers in case you have them, such as `vmware` or `parallels`.

0. From now you should be able to open http://milan2016.drupaldays.loc/ in your browser

0. In case of Authentication failures while vbox booting, try to start the vbox
    from the UI, append your public key to ``/home/vagrant/.ssh/authorized_keys`` and
    add the following line to your Vagrantfile:
    ```config.ssh.private_key_path = '~/.ssh/id_rsa'```


Contributing
------------

Development will follow the standard Github's Pull Request flow. More information here: https://help.github.com/articles/using-pull-requests/
