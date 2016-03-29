# Note: for stability, should use an AMI with aufs pre-installed. 
# Installing it here would take 6-8 minutes of extra boot time.

# Install docker via the recommended curl way
bash "Install docker" do
  code "curl https://get.docker.com | sh"
  cwd "/root"
  not_if "which docker"
end


