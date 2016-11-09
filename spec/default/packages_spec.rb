describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

%w{php php-cli php-common php-devel php-xml php-json php-mysqlnd php-mbstring php-opcache php-process php-gd php-fpm php-mcrypt}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('php-fpm') do
  it { should be_enabled }
  it { should be_running }
end

describe package('mysql-community-server') do
  it { should be_installed }
end

describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end
