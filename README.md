Ocean Data Viewer
======

[![Code Climate](https://codeclimate.com/github/unepwcmc/marine-portal/badges/gpa.svg)](https://codeclimate.com/github/unepwcmc/marine-portal)
[![Test Coverage](https://codeclimate.com/github/unepwcmc/marine-portal/badges/coverage.svg)](https://codeclimate.com/github/unepwcmc/marine-portal/coverage)
[![Test Coverage](https://codeclimate.com/github/unepwcmc/marine-portal/badges/coverage.svg)](https://codeclimate.com/github/unepwcmc/marine-portal/coverage)

**Deploy**

Once changes have been merged into master, merge into Brightbox branch, then deploy from here.


Ruby version: 2.1.1
Rails version: 4.1.1

Setup
-----

Install the dependencies:

```
bundle install
```

Create the `database.yml` file based on the `database.yml.example`

```
cp config/database.yml.example config/database.yml
```

Create the database:

```
rake db:setup
```
