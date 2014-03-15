#
# Cookbook Name:: collada-dom
# Recipe:: default
#
# Copyright 2014, Yosuke Matsusaka
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"
include_recipe "cmake"
include_recipe "xml::default"

install_path = "/usr/local/include/collada-dom2.4/dom.h"

remote_file "#{Chef::Config[:file_cache_path]}/collada-dom-#{node["collada-dom"]["version"]}.tgz" do
  source "http://downloads.sourceforge.net/project/collada-dom/Collada%20DOM/Collada%20DOM%202.4/collada-dom-#{node["collada-dom"]["version"]}.tgz"
  not_if { ::File.exists?(install_path) }
end

bash "compile_collada-dom" do
  cwd "#{Chef::Config['file_cache_path']}"
  code <<-EOH
      tar xvfz collada-dom-#{node["collada-dom"]["version"]}.tgz
      cd collada-dom-#{node["collada-dom"]["version"]}
      cmake .
      make clean && make && make install
      ldconfig
  EOH
  not_if { ::File.exists?(install_path) }
end
