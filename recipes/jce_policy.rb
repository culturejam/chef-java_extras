#
# Cookbook Name:: java_extras
# Recipe:: jce_policy
#
# Copyright 2013, CultureJam, Inc.
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

jdk_version = node['java']['jdk_version']
java_home   = node['java']['java_home']
source_dir  = "/usr/local/src"

bash "extract-jce-policy" do
  cwd "/tmp"
  code <<-EOH
    unzip -u "#{source_dir}/jce-policy-#{jdk_version}.zip"
    if ! [ -e "#{java_home}/jre/lib/security/local_policy.jar.bak" ]
    then
      cp "#{java_home}/jre/lib/security/local_policy.jar" "#{java_home}/jre/lib/security/local_policy.jar.bak"
    fi
    if ! [ -e  "#{java_home}/jre/lib/security/US_export_policy.jar.bak" ]
    then
      cp "#{java_home}/jre/lib/security/US_export_policy.jar" "#{java_home}/jre/lib/security/US_export_policy.jar.bak"
    fi
    mv jce/*.jar "#{java_home}/jre/lib/security/"
  EOH
  action :nothing
end

remote_file "#{source_dir}/jce-policy-#{jdk_version}.zip" do
  source   node['java']['jce_policy']["#{jdk_version}"]['url']
  checksum node['java']['jce_policy']["#{jdk_version}"]['checksum']
  notifies :run, "bash[extract-jce-policy]", :immediately
end
