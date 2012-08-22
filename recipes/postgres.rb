include_recipe "yumrepo::postgresql9"

%w{ postgresql90-server postgresql90-devel postgresql90 postgresql90-libs }.each do |pkg|
   package pkg
end

cookbook_file "/var/lib/pgsql/9.0/data/pg_hba.conf" do
  source "pg_hba.conf"
  owner "postgres"
end

ruby_block "create database" do
  block do
    system('/etc/init.d/postgresql-9.0 initdb')
    system('/etc/init.d/postgresql-9.0 start')
  end
end

bash "create role" do
  code <<-EOH
  psql -d postgres -c "CREATE ROLE \"fedoraAdmin\" LOGIN PASSWORD 'fedoraAdmin';"
  EOH
  user "postgres"
  ignore_failure true
end

bash "create database" do
  code <<-EOH
  psql -d postgres -c "CREATE DATABASE \"fedora\" WITH ENCODING='UTF8' OWNER=\"fedoraAdmin\";"
  EOH
  user "postgres"
  ignore_failure true
end

