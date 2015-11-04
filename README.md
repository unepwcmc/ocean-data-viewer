Ocean Data Viewer
======

[![Code Climate](https://codeclimate.com/github/unepwcmc/marine-portal/badges/gpa.svg)](https://codeclimate.com/github/unepwcmc/marine-portal)
[![Test Coverage](https://codeclimate.com/github/unepwcmc/marine-portal/badges/coverage.svg)](https://codeclimate.com/github/unepwcmc/marine-portal/coverage)
[![Dependency Status](https://gemnasium.com/unepwcmc/marine-portal.svg)](https://gemnasium.com/unepwcmc/marine-portal)

# Installation

Ocean Data Viewer is a pretty standard Rails application, backed by a Postgres database. To install Ocean Data Viewer, proceed with the usual commands:
```
$ git clone https://github.com/unepwcmc/ocean-data-viewer.git ocean-data-viewer
$ cd ocean-data-viewer
$ bundle install
$ bundle exec rake db:setup
```

## dotenv

Ocean Data Viewer uses the `dotenv` gem to manage environment variables. Before starting the server, create a copy of the file `.env.example` (removing the `.example` bit) and edit the needed variables. After this final step, `bundle exec rails server` should work like a charm.
