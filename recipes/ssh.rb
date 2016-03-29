# Basic SSH hardening

bash 'configure sshd' do
  code <<-EOH
  sed -i 's/^.*PasswordAuthentication .*$/PasswordAuthentication no/g' /etc/ssh/sshd_config
  sed -i 's/^.*PermitRootLogin .*$/PermitRootLogin no/g' /etc/ssh/sshd_config
  sed -i '1i # Modified by common-base::ssh recipe' /etc/ssh/sshd_config
  service ssh restart
  EOH
end
