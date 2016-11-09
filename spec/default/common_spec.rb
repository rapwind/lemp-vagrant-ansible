require 'spec_helper'

describe group('vagrant') do
  it { should exist }
end

describe user('vagrant') do
  it { should belong_to_group 'vagrant' }
end

describe port(80) do
  it { should be_listening }
end

describe service('firewalld') do
  it { should be_enabled }
  it { should be_running }
end

html_dir = "/var/www/html"
describe file("#{html_dir}") do
  it { should be_directory }
  it { should be_owned_by('vagrant') }
  it { should be_grouped_into('vagrant') }
  it { should be_mode '755' }
end

describe command('curl http://127.0.0.1/ -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200|403|404$/ }
end
