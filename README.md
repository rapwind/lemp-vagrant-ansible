# LEMP development box with Vagrant and Ansible

## Requirement
- ruby
- gem
- brew
- vagrant
- serverspec

### Install
```
$ vagrant box add centos-7.0 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
$ vagrant plugin install vagrant-vbguest
$ brew install ansible
$ bundle install --path vendor/bundle
```

## Usage
```
$ vagrant up
```

## Test
```
$ bundle exec rake spec
```
