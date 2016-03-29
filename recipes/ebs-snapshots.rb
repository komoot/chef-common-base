# Configures automatic snapshots of all EBS volumes with a 7-day retention.
# The instance on which the cronjob is installed needs an instance profile that
# allows it to create snapshots. See https://github.com/komoot/aws-ec2-ebs-automatic-snapshot-bash
#
# NOTE: does not work with xfs filesystems!

%w[ /opt /opt/ebs-snapshot ].each do |path|
  directory path do
    action  :create
  end
end

git "/opt/ebs-snapshot" do
  repository "git://github.com/komoot/aws-ec2-ebs-automatic-snapshot-bash.git"
  action :sync
  notifies :create, "cron[ebs-snapshot-cronjob]"
end

cron "ebs-snapshot-cronjob" do
  minute '0'
  hour '22'
  command <<-EOH
  /opt/ebs-snapshot/ebs-snapshot.sh > /var/log/ebs-snapshot.out 2>&1
  EOH
  action :create
end

file "/opt/ebs-snapshot/ebs-snapshot.sh" do
  owner 'root'
  group 'root'
  mode '0755'
  action :touch
end

