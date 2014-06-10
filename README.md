How to setup using Vagrant
==========================

First download the [Vagrant App](http://www.vagrantup.com/downloads.html) and then the box we gonna use:

```
$ vagrant box add ubuntu-13.04 https://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-i386-vagrant-disk1.box
```

Then go to the project directory and run:

```
$ vagrant up
```

Wait it to get up the image, then login via ssh in the machine.

```
$ vagrant ssh
```

## Setup the machine

First you need to download the postgresql database.

```
$ sudo apt-get install postgresql
```

## Setup the app environment

Donwload rvm:

```
curl -sSL https://get.rvm.io | bash -s stable
```

Install ruby version:

```
$ rvm install ruby-1.8.7-head
```

Create the app gemset:

```
$ rvm ruby-1.8.7-head do rvm gemset create marine_portal
```
