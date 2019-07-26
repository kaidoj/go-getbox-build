# PBX Getbox renders download app

App checks and downloads render files from printbox server to local server and unpacks.
App is using CPU cores so the fetchers run concurrently. So downloading and unpacking render files is alot faster.

## Usage

Setup config first! Copy ```config.example.yml``` and rename to ```config.yml```

Install [Docker](https://docs.docker.com/install/)  
Install [Docker Compose](https://docs.docker.com/compose/install/)  

If you have docker and docker-compose installed in server then use ```docker-compose up -d```
This runs app forever and checking. App is doing interval checks after time set in config.

Install [Go](https://golang.org/doc/install)  

If no docker installed use ```./go-getbox```
Running only once use ```./go-getbox run_once```

## Config setup

```yml
host: examplehost
schema: https
api_url: api/getbox
api_version: v2
auth_access_key: access_key_here
auth_secret_key: secret_key_here
getbox_id: getbox id here #ask printbox
nr_of_cores: 8 #number of cores/fetchers you would like to use
getbox_path: /var/www/getbox/ #location of getbox files root
temp_path: tmp/ #temporary files dir. Unzipped versions of renders will be downloaded here
finished_path: finished/ #unzipped versions of files will be placed here
fetchers_interval: 10 #seconds interval you would like getbox app run fetchers
log_to_file: true
log_file: /var/log/getbox/
```