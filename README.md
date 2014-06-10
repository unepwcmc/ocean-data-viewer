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
$ sudo apt-get update
$ sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison postgresql postgresql-server-dev-all
```

You will need to configure the postgresql. Change the `postgres` user password:

```
$ sudo -u postgres psql template1
```

Run SQL code to change the password:

```sql
ALTER USER postgres with encrypted password 'postgres';
```

After configuring the password, edit the file `/etc/postgresql/9.1/main/pg_hba.conf` to use MD5 authentication with the postgres user:

```
local   all         postgres                          md5
```

Finnally, restart postgresql:

```
sudo /etc/init.d/postgresql restart
```

Configure machine environment, add those lines to `/etc/environment`

```
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
```

## Setup the app environment

Donwload rvm:

```
$ curl -sSL https://get.rvm.io | bash -s stable
$ source /etc/profile.d/rvm.sh
```

Install ruby version:

```
$ rvm install ruby-1.8.7-head
```

Create the app gemset:

```
$ rvm ruby-1.8.7-head do rvm gemset create marine_portal
```

Then you will have to install all the gems manually:

```
$ gem install rake
$ gem install -v=2.3.18 rails
$ gem install rdoc
$ gem install activerecord-postgresql-adapter
$ gem install aws-s3
$ gem install RedCloth
$ gem install backup -v=3.0.27
```

After that, you can run the rake task to create the database:

```
$ rake db:setup
```

## Run the app

To run the app, run it on port 80 and then in your host machine you can see the app at 8080.

```
$ ./script/server -p 80
```
