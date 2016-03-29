#
# basic server setup.
#

package "build-essential"
package "curl"
package "wget"
package "git"
package "htop" 
package "iotop" 
package "byobu"
package "joe" 
package "vim"
package "mc"
package "python-pip"

bash "install aws-cli" do
  code "pip install awscli"
end

include_recipe 'common-base::ssh'
include_recipe 'common-base::fail2ban'
include_recipe 'common-base::logrotate'
include_recipe 'common-base::rsyslog_fail2ban'

