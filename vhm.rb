class Vhm < Formula
  desc "A very simple VirtualHost Manager Script for Apache"
  homepage "http://github.com/alxndrhi/vhm"
  head "https://github.com/alxndrhi/vhm.git"
  url "https://github.com/alxndrhi/vhm/archive/v0.3.0.tar.gz"
  sha256 "0c67cbf246cf413efb5d35ad7368db6496ba968aa4e7da3c5834501070c794ca"
  version "0.3.0"

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
    EOS
  end
end
