#
# Cookbook Name:: macroni
# Recipe:: default
#

# remove opsworks install nodejs and npm
package "nodejs" do
  action :remove
end

package "npm" do
  action :remove
end

# install preferred version of node
include_recipe "node_opsworks"

package "npm" do
  action :install
end

template "/etc/init/macroni.conf" do
  owner 'root'
  group 'root'
  mode 0755
  source "macroni.upstart.erb"
  backup false
  action :create
  variables({
    :node_binary => "/srv/www/#{node[:app_name]}/current/node_modules/coffee-script/bin/coffee",
    :node_script => "/srv/www/#{node[:app_name]}/current/app.coffee",
    :port => "8080",
    :airbrake_api_key => 
        case node[:env] 
          when 'staging', 'alpha', 'beta'
            "13e184730acd1f9cd7b6a40f0b3ce7d9"
          when 'production'
            'be64f4b45c546320b6a0d7c5108a3556'
          else
            ''
          end
  })
end

template "/etc/monit/conf.d/node.macroni.monitrc" do
  owner 'root'
  group 'root'
  mode 0600
  if node[:env] == 'production'
    source "node.macroni.monitrc.erb"
  else
    source "node.macroni.staging.monitrc.erb"
  end
  backup false
  action :create
end

execute "relod monit" do
  command "sudo monit reload"
end
