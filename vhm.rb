class Vhm < Formula
  desc "A very simple VirtualHost Manager Script for Apache"
  homepage "http://github.com/alxndrhi/vhm"
  url "https://github.com/alxndrhi/vhm/archive/v0.1.0.tar.gz"
  sha256 "bfa77d5ad4de266153adbe29a6204667692913b864bddafd0a4dd3a18154480c"
  version "0.1.0"

  def install
    bin.install "vhm" 
    (etc/"vhm").install "vhm.cfg"
    (etc/"vhm").install "httpd-vhosts.conf"
    (etc/"vhm/templates").install "VirtualHost.conf"
    Dir.mkdir("#{etc}/vhm/sites-enabled") unless File.exists?("#{etc}/vhm/sites-enabled")
    Dir.mkdir("#{etc}/vhm/sites-available") unless File.exists?("#{etc}/vhm/sites-available")
  end

  def caveats; <<-EOS.undent

    The next step is to set the correct values in your config file.
    You can find the config files in #{etc}/vhm.

    Apache need to know where your configuration files will be located. To include them add the following Line to your httpd-vhosts.conf:

    Include /usr/local/etc/vhm/httpd-vhosts.conf

    You can find more detailed information on how to setup vhm on http://github.com/alxndrhi/vhm

    If you are migrating from an earlier version please see the nodes on:
    http://github.com/alxndrhi/vhm

    EOS
  end
end