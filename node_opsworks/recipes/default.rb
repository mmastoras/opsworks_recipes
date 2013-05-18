#
# Cookbook Name:: node
# Recipe:: default
#

cookbook_file "/tmp/install_node.sh" do
  source "install_node.sh"
  mode 0755
end

execute "install-node" do 
  command "/tmp/install_node.sh"
end