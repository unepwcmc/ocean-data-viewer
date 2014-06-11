README
======

Ruby version: 2.1.0
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

Create the `.env` file and replace the variables with valid Amazon S3 credentials:

```
cp .env-exampe .env
```

Create the database:

```
rake db:setup
```
