# Cookbook Name:: rsyslog
# Provider:: conf

action :create do
  template "/etc/rsyslog.d/#{new_resource.name}.conf" do
    mode 0664
    owner node['rsyslog']['user']
    group node['rsyslog']['group']
    source new_resource.source
    cookbook new_resource.cookbook
    variables new_resource.variables
    notifies :restart, "service[#{node['rsyslog']['service_name']}]"
  end
end
