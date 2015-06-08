class Vhm < Formula
  desc "A very simple VirtualHost Manager Script for Apache"
  homepage "http://github.com/alxndrhi/vhm"
  head "https://github.com/alxndrhi/vhm.git"
  url "https://github.com/alxndrhi/vhm/archive/v0.1.2.tar.gz"
  sha256 "29eaeaaae6e3f511139b9f475c3e42b9aeac6a632aec34ea87cf92b3e4607c0e"
  version "0.1.2"

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
