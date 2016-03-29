# For fail2ban to work properly, we should not filter repeated messages from log files.

bash 'configure sshd' do 
  code <<-EOH
  sed -i 's/$RepeatedMsgReduction on/$RepeatedMsgReduction off/g' /etc/rsyslog.conf
  service rsyslog restart
  EOH
end
  
