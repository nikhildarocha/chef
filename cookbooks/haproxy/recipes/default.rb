#
# Cookbook Name:: haproxy
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "haproxy" do
	action :install
end
package 'socat'

service "haproxy" do
	action [:enable, :start]
end
#hosts = search(:node, "run_list:*role\\[webserver\\]*")
h = {
	'webserverOne' => "192.168.50.7",
	'webserverTwo' => "192.168.50.8"
}
p = {
	'scaler' => "192.168.50.10"
}


template "/etc/haproxy/haproxy.cfg" do
	source "haproxy.cfg.erb"
	mode "0644"
	variables({
		:h => h
	})
 
	notifies :reload, 'service[haproxy]'
end


cookbook_file "/etc/default/haproxy" do
	source "haproxy"
	mode "0644"
end
service "haproxy" do
	supports status: true, restart: true, reload: true
	action [:enable, :start]
end


 bash "get statistics" do
	cwd '/vagrant'
	code <<-EOH
	  ./getStats.sh
	EOH
end

