# Installs Ruby and the bundler gem

package "ruby"

bash "gem install bundler" do
  code "gem install bundler"
end
