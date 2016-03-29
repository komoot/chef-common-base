include_recipe "fail2ban"

template "/etc/fail2ban/jail.local" do
  source "fail2ban_jail_local.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[fail2ban]"
end

