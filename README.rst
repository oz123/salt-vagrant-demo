=================
Salt Vagrant Demo
=================

A Salt Demo using Vagrant.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone https://github.com/oz123/salt-vagrant-demo.git
    cd salt-vagrant-demo
    vagrant up


This will download images of Ubuntu and CentOS virtualboxes
and create three virtual machines for you. One will be a Salt Master named
`master` and two will be Salt Minions named `minion` and `minion2`.
The Salt Minions will point to the Salt Master and the Minion's
keys will already be accepted. Because the keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

.. code-block:: bash

    vagrant ssh master
    sudo salt \* test.ping


This was tested on a Gentoo System running with Vagrant 1.7.4, and is expected to work on other system too.
