bash "mount ephemeral store /mnt" do
  user "root"
  code <<-EOH
  mkfs.ext4 /dev/xvdb

  # put it into fstab to preserve reboots
  echo "/dev/xvdb /mnt auto noatime 0 0" | sudo tee -a /etc/fstab
  
  mount /mnt
  mkdir -p -m 1777 /mnt/tmp
  EOH
end
