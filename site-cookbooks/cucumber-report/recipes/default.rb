#
# Cookbook:: cucumber-report
# Recipe:: default.rb
#
# Copyright 2013, Thomas Layh
#
# Version 0.1
#
# Install cucumber-report


include_recipe "apache2"
['rewrite', 'deflate', 'php5', 'headers', 'expires', 'status', 'negotiation', 'setenvif'].each do |mod|
	include_recipe "apache2::mod_#{mod}"
end

include_recipe "php::package"
['apc', 'curl', 'gd', 'mysql', 'sqlite3'].each do |mod|
	include_recipe "php::module_#{mod}"
end
#include_recipe "mysql::server"
#include_recipe "git"
include_recipe "cucumber-report::basic"

# setup host
cookbook_file "/etc/apache2/sites-available/cucumber-report" do
	source "cucumber-report"
	mode 0755
end

# prepare php.ini config
cookbook_file "/etc/php5/conf.d/php_dateTimeZone.ini" do
	source "php_dateTimeZone.ini"
	mode 0655
end
execute "restart apache" do
	command "/etc/init.d/apache2 reload"
end

# enable host and disable default host
apache_site "000-default" do
	enable false
end
apache_site "cucumber-report" do
	enable true
end

# create docroot

directory "/var/www/cucumber-report/" do
  owner "www-data"
  group "vagrant"
  mode 00775
  action :create
end