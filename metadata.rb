name 'ohai'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Provides custom resources for installing Ohai hints and plugins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.1.0'

%w(ubuntu debian centos redhat amazon scientific fedora oracle freebsd windows).each do |os|
  supports os
end

depends 'compat_resource'

source_url 'https://github.com/chef-cookbooks/ohai'
issues_url 'https://github.com/chef-cookbooks/ohai/issues'
