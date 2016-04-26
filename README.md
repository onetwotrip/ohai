# ohai Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/ohai.svg?branch=master)](https://travis-ci.org/chef-cookbooks/ohai) [![Cookbook Version](https://img.shields.io/cookbook/v/ohai.svg)](https://supermarket.chef.io/cookbooks/ohai)

Contains custom resources for adding Ohai hints and installing custom Ohai plugins. Handles path creation as well as the reloading of Ohai so that new data will be available during the same run.

## Requirements

### Platforms

- Debian/Ubuntu
- RHEL/CentOS/Scientific/Amazon/Oracle
- FreeBSD
- Windows

### Chef

- Chef 12+

### Cookbooks

- compat_resource

## Custom Resources (Providers)

### `ohai_hint`

Creates Ohai hint files, which are consumed by Ohai plugins in order to determine if they should run or not.

#### Resource Attributes

- `hint_name` - The name of hints file and key. Should be string, default is name of resource.
- `content` - Values of hints. It will be used as automatic attributes. Should be Hash, default is empty Hash
- `hint path` - The path to your hints file, default is first directory defined in `Ohai::Config[:hints_path]`

#### Examples

Hint file installed to the default directory:

```ruby
ohai_hint 'ec2'
```

Hint file installed at compile time:

```ruby
ohai_hint 'ec2' do
  action :nothing
end.run_action(:create)
```

Hint file installed with content:

```ruby
ohai_hint 'raid_present' do
  content Hash[:a, 'test_content']
end
```

#### ChefSpec Matchers

You can check for the creation or deletion of ohai hints with chefspec using these custom matches:

- create_ohai_hint
- delete_ohai_hint

### `ohai_plugin`

Installs custom Ohai plugins.

#### Resource Attributes

- `plugin_name` - The name to give the plugin on the filesystem. Should be string, default is name of resource.
- `plugin path` - The path to your custom plugin directory. Defaults to a directory named 'ohai_plugins' in the Chef config dir

#### examples

Simple Ohai plugin installation:

```ruby
ohai_plugin 'my_custom_plugin'
```

Installation where the resource doesn't match the filename and you install to a custom plugins dir:

```ruby
ohai_plugin 'My Ohai Plugin' do
  name 'my_custom_plugin'
  custom_plugin_dir '/my/custom/path/'
end
```

#### ChefSpec Matchers

You can check for the creation or deletion of ohai plugins with chefspec using these custom matches:

- create_ohai_plugin
- delete_ohai_plugin

## License & Authors

**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2011-2016, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
