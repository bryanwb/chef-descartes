include_recipe "yumrepo::postgresql9"

%w{ postgresql90-server postgresql90-devel postgresql90 postgresql90-libs }.each do |pkg|
   package pkg
end

ruby_block "initialize database" do
  block do
    require 'fileutils'
    FileUtils.rm_rf "/var/lib/pgsql/9.0/data"
    system('/etc/init.d/postgresql-9.0 initdb')
  end
  not_if {::File.exists? "/var/lib/pgsql/9.0/data" }
end


cookbook_file "/var/lib/pgsql/9.0/data/pg_hba.conf" do
  source "pg_hba.conf"
  owner "postgres"
end

ruby_block "start database" do
  block do
    system('/etc/init.d/postgresql-9.0 start')
  end
end

bash "create role" do
  code <<-EOH
  psql -d postgres -c "CREATE ROLE \"#{node['descartes']['user']}\" LOGIN PASSWORD '#{node['descartes']['user']}';"
  EOH
  user "postgres"
  ignore_failure true
end

bash "create database" do
  code <<-EOH
  psql -d postgres -c "CREATE DATABASE \"#{node['descartes']['user']}\" WITH ENCODING='UTF8' OWNER=\"#{node['descartes']['user']}\";"
  EOH
  user "postgres"
  ignore_failure true
end

