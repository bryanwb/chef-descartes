name             "descartes"
maintainer       "Bryan W. Berry"
maintainer_email "bryan.berry@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures descartes"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ centos redhat debian ubuntu }.each do |os|
  supports os
end

