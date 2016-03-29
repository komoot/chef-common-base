include_recipe 'logrotate::default'

# Only fail2ban log rotation, because that is all we install in common-base. 
# Handle app-specific log rotation elsewhere!
logrotate_app "fail2ban" do
  cookbook "logrotate"
  path "/var/log/fail2ban.log"
  frequency "monthly"
  rotate 4
  create "644 root admin"
end
