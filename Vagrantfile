VAGRANTFILE_API_VERSION = "2"
PROVISIONER = <<-EOS
echo "Preparing box for development:"
echo "* Installing system packages"
{
  apt-get update
  apt-get -qq install git
  apt-get -qq install build-essential
} >/dev/null

echo "* Installing rbenv"
{
  rm -rf /opt/rbenv && git clone https://github.com/sstephenson/rbenv.git /opt/rbenv

  echo 'export PATH=/opt/rbenv/bin:$PATH' > /etc/profile.d/rbenv.sh
  echo 'source /opt/rbenv/completions/rbenv.bash' >> /etc/profile.d/rbenv.sh
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
  source /etc/profile.d/rbenv.sh
} >/dev/null

echo "* Installing ruby-build"
{
  git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby_build
  echo 'export PATH=/opt/rbenv/plugins/ruby_build/bin:$PATH' > /etc/profile.d/ruby_build.sh
  source /etc/profile.d/ruby_build.sh
} >/dev/null

echo "* Installing Ruby 2.1.3"
{
  sudo -u vagrant -i rbenv install 2.1.3
  sudo -u vagrant -i rbenv global 2.1.3
}

echo "Finished! Your VM is ready for you now."
EOS

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision 'shell', inline: PROVISIONER
end
